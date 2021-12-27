import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  AnimationController _scaleController;
  AnimationController _opacityController;
  @override
  void initState() {
    // TODO: implement initState
    _scaleController = AnimationController(vsync: this);
    _opacityController = AnimationController(vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scaleController.dispose();
    _opacityController.dispose();
    super.dispose();
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // Animation animation1 = Tween(begin: 0.0, end: 1).chain(CurveTween(curve: Interval(0.0, 0.2))).animate(_controller);
    // Animation animation2 = Tween(begin: 1,  end: 0.0).chain(CurveTween(curve: Interval(0.5, 0.95))).animate(_controller);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:FadeTransition(
          opacity: Tween(begin: 1.0, end :0.5).animate(_opacityController),
          child:  AnimatedBuilder(
              animation: _scaleController,
              builder:(BuildContext context, Widget child){
                // print("animation1.value = $animation1.value  animation2.value = $animation2.value");
                return Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    gradient:RadialGradient(
                      colors: [Colors.blue[600],Colors.blue[100]],
                      stops: [_scaleController.value, _scaleController.value+0.1] ,
                    ),
                  ),
                );
              }
          ),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          _scaleController.duration = Duration(seconds: 4);
          _scaleController.forward();
          await Future.delayed(Duration(seconds: 4));

          _opacityController.duration = Duration(milliseconds: 1750);
          _opacityController.forward();
          await Future.delayed(Duration(seconds: 7));
          _opacityController.reset();

          _scaleController.duration = Duration(seconds: 8);
          _scaleController.reverse();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
