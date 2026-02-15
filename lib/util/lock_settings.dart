import 'vault.dart';

class LockSettings {
  static const _vecnowallet_lock = 'fvecnowallet_lock_dev';
  static const _vecnowallet_autolock = 'fvecnowallet_autolock_dev';

  static const _true = 'true';
  static const _false = 'false';

  final Vault vault;
  LockSettings(this.vault);

  Future<void> setLock(bool value) =>
      vault.set(_vecnowallet_lock, value ? _true : _false);

  Future<bool> getLock() async =>
      (await vault.get(_vecnowallet_lock) ?? _true) == _true;

  Future<void> setAutoLock(bool value) =>
      vault.set(_vecnowallet_autolock, value ? _true : _false);

  Future<bool> getAutoLock() async =>
      (await vault.get(_vecnowallet_autolock) ?? _true) == _true;
}
