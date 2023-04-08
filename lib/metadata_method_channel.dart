import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'metadata_platform_interface.dart';

/// An implementation of [MetadataPlatform] that uses method channels.
class MethodChannelMetadata extends MetadataPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('metadata');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getMetadata(String key) async {
    final value = await methodChannel.invokeMethod('getMetadata', key);
    return value;
  }
}
