import 'package:dio/dio.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/core/http/dio_http_service.dart';
import 'package:valowiki/core/http/models/agent_model.dart';
import 'package:valowiki/core/http/services/agents_http_service.dart';
import 'package:valowiki/env.dart';

class MockFlutterLocalization extends Mock implements FlutterLocalization {}

void main() {
  late AgentsHttpService agentsHttpService;
  late DioHttpService dioHttpService;
  late EnvironmentConfig environmentConfig;
  late Dio dio;
  setUp(() async {
    dio = Dio();
    dioHttpService = DioHttpService(dio);
    environmentConfig = EnvironmentConfig(PackageInfo(
      appName: 'ValoWiki',
      buildNumber: '0',
      packageName: 'com.test.local',
      version: '0.0.0',
      buildSignature: 'com.test.local',
    ));
    agentsHttpService = AgentsHttpService(
      dioHttpService,
      MockFlutterLocalization(),
      environmentConfig,
    );
  });

  test('Listar personagens', () async {
    final agents = await agentsHttpService.agentList();

    expect(agents.length, 25);
    expect(agents.first, isInstanceOf<AgentModel>());
  });
}
