import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Create a global instance of
// FlutterLocalNotificationsPlugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // Ensure Flutter bindings are
  // initialized before using plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Android initialization settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS (Darwin) initialization settings
  const DarwinInitializationSettings
  initializationSettingsDarwin = DarwinInitializationSettings(
    // Optionally, add a callback to handle notifications while the app is in foreground
    // onDidReceiveLocalNotification: (id, title, body, payload) async {
    //   // Handle iOS foreground notification
    // },
  );

  // Combine both platform settings.
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  // Initialize the plugin with a callback
  // for when a notification is tapped
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // Handle notification tapped logic here
      print('Notification payload: ${response.payload}');
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Notification Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Replace the _showNotification function accordingly
  // Method to show a local notification
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id', // Unique channel ID
          'your_channel_name', // Visible channel name
          channelDescription: 'Your channel description',
          importance: Importance.max,
          priority: Priority.high,
        );

    // For iOS, you can add additional configuration
    // inside DarwinNotificationDetails
    // For this example, we use the Android-specific details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID.
      'Hello!', // Notification title.
      'Button pressed notification', // Notification body.
      platformChannelSpecifics,
      payload: 'Default_Sound', // Optional payload.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: _showNotification,
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}
