import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skility_x/data_source/remote/Firebase/cloud_messaging/notification_service.dart';
import 'package:skility_x/firebase_options.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('FCM token is fetched successfully', (WidgetTester tester) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseMessaging.instance.requestPermission();

    final token = await NotificationService.getFcmToken();

    expect(token, isNotNull);
    expect(token, isNotEmpty);
    print('Token is : $token');
  });
}
