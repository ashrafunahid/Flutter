import 'package:flutter/material.dart';
import 'package:chatapp_firebase/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String email, String password, String username, bool isLogin, BuildContext context) async {
    AuthResult authResult;

    try{
      setState(() {
        _isLoading = true;
      });
      if(isLogin){
        authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await Firestore.instance.collection('users').document(authResult.user.uid).setData({
          'username': username,
          'email': email,
        });
      }

    } on PlatformException catch (error) {
      var message = 'An error occured, Please check your credentials!';
      if (error.message != null){
        message = error.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Theme.of(context).errorColor,));
      setState(() {
        _isLoading = false;
      });
    }
    catch (error){
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
