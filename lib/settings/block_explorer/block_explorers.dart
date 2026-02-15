import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vecno/vecno.dart';

part 'block_explorers.freezed.dart';
part 'block_explorers.g.dart';

const kParamPattern = '{0}';

@freezed
sealed class BlockExplorer with _$BlockExplorer {
  const BlockExplorer._();
  const factory BlockExplorer({
    required VecnoNetwork network,
    required String name,
    required String url,
    required String addressUrl,
    required String txUrl,
  }) = _BlockExplorer;

  String urlForAddress(String address) =>
      addressUrl.replaceFirst(kParamPattern, address);

  String urlForTx(String hash) => txUrl.replaceFirst(kParamPattern, hash);

  factory BlockExplorer.fromJson(Map<String, dynamic> json) =>
      _$BlockExplorerFromJson(json);
}

const vVecnoExplorerMainnet = BlockExplorer(
  network: VecnoNetwork.mainnet,
  name: 'Vecno Explorer',
  url: 'vecnoscan.org',
  addressUrl: 'https://vecnoscan.org/addresses/$kParamPattern',
  txUrl: 'https://vecnoscan.org/txs/$kParamPattern',
);

const vVecnoExplorerTestnet = BlockExplorer(
  network: VecnoNetwork.testnet,
  name: 'Vecno Explorer',
  url: 'testnet.vecnoscan.org',
  addressUrl: 'https://testnet.vecnoscan.org/addresses/$kParamPattern',
  txUrl: 'https://testnet.vecnoscan.org/txs/$kParamPattern',
);

const kBlockExplorersOptions = <String, List<BlockExplorer>>{
  kVecnoNetworkIdMainnet: [
    vVecnoExplorerMainnet,
  ],
  kVecnoNetworkIdTestnet: [
    vVecnoExplorerTestnet,
  ],
  vVecnoNetworkIdSimnet: [],
};
