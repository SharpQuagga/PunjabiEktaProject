import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'video.dart';

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityState();
  }
}

class ActivityState extends State<Activity> with SingleTickerProviderStateMixin{
  String lifeCycle = "";
  TabController tabController;
  int photoIndex=0;


  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 5,vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new TabBarView(
        children: <Widget>[
          new Home("About Punjabi Ekta"),
          new Media("Videos"),
          new Social("Social"),
           new Msg("Messages"),
            new Social("Events"),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.indigo,
          child: new TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 9),
            labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 11),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            controller: tabController,
            indicatorWeight: 5,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(
               icon: Icon(Icons.home,color: Colors.yellow),text: "Home",
              ),
               new Tab(
              icon: Icon(Icons.ondemand_video,color: Colors.red),text: "Media",
              ),
               new Tab(
               icon: Icon(Icons.mail,color: Colors.orange),text: "Social",
              ),
               new Tab(
               icon: Icon(Icons.message,color: Colors.grey),text: "Messasge",
              ),
               new Tab(
               icon: Icon(Icons.event,color: Colors.purple),text: "Event",
              ),
            ],
          ),
      ),
    );
  }

  void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}




class Home extends StatelessWidget {
  final String title;
  Home(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       // elevation: 20,
        title: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Image(image: new AssetImage("assets/splashcut.jpeg"),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 25),
               child: Text("About Punjabi Ekta"),
             ),
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Icon(Icons.person,color: Colors.yellow,)),
          ],
        ),
      ),
          body: SingleChildScrollView(
               child: new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    height: 200.0,
                    child: new Carousel(
                        boxFit: BoxFit.cover,
                        images: [
                          AssetImage('assets/images.jpg'),
                          AssetImage('assets/images(1).jpg'),
                          AssetImage('assets/images(2).jpg'),
                          AssetImage('assets/images(3).jpg'),
                          AssetImage('assets/images(4).jpg'),
                          AssetImage('assets/images(5).jpg'),
                        ],
                        autoplay: true,
                        dotColor: Colors.yellow,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(seconds: 1),
                        autoplayDuration: Duration(seconds: 2),
                        dotBgColor: Colors.transparent,
                        dotSize: 2,   
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: new Text("Sukhpal Singh Khaira is an educated,dynamic and firebrand mass leader who is known for his bold stand on the burning issues of Punjab. Two time Mla Mr Khaira is known for his oratory skills both within and outside the Vidhan Sabha. As Leader of Opposition (LoP) Mr Khaira fearlessly fought corruption and different types of mafia backed by the Congress government. He’s known to raise people’s issues like education ,healthcare ,unemployment ,environment etc vociferously. Let’s all join hands to support Punjabi Ekta Party,a mission to cleanse Punjab and restore its original glory.",
                    style: TextStyle(fontSize: 15,wordSpacing: 2),
                    )
                    ),
                    Container(
                    margin: EdgeInsets.symmetric(horizontal: 1,vertical: 10),
                    child: Image(
                      image: AssetImage('assets/images(5).jpg'),
                    ), 
                    ),
                     Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: new Text("ਸੁਖਪਾਲ ਸਿੰਘ ਖਹਿਰਾ ਇੱਕ ਪੜ੍ਹਿਆ ਲਿਖਿਆ, ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ ਹੈ ਜੋ ਪੰਜਾਬ ਦੇ ਭਖਦੇ ਮੁੱਦਿਆਂ 'ਤੇ ਆਪਣੇ ਦਲੇਰੀ ਭਰੇ ਪੱਖ ਲਈ ਜਾਣਿਆ ਜਾਂਦਾ ਹੈ।ਦੋ ਵਾਰ ਦੇ ਐੱਮ.ਐੱਲ.ਏ. ਖਹਿਰਾ ਵਿਧਾਨ ਸਭਾ ਦੇ ਅੰਦਰ ਅਤੇ ਬਾਹਰ ਆਪਣੀ ਬੇਬਾਕ ਭਾਸ਼ਣ ਤੇ ਲੋਕਹਿਤ ਮੁੱਦੇ ਚੁੱਕਣ ਲਈ ਜਾਣੇ ਜਾਂਦੇ ਹਨ।ਜਿਵੇਂ ਕਿ ਵਿਰੋਧੀ ਧਿਰ ਦੇ ਆਗੂ (ਐਲ.ਓ.ਪੀ.) ਸ਼੍ਰੀ ਖਹਿਰਾ ਨੇ ਨਿਡਰਤਾ ਨਾਲ ਕਾਂਗਰਸ ਸਰਕਾਰ ਦੀ ਹਮਾਇਤ ਨਾਲ ਚੱਲ ਰਹੇ ਵੱਖ ਵੱਖ ਤਰ੍ਹਾਂ ਦੇ ਮਾਫੀਆ ਨਾਲ ਲੜਾਈ ਕੀਤੀ। ਉਹਨਾਂ ਨੂੰ ਲੋਕਾਂ ਦੇ ਮੁੱਦਿਆਂ ਜਿਵੇਂ ਸਿੱਖਿਆ, ਸਿਹਤ ਸੰਭਾਲ, ਬੇਰੁਜ਼ਗਾਰੀ, ਵਾਤਾਵਰਨ ਆਦਿ ਨੂੰ ਉਭਾਰਨ ਲਈ ਜਾਣਿਆ ਜਾਂਦਾ ਹੈ। ਆਉ ਪੰਜਾਬੀ ਏਕਤਾ ਪਾਰਟੀ ਦਾ ਸਮਰਥਨ ਕਰਨ ਲਈ ਹੱਥ ਮਿਲਾਈਏ, ਤਾਂ ਜੋ ਪੰਜਾਬ ਨੂੰ ਸਾਫ ਸੁਥਰਾ ਸੂਬਾ ਬਣਾਉਣ ਅਤੇ ਇਸਦਾ ਅਸਲੀ ਮਾਣ ਸਤਿਕਾਰ ਬਹਾਲ ਕੀਤਾ ਜਾ ਸਕੇ।",
                    style: TextStyle(fontSize: 15,wordSpacing: 2),
                    )
                    ),
                ],
              ),
            ),
          ),
    );
  }
}


