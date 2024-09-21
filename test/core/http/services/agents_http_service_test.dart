import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/core/http/clients/valorant_api_client.dart';
import 'package:valowiki/core/http/models/agent_model.dart';
import 'package:valowiki/core/http/services/agents_http_service.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/stores/global_store.dart';

class FlutterLocalizationMock extends Mock implements FlutterLocalization {}

void main() {
  late AgentsHttpService agentsHttpService;
  late EnvironmentConfig env;
  late ValorantApiClient valorantApiClient;
  late GlobalStore globalStore;
  late FlutterLocalization localization;
  setUp(() async {
    localization = FlutterLocalizationMock();
    globalStore = GlobalStore(localization);
    env = EnvironmentConfig(PackageInfo(
      appName: 'ValoWiki',
      buildNumber: '0',
      packageName: 'com.test.local',
      version: '0.0.0',
      buildSignature: 'com.test.local',
    ));
    valorantApiClient = ValorantApiClient(globalStore, env);
    agentsHttpService = AgentsHttpService(valorantApiClient);
  });

  test('Listar personagens', () async {
    final agents = await agentsHttpService.listAgents();

    expect(agents.length, 25);
    expect(agents.first, isInstanceOf<AgentModel>());
  });

  test('Obter personagem por id', () async {
    final agents = await agentsHttpService.listAgents();
    final agent = await agentsHttpService.getAgent(agents.first.uuid);

    expect(agent, isInstanceOf<AgentModel>());
  });
}
