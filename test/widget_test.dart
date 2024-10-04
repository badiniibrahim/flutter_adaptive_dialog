import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive_dialog/adaptive_alert_dialog_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'AdaptiveAlertDialog shows iOS dialog with correct title and content',
      (WidgetTester tester) async {
    // Arrange
    // Set the platform to iOS
    // Use a mock platform for testing
    // You can use a package like `mockito` to create a mock class for Platform.
    // Here, we will assume the platform is iOS for this test
    const MethodChannel('flutter/platform')
        .setMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getPlatformVersion') {
        return 'iOS';
      }
      return null;
    });

    // Build the app and trigger a frame
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Center(child: Text('Test App')))));

    // Act
    final result = await AdaptiveAlertDialog.show(
      context: tester.element(find.text('Test App')),
      title: 'Confirm Action',
      content: 'Do you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    // Assert
    expect(result,
        null); // Check if the dialog returns null before any button is pressed

    // Simulate pressing the confirmation button
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle(); // Wait for the dialog to close

    // Assert the dialog returns true on confirmation
    expect(result, true);
  });

  testWidgets(
      'AdaptiveAlertDialog shows Android dialog with correct title and content',
      (WidgetTester tester) async {
    // Arrange
    // Set the platform to Android
    const MethodChannel('flutter/platform')
        .setMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getPlatformVersion') {
        return 'Android';
      }
      return null;
    });

    // Build the app and trigger a frame
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Center(child: Text('Test App')))));

    // Act
    final result = await AdaptiveAlertDialog.show(
      context: tester.element(find.text('Test App')),
      title: 'Confirm Action',
      content: 'Do you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    // Assert
    expect(result,
        null); // Check if the dialog returns null before any button is pressed

    // Simulate pressing the confirmation button
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle(); // Wait for the dialog to close

    // Assert the dialog returns true on confirmation
    expect(result, true);
  });

  testWidgets('AdaptiveAlertDialog shows cancellation button',
      (WidgetTester tester) async {
    // Arrange
    // Build the app and trigger a frame
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Center(child: Text('Test App')))));

    // Act
    final result = await AdaptiveAlertDialog.show(
      context: tester.element(find.text('Test App')),
      title: 'Confirm Action',
      content: 'Do you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    // Simulate pressing the cancellation button
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle(); // Wait for the dialog to close

    // Assert the dialog returns false on cancellation
    expect(result, false);
  });
}