class Social extends StatelessWidget {
  final String title;
  Social(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Image(image: new AssetImage("assets/splashcut.jpeg"),
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 65),
               child: Text(title),
             ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Coming Soon !!",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 30,fontWeight: FontWeight.bold,),
      ),
      ),
    );
  }
}

class Media extends StatefulWidget {
  final String title;
  Media(this.title);

  @override
  MediaState createState() {
    return new MediaState();
  }
}

class MediaState extends State<Media> {
   int i=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Image(image: new AssetImage("assets/splashcut.jpeg"),
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 65),
               child: Text(widget.title),
             ),
          ],
        ),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            Container(
              height: 120,
              child: GestureDetector(
                  onTap: (){
                    i=1;
                  Navigator.push(context, 
                new MaterialPageRoute(builder: (context) => Video())
                  );
                  },
                  child: new Card(
                  elevation: 6,
                  child: Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 40,
                        backgroundImage:AssetImage("assets/sukhpal.jpg"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                      ),
                      Container(
                        margin: EdgeInsets.all(1),
                        padding: EdgeInsets.all(1),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Sukhpal singh khara",style: TextStyle(fontSize: 25,wordSpacing: 2,color: Colors.blue),
                           ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Text("ਸੁਖਪਾਲ ਸਿੰਘ ਖਹਿਰਾ ਲਿਖਿਆ",style: TextStyle(fontSize: 15,wordSpacing: 2,color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              child: GestureDetector(
                  onTap: (){
                     i=2;
                Navigator.push(context, 
                new MaterialPageRoute(builder: (context) => Video())
                  );
                  },
                  child: new Card(
                  elevation: 6,
                  child: Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 40,
                        backgroundImage:AssetImage("assets/sukhpal.jpg"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                      ),
                      Container(
                        margin: EdgeInsets.all(1),
                        padding: EdgeInsets.all(1),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Sukhpal singh khara",style: TextStyle(fontSize: 25,wordSpacing: 2,color: Colors.blue),
                           ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Text("ਸੁਖਪਾਲ ਸਿੰਘ ਖਹਿਰਾ ਲਿਖਿਆ",style: TextStyle(fontSize: 15,wordSpacing: 2,color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              child: GestureDetector(
                  onTap: (){
                     i=3;
                  Navigator.push(context, 
                new MaterialPageRoute(builder: (context) => Video())
                  );
                  },
                  child: new Card(
                  elevation: 6,
                  child: Row(
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 40,
                        backgroundImage:AssetImage("assets/sukhpal.jpg"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                      ),
                      Container(
                        margin: EdgeInsets.all(1),
                        padding: EdgeInsets.all(1),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Sukhpal singh khara",style: TextStyle(fontSize: 25,wordSpacing: 2,color: Colors.blue),
                           ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            Text("ਸੁਖਪਾਲ ਸਿੰਘ ਖਹਿਰਾ ਲਿਖਿਆ",style: TextStyle(fontSize: 15,wordSpacing: 2,color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}


class Msg extends StatelessWidget {
   final String title;
  Msg(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
       appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Image(image: new AssetImage("assets/splashcut.jpeg"),
               ),
             ),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 65),
               child: Text(title),
             ),
          ],
        ),
      ),
          body: Container(
            height: 200,
            width: 360,
        color: Colors.blueAccent,
        child: Card(
          elevation: 6,
          child: GestureDetector(
              onTap: (){
                print("Pressed");
                showDialog(
          context: context,
          builder: (BuildContext context) { 
            return AlertDialog(
            title: new Text("ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ"),
            content: new Text("ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ"),
            actions: <Widget>[  
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Column(
                  children: <Widget>[
                     Container(
                margin: EdgeInsetsDirectional.only(top: 20,bottom: 20),
                child: new Text("ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ",style: TextStyle(color: Colors.blueAccent,fontSize: 20),)
                ),
                 Container(
                margin: EdgeInsetsDirectional.only(start: 20,bottom: 20,end: 20),
                child: new Text("ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ ਗਤੀਸ਼ੀਲ ਤੇ ਨਿੱਧੜਕ ਜਨਤਕ ਆਗੂ",style: TextStyle(color: Colors.black,fontSize: 15),)
                ),
                  ],
              ),
          ),
        ),
      ),
    );
  }

}



 