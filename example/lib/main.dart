import 'package:flutter/material.dart';
import 'package:flutter_adaptive_dialog/adaptive_alert_dialog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive Alert Dialog Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Adaptive Alert Dialog"),
        ),
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () async {
                  bool? result = await AdaptiveAlertDialog.show(
                    context: context,
                    title: "Confirm Action",
                    content: "Do you want to proceed with this action?",
                    confirmText: "Yes",
                    cancelText: "No",
                    titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                    contentStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    confirmButtonStyle: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold), // Style for Yes button
                    cancelButtonStyle: const TextStyle(
                        color: Colors.red), // Style for No button
                  );

                  if (result == true) {
                    print("User confirmed.");
                  } else {
                    print("User canceled.");
                  }
                },
                child: const Text("Show Dialog"),
              );
            },
          ),
        ),
      ),
    );
  }
}
