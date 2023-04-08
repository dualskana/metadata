import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metadata_method_channel.dart';

abstract class MetadataPlatform extends PlatformInterface {
  /// Constructs a MetadataPlatform.
  MetadataPlatform() : super(token: _token);

  static final Object _token = Object();

  static MetadataPlatform _instance = MethodChannelMetadata();

  /// The default instance of [MetadataPlatform] to use.
  ///
  /// Defaults to [MethodChannelMetadata].
  static MetadataPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MetadataPlatform] when
  /// they register themselves.
  static set instance(MetadataPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getMetadata(String key) {
    throw UnimplementedError(
        'getMetadata(String key) has not been implemented.');
  }
}
