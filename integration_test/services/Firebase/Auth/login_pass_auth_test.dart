import 'package:firebase_core/firebase_core.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skility_x/data_source/repository/auth/login_pass/auth_login_pass_repo.dart';
import 'package:skility_x/firebase_options.dart';

void main() async {
  // initilizind firebase
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  });
  // testing
  testWidgets('Login with real Firebase user', (tester) async {
    const password = '123456';

    // invalid credentials
    // const email1 = 'test@example.com';

    // valid credentials
    const email2 = 'am824273@gmail.com'; // dummy email

    // final result1 = await AuthLoginPassRepo.login(email1, password);
    final result2 = await AuthLoginPassRepo.login(email2, password);
    // final result3 = await AuthLoginPassRepo.signIn(email2, password);

    // testing results
    // expect(result1, isTrue); // false - will fail coz of invalid crdens
    // expect(result1, isFalse); // true - will fail coz of the condition

    // expect(result2, isTrue); // will only work
    expect(result2, isTrue); // will only work
    // expect(result3, isTrue); // will only work
    // expect(result2, isFalse); // will always fail but only for - for checking
  });
}
