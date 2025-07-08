import 'package:flutter/material.dart';
// Import the QR Flutter package to generate QR codes
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wi-Fi QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the home screen to WifiQrPage
      home: const WifiQrPage(),
    );
  }
}

// This is the page that shows the QR code
class WifiQrPage extends StatelessWidget {
  const WifiQrPage({super.key});

  // STEP 1: Define your Wi-Fi details here
  final String ssid = "AWWDA-GUEST";       // Wi-Fi name
  final String password = "Awwda@2021";    // Wi-Fi password
  final String security = "WPA";           // Use "WPA" for WPA2-Personal

  @override
  Widget build(BuildContext context) {
    // STEP 2: Create the Wi-Fi QR code string in the correct format
    String wifiData = "WIFI:T:$security;S:$ssid;P:$password;;";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wi-Fi QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // STEP 3: Generate and display the QR code
            QrImageView(
              data: wifiData,          // The string to encode into a QR code
              version: QrVersions.auto,
              size: 250.0,             // Size of the QR code
            ),

            const SizedBox(height: 20),

            // STEP 4: Show Wi-Fi info for clarity
            Text(
              "Scan to connect to Wi-Fi:\nSSID: $ssid",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
