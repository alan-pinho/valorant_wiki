import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/core/http/dio_http_service.dart';
import 'package:valowiki/core/http/models/agent_model.dart';
import 'package:valowiki/env.dart';

class AgentsHttpService {
  final FlutterLocalization _localization;
  final DioHttpService _dioHttpService;
  final EnvironmentConfig _env;
  final String url = 'v1/agents';

  AgentsHttpService(
    this._dioHttpService,
    this._localization,
    this._env,
  );

  String? get language => _localization.currentLocale?.languageCode ?? 'pt-BR';

  Future<AgentModel> getAgent(String agentId) async {
    final response = await _dioHttpService.get(
      '${_env.apiLink}$url/$agentId',
      queryParams: {'language': language},
    );
    return AgentModel.fromJson(response.data);
  }

  Future<List<AgentModel>> listAgents() async {
    final response = await _dioHttpService.get(
      '${_env.apiLink}$url',
      queryParams: {'language': language, 'isPlayableCharacter': true},
    );

    return (response.data as List).map((e) => AgentModel.fromJson(e)).toList();
  }
}
