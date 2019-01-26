import 'package:flutter/material.dart';
import 'phone.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'activity.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();

 final String no,uid;
  Registration({ this.no , this.uid}) ;

}

class _RegistrationState extends State<Registration> {

   TextEditingController nameController = new TextEditingController();
   TextEditingController emailController = new TextEditingController();
   TextEditingController ageController = new TextEditingController();
   TextEditingController distController = new TextEditingController();
   TextEditingController constiController = new TextEditingController();
   
  bool checkedState = false;
  bool male =true;
  bool female=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: new Text("Registration",style: TextStyle(color: Colors.white),),centerTitle: true,
        ),
        body: new Container(
          child: Form(
            child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: new Column(
                children: <Widget>[
                    new Container(
                      height: 100,
                      alignment: Alignment.topCenter,
                      child: Image(
                         image: AssetImage("assets/splashcut.jpeg"),
                      ),
                    ),
                     Padding(
                       padding: EdgeInsets.only(bottom: 15.0),
                     ) ,  
                    new TextFormField(
                    decoration: new InputDecoration(labelText: "Name",hintText: "Name",
                                    contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 15),
                                   icon: Icon(Icons.person,size: 30,color: Colors.indigo,),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   ),
                                   ),
                                       keyboardType: TextInputType.text,
                                       controller: nameController,
                                ),
                     Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,          
                    new TextFormField(
                    decoration: new InputDecoration(labelText: "Email",hintText: "Email",
                                    contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 15),
                                   icon: Icon(Icons.email,size: 30,color: Colors.pink,),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   )
                                   ),
                                       keyboardType: TextInputType.emailAddress,
                                       controller: emailController,
                                ), 
                  Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,              
                 new TextFormField (
                     initialValue: "${widget.no}",
                     enabled: false,
                    decoration: new InputDecoration(
                                   icon: Icon(Icons.phone,size: 30,color: Colors.green,),
                                   ),
                 ),
                 Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,
                 new TextFormField (
                     initialValue: "India",
                     enabled: false,
                    decoration: new InputDecoration(
                                   icon: Icon(Icons.map,size: 30,color: Colors.lightGreenAccent,),
                                   ),
                 ),
                 Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,
                 Row(
                     children: <Widget>[
                       new Icon(
                         Icons.people,color: Colors.orange,size: 30,
                       ),
                        Checkbox(
                      value: male,
                      onChanged: (bool value){
                        maleg(value);
                      },
                    ) ,
                    new Text("Male"),
                    Checkbox(
                      value: female,
                      onChanged: (bool value){
                        femaleg(value);
                      },
                    ) ,
                    new Text("Female"),                
                     ],
                 ),
                 Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,
                    new TextFormField(
                    decoration: new InputDecoration(labelText: "Age",hintText: "Age",
                                    contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 15),
                                   icon: Icon(Icons.person,size: 30,color: Colors.red,),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   )
                                   ),
                                       keyboardType: TextInputType.number,
                                       controller: ageController,
                                ),
                 Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person_pin,size: 30,color: Colors.lime,
                      ),
                       Checkbox(
                      value: checkedState,
                      onChanged: (bool value){
                        smth(value);
                      },
                    ) ,
                    Text("NRI"),
                 ],
                  ),
                    Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,
                     //Text("Select District",style: TextStyle(fontSize: 20,),),
                    new TextFormField(
                    decoration: new InputDecoration(labelText: "District",hintText: "District",
                                    contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 15),
                                   icon: Icon(Icons.location_city,size: 30,color: Colors.purple,),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   )
                                   ),
                                       keyboardType: TextInputType.text,
                                       controller: distController,
                                ),
                       Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,          
                     //Text("Select Constituency",style: TextStyle(fontSize: 20,),),
                     new TextFormField(
                    decoration: new InputDecoration(labelText: "Constituency",hintText: "Constituency",
                                    contentPadding: EdgeInsets.symmetric(vertical: 17,horizontal: 15),
                                   icon: Icon(Icons.location_on,size: 30,color: Colors.lime,),
                                   border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   )
                                   ),
                                       keyboardType: TextInputType.text,
                                       controller: constiController,
                                ),
                     Padding(
                       padding: EdgeInsets.only(bottom: 10.0),
                     ) ,            
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            data();
                           // _toast("No::$widget.no");
                          },
                          child: new Text("Submit"),
                          highlightColor: Colors.amber,
                          elevation: 10,
                          highlightElevation: 20,
                          color: Colors.lightBlue,
                          animationDuration: Duration(seconds: 3),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                ],
              ),
             ),
            ),
          ),
        ),
      ),
    );
  }


  void data(){
    if(nameController.text.isEmpty || emailController.text.isEmpty || ageController.text.isEmpty || distController.text.isEmpty || constiController.text.isEmpty){
      _toast("Plaese Fill All The Fields !!");
    }
    else{
      _toast("${widget.uid}");
    Firestore.instance.collection('login').document("${widget.uid}")
  .setData({ 'Name': nameController.text ,'phone':"${widget.no}" ,'Email': emailController.text,'Age':ageController.text,'District':distController.text,'Constituency':constiController.text,'Male': male.toString(),'NRI':checkedState });
    _toast("User added in firestore");
     Navigator.push(context, 
     new MaterialPageRoute(builder: (context) => Activity()));
  }
    }

  void maleg(bool value){
    setState(() {
          male=value;
          if(female  == true){
            female=false;
          }else female=true;
        });
  }

  void femaleg(bool value){
    setState(() {
          female=value;
          if(male  == true){
            male=false;
          }else male=true;
        });
  }

  void smth(bool value){
    setState(() {
      checkedState=value;
        });
  }
}

void _toast(str){
  Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.yellowAccent,
        textColor: Colors.black
  );
}

