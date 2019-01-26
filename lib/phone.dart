import 'package:flutter/material.dart';  
import 'package:fluttertoast/fluttertoast.dart';
import 'form.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'activity.dart';
import 'form.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {

  String ccode="+91";  String uiid;
   TextEditingController phoneController = new TextEditingController();
String phoneNo;
  String smsCode;
  String verificationId;

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        _toast('Signed in');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      _toast('verified');
      FirebaseAuth.instance.currentUser().then((user) {
                      uiid = user.uid;
                      _toast("$uiid");
      Navigator.push(context, 
       new MaterialPageRoute(builder: (context) => Registration(no: "$ccode"+phoneController.text,uid: uiid,)));
            }     
      );
      if(user == null){
          signIn();
      }
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      _toast('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      uiid = user.uid;
                      Navigator.of(context).pop();
                     // Navigator.push(context, 
                      //new MaterialPageRoute(builder: (context) => Registration(no: "$ccode"+phoneController.text,uid: uiid,)));
                    } else {
                      Navigator.of(context).pop();
                      //signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
     FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
          Navigator.push(context, 
     new MaterialPageRoute(builder: (context) => Activity()));
      _toast("Existing User");
    }).catchError((e) {
      _toast(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          routes:<String, WidgetBuilder>{
            '/activity':(BuildContext context) => Activity(),
            '/form':(BuildContext context)=>Registration(),
          } ,
          home: Scaffold(
          backgroundColor:  Colors.white,
          body: SingleChildScrollView(
                child: new Container(
                child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                          color: Colors.blue,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsetsDirectional.only(top: 110,bottom: 180),
                                child: Column(
                                  children: <Widget>[
                                    Text("Punjabi Ekta",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold,)),
                                    SizedBox(
                                      height: 10.0,
                                      child: new Center(
                                      child: new Container(
                                        margin: new EdgeInsetsDirectional.only(start: 90.0, end: 90.0),
                                        height: 5.0,
                                        color: Colors.yellow,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                             child: new Center(
                             child: new Container(
                              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                              height: 10.0,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                    child: Text("Country Code",style: TextStyle(color: Colors.blue,fontSize: 20,decorationColor: Colors.black,),)
                                    ),
                                    CountryPickerDropdown(
                                      initialValue: 'in',
                                      itemBuilder: _buildDropdownItem,
                                      onValuePicked: (Country country) {
                                         ccode = "+${country.phoneCode}";
                                         _toast("+${country.phoneCode}");
                                        print("${country.name}");
                                      },
                                    ), 
                                ],
                              ),
                            ),
                            Padding(
                                 padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                                  child: TextField(
                                    onChanged: (value){
                                       this.phoneNo = "+91"+value;
                                      // _toast(phoneNo);
                                    },
                                 decoration: new InputDecoration(labelText: "Phone No.",
                                 icon: Icon(Icons.phone_iphone,size: 40,),
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20.0),
                                 )
                                 ),
                                     keyboardType: TextInputType.number,
                                     controller: phoneController,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Builder(
                                    builder: (context)=> OutlineButton(
                                  onPressed: () {
                                    verifyPhone(); 
                                   //nxtScreen();
                                  },
                                  highlightElevation: 8,
                                  highlightColor: Colors.deepOrange,
                                  color: Colors.black,
                                   padding: EdgeInsets.symmetric(horizontal: 20), 
                                  textColor: Colors.blue,
                                  child: Text("Submit"),
                                  highlightedBorderColor: Colors.black,
                                  
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
              ),
            ),
          ),
      ),
    );

  }

   Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );


  void nxtScreen(){
    if(phoneController.text.length == 10){
       Navigator.push(context, 
     new MaterialPageRoute(builder: (context) => Registration(no: phoneController.text,uid: uiid,)));
    }else{
        _toast("Please Enter a Valid Number!");
    }
}


}

void _toast(str){
  Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.yellow,
        textColor: Colors.black
  );
}

