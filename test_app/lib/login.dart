
import 'package:flutter/material.dart';
import 'package:test_app/home.dart';

import 'package:test_app/common/session_manager_provider.dart';
import 'package:test_app/common/session_manager_data.dart';

class UserLoginPage extends StatelessWidget {
  SessionManagerData sessionData = SessionManagerData();

 @override
   Widget build(BuildContext context) {
     return SessionManagerProvider(
        sessionData:sessionData,
        child:MaterialApp(
       theme:ThemeData(
         primarySwatch:Colors.deepOrange,
         accentColor: Colors.deepPurple
       ),
       home: LoginPage(),
       debugShowCheckedModeBanner: false,
       routes: {
        "/dashboard": (_) => new DashboardPage(),
      },
     )
     );
   }

}


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState()  => _LoginPageState();

}
class _LoginPageState extends State<LoginPage> {
SessionManagerData sessionData;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    sessionData = SessionManagerProvider.of(context);
    return  Scaffold(
         appBar:  AppBar(
          title:  Text('Login'),
        ),
        body: SafeArea(
          
          child:  Form(
            
          child:  SingleChildScrollView(  
          padding: const EdgeInsets.all( 20.0),
        
          child:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           
          children: <Widget>[
            
            TextFormField(
              
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Id',
                    suffixStyle: TextStyle(color: Colors.green),
                    
                  ),
                  maxLines: 1,
               ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText:true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixStyle: TextStyle(color: Colors.green)
                  ),
                  maxLines: 1,
               ),
               RaisedButton(
            onPressed: _login_clicked,
            child: Text('Login'),
          )

          ],
        ),
          ),
        ),
        ),
    );
  }
  
void _login_clicked(){
   setState(() {
        print('LOGIN BUTTON CLICKED');
       print('Get Session ');
       var  sessionData = SessionManagerProvider.of(context);

        sessionData.sessionId = 'ABCDEFH12345546565656565ABCDS';
        sessionData.userName = 'RAM PAL VVERMA';
         print('Received User Session ');
         Navigator.pushReplacementNamed(context, "/dashboard");

      /*  Navigator.push(context,  MaterialPageRoute<DashboardPage>(
          builder: (BuildContext context) =>  DashboardPage()
          

        ));*/

      });
 }
}