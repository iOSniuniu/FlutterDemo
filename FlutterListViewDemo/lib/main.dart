import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Demo',
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
      home: MyHomePage(title: 'Flutter ListView Home Page'),
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

class _MyHomePageState extends State<MyHomePage>{

  //记录当前底部导航选中了那个
  int _currentIndex = 0;

  //页面
  List pageViews = [HomePage(),MinePage()];

  //底部导航bar
  List <BottomNavigationBarItem>bottomBarItmes = [
    BottomNavigationBarItem(label: ('首页'),icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: ('我的'),icon: Icon(Icons.perm_contact_cal_outlined) ),
  ];

  @override
  void initState() {
    print('初始化了数据！');
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: this.pageViews[_currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar:BottomNavigationBar(items: bottomBarItmes,
        currentIndex: _currentIndex,
        onTap: (int index){
        print("index = $index");
          setState(() {
            _currentIndex = index;
          });
        },
      ) ,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget
{

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     color: Colors.white,
     alignment: Alignment.center,
     child: ListView.separated(
         itemBuilder: (BuildContext content, int index){
            return ListTile(title: Text("$index"),);
        },
         separatorBuilder: (BuildContext content, int index){
            return  Divider();
         },
         itemCount: 200,
     ),
   );

  }
}
///
class MinePage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "我的",
        style: TextStyle(
            color: Colors.white,
            fontSize: 22
        ),
      ),
    );

  }
}


