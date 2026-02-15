import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import '../grpc/messages.pbgrpc.dart';
import '../grpc/rpc.pb.dart';
import '../network.dart';

class RpcException implements Exception {
  final RPCError error;

  const RpcException(this.error);

  String get message => error.message;

  @override
  String toString() => message;
}

class VoidVecnoClient extends VecnoClient {
  VoidVecnoClient()
      : super(
          channel: ClientChannel(
            'localhost',
            port: 7110,
            options: ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          ),
        );

  @override
  Future<VecnodResponse> _singleRequest(VecnodRequest message) async {
    return VecnodResponse();
  }

  @override
  Stream<VecnodResponse> _streamRequest(VecnodRequest message) {
    return StreamController<VecnodResponse>().stream;
  }

  @override
  Future<void> close() async {}

  @override
  Future<void> terminate() async {}
}

class VecnoClient {
  late final ClientChannel channel;
  late final RPCClient rpcClient;

  VecnoClient({required this.channel}) : rpcClient = RPCClient(channel);

  factory VecnoClient.url(String url, {bool isSecure = false}) {
    final uri = Uri.parse(
      url.contains('://')
          ? url
          : (isSecure ? 'https://$url' : 'http://$url'),
    );

    final channel = ClientChannel(
      uri.host,
      port: uri.hasPort
          ? uri.port
          : (isSecure ? 443 : kMainnetRpcPort),
      options: ChannelOptions(
        credentials: isSecure
            ? ChannelCredentials.secure()
            : ChannelCredentials.insecure(),
      ),
    );

    return VecnoClient(channel: channel);
  }

  Future<void> close() => channel.shutdown();

  Future<void> terminate() => channel.terminate();

  Future<VecnodResponse> _singleRequest(VecnodRequest message) async {
    final request = StreamController<VecnodRequest>();
    final response = rpcClient.messageStream(request.stream);

    request.sink.add(message);
    final result = await response.first;

    await response.cancel();
    await request.close();

    return result;
  }

  Stream<VecnodResponse> _streamRequest(VecnodRequest message) {
    final request = StreamController<VecnodRequest>();
    final response = rpcClient.messageStream(request.stream);

    request.sink.add(message);

    return response;
  }

