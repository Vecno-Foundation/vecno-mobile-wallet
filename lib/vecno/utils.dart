import 'dart:convert';
import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:hex/hex.dart';
import 'bip39/bip39.dart' as bip39;
import 'package:blake3_dart/blake3_dart.dart';

const vecnoDecimals = 8;
const _seedLength = 128;

bool isValidSeed(String seed) {
  return isHex(seed) && seed.length == _seedLength;
}

extension ToBigInt on Int64 {
  BigInt toUnsignedBigInt() => BigInt.parse(toStringUnsigned());
}

BigInt decodeBigInt(List<int> bytes) {
  BigInt result = BigInt.zero;
  for (final b in bytes) {
    result = (result << 8) | BigInt.from(b & 0xff);
  }
  return result;
}

Uint8List encodeBigInt(BigInt number) {
  if (number.isNegative) {
    throw ArgumentError('Cannot encode negative BigInt as unsigned bytes');
  }
  if (number == BigInt.zero) {
    return Uint8List.fromList([0]);
  }

  final bytes = <int>[];
  while (number > BigInt.zero) {
    bytes.add((number & BigInt.from(0xff)).toInt());
    number = number >> 8;
  }
  return Uint8List.fromList(bytes.reversed.toList());
}

Uint8List bigIntToBytesUnsigned(BigInt value) => encodeBigInt(value);

extension ToInt64 on BigInt {
  Int64 toInt64() {
    final bytes = bigIntToBytesUnsigned(this);
    final padded = leftPadBytes(bytes, 8);
    return Int64.fromBytesBigEndian(padded);
  }
}

/// Converts a `List<int>` to a [Uint8List].
extension AsUint8List on List<int> {
  Uint8List asUint8List() {
    final self = this;
    return (self is Uint8List) ? self : Uint8List.fromList(this);
  }
}

extension Uint8ListUtils on Uint8List {
  String get hex => bytesToHex(this);
  String get toBase64 => bytesToBase64(this);
  Uint8List get complement => Uint8List.fromList(map((e) => ~e).toList());
}

Uint8List leftPadBytes(Uint8List bytes, int size) {
  if (bytes.length >= size) {
    return bytes;
  }
  final result = Uint8List(size);
  result.setAll(size - bytes.length, bytes);
  return result;
}

Uint8List rightPadBytes(Uint8List bytes, int size) {
  if (bytes.length >= size) {
    return bytes;
  }
  final result = Uint8List(size);
  result.setAll(0, bytes);
  return result;
}

String bytesToHex(Uint8List bytes) => HEX.encode(bytes);

Uint8List hexToBytes(String hex) => Uint8List.fromList(HEX.decode(hex));

String bytesToBase64(Uint8List bytes) => base64.encode(bytes);

Uint8List base64ToBytes(String data) => base64.decode(data);

Uint8List stringToBytesUtf8(String str) => utf8.encode(str);

String bytesUtf8ToString(Uint8List bytes) => utf8.decode(bytes);

RegExp _hexRegExp = RegExp(r'^[0-9a-fA-F]+$');

bool isHex(String hex) => _hexRegExp.hasMatch(hex);

Uint8List digest({
  required Uint8List data,
  int digestSize = 32,
}) {
  return Uint8List.fromList(
    blake3(data, digestSize),
  );
}

String hash(String data) => digest(
      data: stringToBytesUtf8(data),
    ).hex;

String generateMnemonic({int strength = 256}) =>
    bip39.generateMnemonic(strength: strength);

const kMnemonicWordList = bip39.WORDLIST;

final _kMnemonicWords = kMnemonicWordList.toSet();

bool isValidMnemonicWord(String word) {
  return _kMnemonicWords.contains(word);
}

bool isValidMnemonic(String mnemonic, {bool verifyChecksum = true}) {
  final words = mnemonic.split(' ');
  return (words.length >= 12 &&
          words.length <= 24 &&
          words.length % 3 == 0) &&
      words.every((word) => isValidMnemonicWord(word)) &&
      (verifyChecksum ? bip39.validateMnemonic(mnemonic) : true);
}

String mnemonicToSeedHex(String mnemonic, {String passphrase = ''}) =>
    bip39.mnemonicToSeed(mnemonic, passphrase: passphrase).hex;