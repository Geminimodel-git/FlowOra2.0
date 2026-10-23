import 'package:flutter_test/flutter_test.dart';
import 'package:flowora/main.dart';

void main() {
  test('FLOWORA web app URL uses HTTPS and the expected host', () {
    final uri = Uri.parse(floworaUrl);
    expect(uri.scheme, 'https');
    expect(uri.host, 'geminimodel-git.github.io');
    expect(uri.path, '/FlowOra2.0/');
  });
}