  Future<List<RpcBalancesByAddressesEntry>> getBalancesByAddresses(
    Iterable<String> addresses,
  ) async {
    final message = VecnodRequest(
      getBalancesByAddressesRequest: GetBalancesByAddressesRequestMessage(
        addresses: addresses,
      ),
    );

    final response = await _singleRequest(message);
    final error = response.getBalancesByAddressesResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }
    return response.getBalancesByAddressesResponse.entries;
  }

  Future<List<RpcUtxosByAddressesEntry>> getUtxosByAddresses(
    Iterable<String> addresses,
  ) async {
    final message = VecnodRequest(
      getUtxosByAddressesRequest: GetUtxosByAddressesRequestMessage(
        addresses: addresses,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.getUtxosByAddressesResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getUtxosByAddressesResponse.entries;
  }

  Stream<UtxosChangedNotificationMessage> notifyUtxosChanged(
    Iterable<String> addresses,
  ) {
    final message = VecnodRequest(
      notifyUtxosChangedRequest: NotifyUtxosChangedRequestMessage(
        addresses: addresses,
      ),
    );

    return _streamRequest(message)
        .map((event) {
          final error = event.notifyUtxosChangedResponse.error;
          if (error.message.isNotEmpty) {
            throw RpcException(error);
          }
          return event.utxosChangedNotification;
        })
        .skip(1);
  }

  Future<void> stopNotifyingUtxosChanged(List<String> addresses) async {
    final message = VecnodRequest(
      stopNotifyingUtxosChangedRequest: StopNotifyingUtxosChangedRequestMessage(
        addresses: addresses,
      ),
    );

    final response = await _singleRequest(message);
    final error = response.stopNotifyingUtxosChangedResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }
  }

  // Block notifications
  Stream<BlockAddedNotificationMessage> notifyBlockAdded() {
    final message = VecnodRequest(
      notifyBlockAddedRequest: NotifyBlockAddedRequestMessage(),
    );

    return _streamRequest(message)
        .map((event) {
          final error = event.notifyBlockAddedResponse.error;
          if (error.message.isNotEmpty) {
            throw RpcException(error);
          }
          return event.blockAddedNotification;
        })
        .skip(1);
  }

  // Submit transaction
  Future<String> submitTransaction(
    RpcTransaction transaction, {
    bool allowOrphan = false,
  }) async {
    final message = VecnodRequest(
      submitTransactionRequest: SubmitTransactionRequestMessage(
        transaction: transaction,
        allowOrphan: allowOrphan,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.submitTransactionResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.submitTransactionResponse.transactionId;
  }

  Future<({String transactionId, RpcTransaction replacedTransaction})>
      submitTransactionReplacement(RpcTransaction transaction) async {
    final message = VecnodRequest(
      submitTransactionReplacementRequest:
          SubmitTransactionReplacementRequestMessage(
        transaction: transaction,
      ),
    );

    final result = await _singleRequest(message);
    final response = result.submitTransactionReplacementResponse;

    if (response.error.message.isNotEmpty) {
      throw RpcException(response.error);
    }

    return (
      transactionId: response.transactionId,
      replacedTransaction: response.replacedTransaction,
    );
  }

  // Fee estimate
  Future<RpcFeeEstimate> getFeeEstimate() async {
    final message = VecnodRequest(
      getFeeEstimateRequest: GetFeeEstimateRequestMessage(),
    );

    final result = await _singleRequest(message);
    final error = result.getFeeEstimateResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getFeeEstimateResponse.estimate;
  }

  // Mempool
  Future<RpcMempoolEntry> getMempoolEntry({
    required String txId,
    bool includeOrphanPool = true,
    bool filterTransactionPool = true,
  }) async {
    final message = VecnodRequest(
      getMempoolEntryRequest: GetMempoolEntryRequestMessage(
        txId: txId,
        includeOrphanPool: includeOrphanPool,
        filterTransactionPool: filterTransactionPool,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.getMempoolEntryResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getMempoolEntryResponse.entry;
  }

  Future<List<RpcMempoolEntry>> getMempoolEntries({
    bool includeOrphanPool = true,
    bool filterTransactionPool = true,
  }) async {
    final message = VecnodRequest(
      getMempoolEntriesRequest: GetMempoolEntriesRequestMessage(
        includeOrphanPool: includeOrphanPool,
        filterTransactionPool: filterTransactionPool,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.getMempoolEntriesResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getMempoolEntriesResponse.entries;
  }

  Future<List<RpcMempoolEntryByAddress>> getMempoolEntriesByAddresses(
    Iterable<String> addresses, {
    bool filterTransactionPool = true,
    bool includeOrphanPool = true,
  }) async {
    final message = VecnodRequest(
      getMempoolEntriesByAddressesRequest:
          GetMempoolEntriesByAddressesRequestMessage(
        addresses: addresses,
        filterTransactionPool: filterTransactionPool,
        includeOrphanPool: includeOrphanPool,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.getMempoolEntriesByAddressesResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getMempoolEntriesByAddressesResponse.entries;
  }

  // Network info
  Future<String> getCurrentNetwork() async {
    final message = VecnodRequest(
      getCurrentNetworkRequest: GetCurrentNetworkRequestMessage(),
    );

    final result = await _singleRequest(message);
    final error = result.getCurrentNetworkResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getCurrentNetworkResponse.currentNetwork;
  }

  Future<GetBlockDagInfoResponseMessage> getBlockDagInfo() async {
    final message = VecnodRequest(
      getBlockDagInfoRequest: GetBlockDagInfoRequestMessage(),
    );

    final result = await _singleRequest(message);
    final error = result.getBlockDagInfoResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getBlockDagInfoResponse;
  }

  Future<GetInfoResponseMessage> getInfo() async {
    final message = VecnodRequest(
      getInfoRequest: GetInfoRequestMessage(),
    );

    final result = await _singleRequest(message);
    final error = result.getInfoResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getInfoResponse;
  }

  Stream<VirtualChainChangedNotificationMessage>
      notifyVirtualSelectedParentChainChanged({
    required includeAcceptedTransactionIds,
  }) {
    final message = VecnodRequest(
      notifyVirtualChainChangedRequest: NotifyVirtualChainChangedRequestMessage(
        includeAcceptedTransactionIds: includeAcceptedTransactionIds,
      ),
    );

    return _streamRequest(message)
        .map((event) {
          final error = event.notifyVirtualChainChangedResponse.error;
          if (error.message.isNotEmpty) {
            throw RpcException(error);
          }
          return event.virtualChainChangedNotification;
        })
        .skip(1);
  }

  Future<Int64> getVirtualSelectedParentBlueScore() async {
    final message = VecnodRequest(
      getSinkBlueScoreRequest: GetSinkBlueScoreRequestMessage(),
    );

    final result = await _singleRequest(message);
    final error = result.getSinkBlueScoreResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getSinkBlueScoreResponse.blueScore;
  }

  Stream<Int64> notifyVirtualSelectedParentBlueScoreChanged() {
    final message = VecnodRequest(
      notifySinkBlueScoreChangedRequest:
          NotifySinkBlueScoreChangedRequestMessage(),
    );

    return _streamRequest(message)
        .map((event) {
          final error = event.notifySinkBlueScoreChangedResponse.error;
          if (error.message.isNotEmpty) {
            throw RpcException(error);
          }
          return event.sinkBlueScoreChangedNotification.sinkBlueScore;
        })
        .skip(1);
  }

  Stream<Int64> notifyVirtualDaaScoreChanged() {
    final message = VecnodRequest(
      notifyVirtualDaaScoreChangedRequest:
          NotifyVirtualDaaScoreChangedRequestMessage(),
    );

    return _streamRequest(message)
        .map((event) {
          final error = event.notifyVirtualDaaScoreChangedResponse.error;
          if (error.message.isNotEmpty) {
            throw RpcException(error);
          }
          return event.virtualDaaScoreChangedNotification.virtualDaaScore;
        })
        .skip(1);
  }

  Future<RpcBlock> getBlockByHash(
    String hash, {
    bool includeTransactions = true,
  }) async {
    final message = VecnodRequest(
      getBlockRequest: GetBlockRequestMessage(
        hash: hash,
        includeTransactions: includeTransactions,
      ),
    );

    final result = await _singleRequest(message);
    final error = result.getBlockResponse.error;
    if (error.message.isNotEmpty) {
      throw RpcException(error);
    }

    return result.getBlockResponse.block;
  }
}
