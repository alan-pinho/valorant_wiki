import 'package:valowiki/core/http/clients/valorant_api_client.dart';
import 'package:valowiki/core/http/models/agent_model.dart';

class AgentsHttpService {
  final ValorantApiClient _valorantApiClient;
  final String url = 'v1/agents';

  AgentsHttpService(
    this._valorantApiClient,
  );

  Future<AgentModel> getAgent(String agentId) async {
    final response = await _valorantApiClient.get(
      '$url/$agentId',
    );
    return AgentModel.fromJson(response.data);
  }

  Future<List<AgentModel>> listAgents() async {
    final response = await _valorantApiClient.get(
      url,
      queryParams: {'isPlayableCharacter': true},
    );

    return (response.data as List).map((e) => AgentModel.fromJson(e)).toList();
  }
}
