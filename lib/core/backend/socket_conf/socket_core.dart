import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../configs/app_config.dart';

class SocketService with ChangeNotifier{
  IO.Socket? socket;
  AppConfig appConfig = AppConfig();
  createSocketConnection() {
    socket = IO.io(appConfig.socketUrl, 
      IO.OptionBuilder()
        .setTransports(['websocket']) 
        // .setExtraHeaders({
        //   'authorization':'$token',
        //   'x-custom-origin': 'dsms-provider',
        // }) 
        .build()
    );
    socket!.on("connect", (_) => print('Connected'));
    socket!.on("disconnect", (_) => print('Disconnected'));
    socket!.on("error", (_) => print('Error'));
    socket!.on('event', (data) => print(data));
    socket!.on('fromServer', (_) => print(_));
    return socket!;
  }

  onError(){
    socket!.onConnectError((data) => print(data));
  }

}