
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

//ViewModel
abstract class SubscriptionViewModel {
  Sink get inputEmailText;
  Stream<bool> get outputIsButtonEnabled;
  Stream<String> get outputErrorText;

  void dispose();

}
//Subscription view model

class SubscriptionViewModelImpl implements SubscriptionViewModel {

var _mailTextController = StreamController<String>.broadcast();

// implement inputEmailText
  @override
  Sink get inputEmailText => _mailTextController;


  @override
  void dispose() {
     _mailTextController.close();
  }
  @override
  Stream<String> get outputErrorText => outputIsButtonEnabled
      .map((isEnabled) => isEnabled ? null : "Invalid email");

  @override
   Stream<bool> get outputIsButtonEnabled => _mailTextController.stream
      .map((email) => EmailValidator.validate(email));

   
}
class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
  
  }
  

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  SubscriptionViewModelImpl _viewModel = SubscriptionViewModelImpl();
var controller = StreamController<String>();
TextEditingController _emailController;
  
  @override
  void initState() {
    _emailController.addListener(() => _viewModel.inputEmailText.add(_emailController.text));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Registration - Test Stream"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
          child: StreamBuilder<String>(
            stream: _viewModel.outputErrorText,
            builder: (context, snapshot){
             

            },

        ),
          ),
        ],
        
        
      ),
    );
  }

}