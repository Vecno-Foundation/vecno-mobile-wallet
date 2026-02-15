import 'bip32/bip32.dart';

const String kVecnoNetworkMainnet = 'mainnet';
const String kVecnoNetworkTestnet = 'testnet';
const String kVecnoNetworkSimnet = 'simnet';

const String kVecnoNetworkIdMainnet = '$kVecnoNetworkMainnet';
const String kVecnoNetworkIdTestnet = '$kVecnoNetworkTestnet';
const String vVecnoNetworkIdSimnet = '$kVecnoNetworkSimnet';

const int kMainnetRpcPort = 7110;
const int kTestnetRpcPort = 7210;
const int kSimnetRpcPort = 7310;

enum VecnoNetwork {
  mainnet,
  testnet,
  simnet;

  static VecnoNetwork? tryParse(String network) {
    return switch (network) {
      kVecnoNetworkMainnet => VecnoNetwork.mainnet,
      kVecnoNetworkTestnet => VecnoNetwork.testnet,
      kVecnoNetworkSimnet => VecnoNetwork.simnet,
      _ => null,
    };
  }

  int get defaultRpcPort => switch (this) {
        VecnoNetwork.mainnet => kMainnetRpcPort,
        VecnoNetwork.testnet => kTestnetRpcPort,
        VecnoNetwork.simnet => kSimnetRpcPort
      };
}

VecnoNetwork networkForPort(int port) {
  switch (port) {
    case kMainnetRpcPort:
      return VecnoNetwork.mainnet;
    case kTestnetRpcPort:
      return VecnoNetwork.testnet;
    case kSimnetRpcPort:
      return VecnoNetwork.simnet;
    default:
      return VecnoNetwork.mainnet;
  }
}

VecnoNetwork networkForVpub(String vpub) {
  return switch (vpub.substring(0, 4)) {
    'vpub' => VecnoNetwork.mainnet,
    'vtub' => VecnoNetwork.testnet,
    'vsub' => VecnoNetwork.simnet,
    _ => VecnoNetwork.mainnet,
  };
}

NetworkType networkTypeForNetwork(VecnoNetwork network) {
  switch (network) {
    case VecnoNetwork.mainnet:
      return vecnoMainnet;
    case VecnoNetwork.testnet:
      return vecnoTestnet;
    case VecnoNetwork.simnet:
      return vecnoSimnet;
  }
}

final vecnoMainnet = NetworkType(
  messagePrefix: 'Vecno Signed Message:\n',
  bech32: 'vecno',
  bip32: Bip32Type(
    public: 0x045f1cf6,
    private: 0x045f18bc,
  ),
  wif: 0x80,
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);

final vecnoTestnet = NetworkType(
  messagePrefix: 'Vecno Signed Message:\n',
  bech32: 'vecnotest',
  wif: 0xef,
  bip32: Bip32Type(
    public: 0x04608c09,
    private: 0x046087cf,
  ),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);

final vecnoSimnet = NetworkType(
  messagePrefix: 'Vecno Signed Message:\n',
  bech32: 'vecnosim',
  wif: 0x64,
  bip32: Bip32Type(
    public: 0x0390467d,
    private: 0x03904242,
  ),
  pubKeyHash: 0x00,
  scriptHash: 0x05,
  opreturnSize: 80,
);
