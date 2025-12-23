/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/cleanup_endpoint.dart' as _i3;
import '../endpoints/email_endpoint.dart' as _i4;
import '../endpoints/example_endpoint.dart' as _i5;
import '../endpoints/summary_endpoint.dart' as _i6;
import '../endpoints/voice_endpoint.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'cleanup': _i3.CleanupEndpoint()
        ..initialize(
          server,
          'cleanup',
          null,
        ),
      'email': _i4.EmailEndpoint()
        ..initialize(
          server,
          'email',
          null,
        ),
      'example': _i5.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'summary': _i6.SummaryEndpoint()
        ..initialize(
          server,
          'summary',
          null,
        ),
      'voice': _i7.VoiceEndpoint()
        ..initialize(
          server,
          'voice',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'getAuthUrl': _i1.MethodConnector(
          name: 'getAuthUrl',
          params: {
            'state': _i1.ParameterDescription(
              name: 'state',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getAuthUrl(
            session,
            params['state'],
          ),
        ),
        'exchangeCode': _i1.MethodConnector(
          name: 'exchangeCode',
          params: {
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).exchangeCode(
            session,
            params['code'],
          ),
        ),
        'refreshToken': _i1.MethodConnector(
          name: 'refreshToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).refreshToken(
            session,
            params['refreshToken'],
          ),
        ),
        'setupWatch': _i1.MethodConnector(
          name: 'setupWatch',
          params: {
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'topicName': _i1.ParameterDescription(
              name: 'topicName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).setupWatch(
            session,
            params['accessToken'],
            params['topicName'],
          ),
        ),
      },
    );
    connectors['cleanup'] = _i1.EndpointConnector(
      name: 'cleanup',
      endpoint: endpoints['cleanup']!,
      methodConnectors: {
        'getCandidates': _i1.MethodConnector(
          name: 'getCandidates',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'daysThreshold': _i1.ParameterDescription(
              name: 'daysThreshold',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).getCandidates(
            session,
            params['userId'],
            params['daysThreshold'],
          ),
        ),
        'queueBatchAction': _i1.MethodConnector(
          name: 'queueBatchAction',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'emailIds': _i1.ParameterDescription(
              name: 'emailIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'action': _i1.ParameterDescription(
              name: 'action',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).queueBatchAction(
            session,
            params['userId'],
            params['emailIds'],
            params['action'],
          ),
        ),
        'executeUnsubscribes': _i1.MethodConnector(
          name: 'executeUnsubscribes',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).executeUnsubscribes(
            session,
            params['userId'],
            params['limit'],
          ),
        ),
        'getPendingQueue': _i1.MethodConnector(
          name: 'getPendingQueue',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).getPendingQueue(
            session,
            params['userId'],
          ),
        ),
        'excludeSender': _i1.MethodConnector(
          name: 'excludeSender',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'senderEmail': _i1.ParameterDescription(
              name: 'senderEmail',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).excludeSender(
            session,
            params['userId'],
            params['senderEmail'],
            params['reason'],
          ),
        ),
        'unexcludeSender': _i1.MethodConnector(
          name: 'unexcludeSender',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'senderEmail': _i1.ParameterDescription(
              name: 'senderEmail',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).unexcludeSender(
            session,
            params['userId'],
            params['senderEmail'],
          ),
        ),
        'getExcludedSenders': _i1.MethodConnector(
          name: 'getExcludedSenders',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cleanup'] as _i3.CleanupEndpoint).getExcludedSenders(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['email'] = _i1.EndpointConnector(
      name: 'email',
      endpoint: endpoints['email']!,
      methodConnectors: {
        'listEmails': _i1.MethodConnector(
          name: 'listEmails',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pageSize': _i1.ParameterDescription(
              name: 'pageSize',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'unreadOnly': _i1.ParameterDescription(
              name: 'unreadOnly',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'subscriptionsOnly': _i1.ParameterDescription(
              name: 'subscriptionsOnly',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).listEmails(
            session,
            params['userId'],
            params['page'],
            params['pageSize'],
            params['unreadOnly'],
            params['subscriptionsOnly'],
          ),
        ),
        'getEmail': _i1.MethodConnector(
          name: 'getEmail',
          params: {
            'emailId': _i1.ParameterDescription(
              name: 'emailId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).getEmail(
            session,
            params['emailId'],
          ),
        ),
        'markAsRead': _i1.MethodConnector(
          name: 'markAsRead',
          params: {
            'emailId': _i1.ParameterDescription(
              name: 'emailId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'interactionTimeSeconds': _i1.ParameterDescription(
              name: 'interactionTimeSeconds',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).markAsRead(
            session,
            params['emailId'],
            params['interactionTimeSeconds'],
          ),
        ),
        'trackClick': _i1.MethodConnector(
          name: 'trackClick',
          params: {
            'emailId': _i1.ParameterDescription(
              name: 'emailId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'linkUrl': _i1.ParameterDescription(
              name: 'linkUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).trackClick(
            session,
            params['emailId'],
            params['linkUrl'],
          ),
        ),
        'getStaleEmails': _i1.MethodConnector(
          name: 'getStaleEmails',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'daysThreshold': _i1.ParameterDescription(
              name: 'daysThreshold',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).getStaleEmails(
            session,
            params['userId'],
            params['daysThreshold'],
          ),
        ),
        'triggerColdStart': _i1.MethodConnector(
          name: 'triggerColdStart',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['email'] as _i4.EmailEndpoint).triggerColdStart(
            session,
            params['userId'],
            params['accessToken'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i5.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['summary'] = _i1.EndpointConnector(
      name: 'summary',
      endpoint: endpoints['summary']!,
      methodConnectors: {
        'listSummaries': _i1.MethodConnector(
          name: 'listSummaries',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'pageSize': _i1.ParameterDescription(
              name: 'pageSize',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).listSummaries(
            session,
            params['userId'],
            params['page'],
            params['pageSize'],
          ),
        ),
        'getSummary': _i1.MethodConnector(
          name: 'getSummary',
          params: {
            'summaryId': _i1.ParameterDescription(
              name: 'summaryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).getSummary(
            session,
            params['summaryId'],
          ),
        ),
        'generateSummary': _i1.MethodConnector(
          name: 'generateSummary',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'periodStart': _i1.ParameterDescription(
              name: 'periodStart',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'periodEnd': _i1.ParameterDescription(
              name: 'periodEnd',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'includeAudio': _i1.ParameterDescription(
              name: 'includeAudio',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).generateSummary(
            session,
            params['userId'],
            params['periodStart'],
            params['periodEnd'],
            params['includeAudio'],
          ),
        ),
        'markAsRead': _i1.MethodConnector(
          name: 'markAsRead',
          params: {
            'summaryId': _i1.ParameterDescription(
              name: 'summaryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).markAsRead(
            session,
            params['summaryId'],
          ),
        ),
        'getAudioUrl': _i1.MethodConnector(
          name: 'getAudioUrl',
          params: {
            'summaryId': _i1.ParameterDescription(
              name: 'summaryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).getAudioUrl(
            session,
            params['summaryId'],
          ),
        ),
        'setSchedule': _i1.MethodConnector(
          name: 'setSchedule',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'cronExpression': _i1.ParameterDescription(
              name: 'cronExpression',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'timezone': _i1.ParameterDescription(
              name: 'timezone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).setSchedule(
            session,
            params['userId'],
            params['cronExpression'],
            params['timezone'],
          ),
        ),
        'getSchedule': _i1.MethodConnector(
          name: 'getSchedule',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['summary'] as _i6.SummaryEndpoint).getSchedule(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['voice'] = _i1.EndpointConnector(
      name: 'voice',
      endpoint: endpoints['voice']!,
      methodConnectors: {
        'parseIntent': _i1.MethodConnector(
          name: 'parseIntent',
          params: {
            'transcript': _i1.ParameterDescription(
              name: 'transcript',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['voice'] as _i7.VoiceEndpoint).parseIntent(
            session,
            params['transcript'],
          ),
        ),
        'generateBriefing': _i1.MethodConnector(
          name: 'generateBriefing',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'maxEmails': _i1.ParameterDescription(
              name: 'maxEmails',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['voice'] as _i7.VoiceEndpoint).generateBriefing(
            session,
            params['userId'],
            params['maxEmails'],
          ),
        ),
        'executeAction': _i1.MethodConnector(
          name: 'executeAction',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'intent': _i1.ParameterDescription(
              name: 'intent',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entities': _i1.ParameterDescription(
              name: 'entities',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['voice'] as _i7.VoiceEndpoint).executeAction(
            session,
            params['userId'],
            params['intent'],
            params['entities'],
          ),
        ),
      },
    );
  }
}
