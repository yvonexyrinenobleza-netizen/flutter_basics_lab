import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_basics_lab/main.dart' as app;

void main() {
  testWidgets('Activity 1 opens successfully', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.textContaining('Activity 1'), findsOneWidget);
    expect(find.text('Shiela Achelle Mae B. Ytac'), findsOneWidget);
  });
}
