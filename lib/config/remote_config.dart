import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:queen/core/helpers/prefs.dart';

class RemoteConfigSetup {
  bool? _isAvailable;

  Future<RemoteConfig> setupRemoteConfig() async {
    print("-=---00--from start of setupRemoteConfig");
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    await remoteConfig.ensureInitialized();
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    _isAvailable = remoteConfig.getBool("isAvailable");
    Prefs.setBool("isAvailable", remoteConfig.getBool("isAvailable"));
    print("-=-=-=-=-=-=-=-= ${remoteConfig.getBool("isAvailable")}");
    return remoteConfig;
  }

  bool get isAvailable => _isAvailable ?? false;
}
