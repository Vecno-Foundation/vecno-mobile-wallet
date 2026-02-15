enum AddressPrefix {
  unknown,
  vecno,
  vecnoTest,
  vecnoSim;

  static AddressPrefix parseBech32Prefix(String prefix) {
    switch (prefix) {
      case 'vecno':
        return AddressPrefix.vecno;
      case 'vecnotest':
        return AddressPrefix.vecnoTest;
      case 'vecnosim':
        return AddressPrefix.vecnoSim;
      default:
        return AddressPrefix.unknown;
    }
  }

  @override
  String toString() => name.toLowerCase();
}
