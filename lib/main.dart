
import 'package:brower/brower/provider/webprovider.dart';
import 'package:brower/brower/view/webview_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => webprovider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=> WebView(),
        },
      ),
    )
  );
}
