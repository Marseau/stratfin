import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'TestesEmpresa': ParameterData.none(),
  'Base': ParameterData.none(),
  'Esqueceusenhaempresa': (data) async => ParameterData(
        allParams: {
          'emailusuario': getParameter<String>(data, 'emailusuario'),
        },
      ),
  'UserProfile': (data) async => ParameterData(
        allParams: {
          'cpf': getParameter<String>(data, 'cpf'),
        },
      ),
  'Base1': ParameterData.none(),
  'RecuperarSenha': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'cnpj': getParameter<String>(data, 'cnpj'),
          'cpf': getParameter<String>(data, 'cpf'),
        },
      ),
  'Base1Copy': ParameterData.none(),
  'Empresa': ParameterData.none(),
  'Consultor': ParameterData.none(),
  'Dashboard': (data) async => ParameterData(
        allParams: {
          'refUserEmpresa':
              getParameter<DocumentReference>(data, 'refUserEmpresa'),
        },
      ),
  'List06UserSearch': ParameterData.none(),
  'UserProfileCopy': (data) async => ParameterData(
        allParams: {
          'cpf': getParameter<String>(data, 'cpf'),
        },
      ),
  'Login': ParameterData.none(),
  'LoginConvidado': (data) async => ParameterData(
        allParams: {
          'docReference': getParameter<DocumentReference>(data, 'docReference'),
        },
      ),
  'LogOut': ParameterData.none(),
  'UserProfileCopy2': (data) async => ParameterData(
        allParams: {
          'cpf': getParameter<String>(data, 'cpf'),
        },
      ),
  'Cenarios': ParameterData.none(),
  'DashboardCliente': (data) async => ParameterData(
        allParams: {
          'refUserAdvisor': getParameter<String>(data, 'refUserAdvisor'),
        },
      ),
  'TestesUsuario': ParameterData.none(),
  'DashboardAdvisor': (data) async => ParameterData(
        allParams: {
          'refUserEmpresa':
              getParameter<DocumentReference>(data, 'refUserEmpresa'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
