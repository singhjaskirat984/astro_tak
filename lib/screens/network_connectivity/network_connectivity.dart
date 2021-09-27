import 'package:astro_tak/providers/connectivity_service_provider.dart';
import 'package:astro_tak/screens/network_connectivity/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkConnectivity extends StatelessWidget {
  final Widget child;

  NetworkConnectivity({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityServiceProvider>(context);
    return StreamBuilder<ConnectivityStatus>(
      stream: connectionStatus.connectionStatusController.stream,
      builder: (_, stream) {
        print('Network stream ${stream.data}');
        if (stream.data == ConnectivityStatus.WiFi ||
            stream.data == ConnectivityStatus.Cellular) {
          return child;
        }
        return ErrorScreen();
      },
    );
  }
}
