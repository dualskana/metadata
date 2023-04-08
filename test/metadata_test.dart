import 'package:flutter_test/flutter_test.dart';
import 'package:metadata/metadata.dart';
import 'package:metadata/metadata_platform_interface.dart';
import 'package:metadata/metadata_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMetadataPlatform
    with MockPlatformInterfaceMixin
    implements MetadataPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MetadataPlatform initialPlatform = MetadataPlatform.instance;

  test('$MethodChannelMetadata is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMetadata>());
  });

  test('getPlatformVersion', () async {
    Metadata metadataPlugin = Metadata();
    MockMetadataPlatform fakePlatform = MockMetadataPlatform();
    MetadataPlatform.instance = fakePlatform;

    expect(await metadataPlugin.getPlatformVersion(), '42');
  });
}
