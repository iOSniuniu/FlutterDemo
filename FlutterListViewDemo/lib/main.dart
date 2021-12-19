import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:convert' as convert;
import 'model.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter ListView Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  // var url = Uri.parse('https://api.github.com/events');

  //记录当前底部导航选中了那个
  int _currentIndex = 0;

  //页面
  List pageViews = [HomePage(),MinePage()];

  //底部导航bar
  List <BottomNavigationBarItem>bottomBarItmes = [
    BottomNavigationBarItem(label: ('首页'),icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: ('我的'),icon: Icon(Icons.perm_contact_cal_outlined) ),
  ];

  void requestData(){

  }
  @override
  void initState() {
    print('初始化了数据！');
    super.initState();

    requestData();
  }

  void _incrementCounter() {
    setState(() {
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

class HomePage extends StatefulWidget
{

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  _HomePageStat createState() {
    // TODO: implement createState
    return _HomePageStat();
  }

}
class _HomePageStat extends State<HomePage> {

  List  elments = List();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build


    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
            itemCount: elments.length,
            itemBuilder: (BuildContext context, int index){
              EventModel model = elments[index];
              ListTile(
                title: "123",
                subtitle: "222",
              );
              return CustomListViewCell(model.userName, model.repoName, model.url);
            },
            separatorBuilder: (BuildContext context, int index){
              return Divider(color: Colors.grey);
            },
        ),
      ),
      // child: RefreshIndicator(
      //   onRefresh: _refresh,
      //   child: ListView.separated(
      //     itemCount: elments.length,
      //     itemBuilder: (BuildContext context, int index){
      //           EventModel model = elments[index];
      //           return CustomListViewCell(model.userName, model.repoName, model.url);
      //       },
      //       separatorBuilder: (BuildContext context, int index){
      //          Divider(color: Colors.grey);
      //       },
      //   ),
      // ),
    );

  }
  Future refresh() async{
    // final respon = await http.get("https://api.github.com/events");
    final respon = await DefaultAssetBundle.of(context).loadString("images/data.json");
    // if(respon.statusCode == 200)
    // {
    final json = convert.jsonDecode(respon);

    setState(() {
      json.forEach((item){
        elments.add(EventModel(item));
      });
    });
  }
}
///我的界面
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

/// 自定义 ListView 的cell
class CustomListViewCell extends StatelessWidget{

  CustomListViewCell(this.title, this.subTitle, this.iconUrl)
  {
    initUI();
  }

  final String title;
  final String subTitle;
  final String  iconUrl;

  //控件
  Positioned titileP;
  Positioned subTitleP;
  Positioned iconP;
  
  //初始化UI
  void initUI(){
    titileP =  Positioned(child: Text("$title",style: TextStyle(fontSize: 18,color: Colors.black),),
      left: 80,
      top:  20,
      width: 200,
      height: 20,
    );
    subTitleP = Positioned(child: Text("$subTitle"),
      left: 80,
      top:  titileP.top + titileP.height + 10,
      width: 200,
      height: 20,
    );
    iconP = Positioned(child: Image.network(iconUrl),
      left: 10,
      top: 10,
      width: 60,
      height: 60,
    );

  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80,
      child: Stack(
        children: [iconP,titileP,subTitleP],
      ),
    );
  }


}


