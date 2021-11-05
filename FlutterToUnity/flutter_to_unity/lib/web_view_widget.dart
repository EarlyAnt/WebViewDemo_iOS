// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  static const communicateChannel = MethodChannel('com.pages.flutter'); //交互的通道名称，flutter和native是通过这个标识符进行相互间的通信
  String _nativeCallBackValue = '等待接收iOS端消息';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter访问iOS')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(_nativeCallBackValue),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                _communicateFunction("Hi iOS, I'm flutter");
              },
              child: const Text('启动游戏'))
        ]),
      ),
    );
  }

  //异步执行调用原生方法，保持页面不卡住，因为调用原生的方法可能没实现会抛出异常，所以trycatch包住
  Future<void> _communicateFunction(flutterPara) async {
    try {
      //原生方法名为callNativeMethod,flutterPara为flutter调用原生方法传入的参数，await等待方法执行
      final result = await communicateChannel.invokeMethod('callNativeMethod', flutterPara);
      //如果原生方法执行回调传值给flutter，那下面的代码才会被执行
      _nativeCallBackValue = result;
      setState(() {});
    } on PlatformException catch (e) {
      //抛出异常
      //flutter: PlatformException(001, 进入异常处理, 进入flutter的trycatch方法的catch方法)
      print(e);
    }
  }
}
