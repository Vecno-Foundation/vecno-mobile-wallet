// This is a generated file - do not edit.
//
// Generated from rpc.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RpcNotifyCommand extends $pb.ProtobufEnum {
  static const RpcNotifyCommand NOTIFY_START =
      RpcNotifyCommand._(0, _omitEnumNames ? '' : 'NOTIFY_START');
  static const RpcNotifyCommand NOTIFY_STOP =
      RpcNotifyCommand._(1, _omitEnumNames ? '' : 'NOTIFY_STOP');

  static const $core.List<RpcNotifyCommand> values = <RpcNotifyCommand>[
    NOTIFY_START,
    NOTIFY_STOP,
  ];

  static final $core.List<RpcNotifyCommand?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static RpcNotifyCommand? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RpcNotifyCommand._(super.value, super.name);
}

class SubmitBlockResponseMessage_RejectReason extends $pb.ProtobufEnum {
  static const SubmitBlockResponseMessage_RejectReason NONE =
      SubmitBlockResponseMessage_RejectReason._(
          0, _omitEnumNames ? '' : 'NONE');
  static const SubmitBlockResponseMessage_RejectReason BLOCK_INVALID =
      SubmitBlockResponseMessage_RejectReason._(
          1, _omitEnumNames ? '' : 'BLOCK_INVALID');
  static const SubmitBlockResponseMessage_RejectReason IS_IN_IBD =
      SubmitBlockResponseMessage_RejectReason._(
          2, _omitEnumNames ? '' : 'IS_IN_IBD');

  static const $core.List<SubmitBlockResponseMessage_RejectReason> values =
      <SubmitBlockResponseMessage_RejectReason>[
    NONE,
    BLOCK_INVALID,
    IS_IN_IBD,
  ];

  static final $core.List<SubmitBlockResponseMessage_RejectReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SubmitBlockResponseMessage_RejectReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SubmitBlockResponseMessage_RejectReason._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
