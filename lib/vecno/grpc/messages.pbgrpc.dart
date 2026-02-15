// This is a generated file - do not edit.
//
// Generated from messages.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pb.dart' as $0;

export 'messages.pb.dart';

@$pb.GrpcServiceName('protowire.RPC')
class RPCClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  RPCClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.VecnodResponse> messageStream(
    $async.Stream<$0.VecnodRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$messageStream, request, options: options);
  }

  // method descriptors

  static final _$messageStream =
      $grpc.ClientMethod<$0.VecnodRequest, $0.VecnodResponse>(
          '/protowire.RPC/MessageStream',
          ($0.VecnodRequest value) => value.writeToBuffer(),
          $0.VecnodResponse.fromBuffer);
}

@$pb.GrpcServiceName('protowire.RPC')
abstract class RPCServiceBase extends $grpc.Service {
  $core.String get $name => 'protowire.RPC';

  RPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.VecnodRequest, $0.VecnodResponse>(
        'MessageStream',
        messageStream,
        true,
        true,
        ($core.List<$core.int> value) => $0.VecnodRequest.fromBuffer(value),
        ($0.VecnodResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.VecnodResponse> messageStream(
      $grpc.ServiceCall call, $async.Stream<$0.VecnodRequest> request);
}
