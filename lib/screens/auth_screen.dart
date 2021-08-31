import 'dart:html';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthScreeen extends StatelessWidget {
  static const routName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                Color.fromRGBO(255, 188, 117, 1).withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            )),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 94),
                      transform: Matrix4.rotationZ(-8 * (pi / 180))
                        ..translate(-10.0),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade900,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: Text(
                        "My Shop",
                        style: TextStyle(
                          color:
                              Theme.of(context).accentTextTheme.headline6.color,
                          fontSize: 50,
                          fontFamily: 'Anon',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

enum AuthMode { Login, SignUp }

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;

  final _passwordController = TextEditingController();
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.15),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: _controller,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: _controller,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Future<void> _submit() async{
    if(!_fromKey.currentState.validate()){
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try{

    }catch(error){

    }

     setState(() {
      _isLoading = false;
    });
  }

  void _switchAouthMode(){
    if(_authMode == AuthMode.Login){
      setState(() {
        _authMode = AuthMode.SignUp;
      });
      _controller.forward();
    }else{
        setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        duration: Duration(microseconds: 300),
        curve: Curves.easeIn,
        height: _authMode == AuthMode.SignUp ? 320 : 260,
        constraints: BoxConstraints(
          minHeight: _authMode == AuthMode.SignUp ? 320 : 260,
        ),
        width: deviceSize.width * .075,
        padding: EdgeInsets.all(16),
        child: Form(
          key: _fromKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val.isEmpty || !val.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) {
                    if (val.isEmpty || val.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val;
                  },
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _authMode == AuthMode.SignUp ? 60 : 0,
                    maxHeight: _authMode == AuthMode.SignUp ? 120 : 0,
                  ),
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: TextFormField(
                        enabled: _authMode == AuthMode.SignUp,
                        decoration:
                            InputDecoration(labelText: "Confirm Password"),
                        obscureText: true,
                        controller: _passwordController,
                        validator: _authMode == AuthMode.SignUp
                            ? (val) {
                                if (val != _passwordController.text) {
                                  return 'Password  do not much!';
                                }
                                return null;
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
                if (_isLoading) CircularProgressIndicator(),
                RaisedButton(
                  child: Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGNUP'),
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  color:  Theme.of(context).primaryColor,
                  textColor: Theme.of(context).accentTextTheme.headline6.color,
                ),
                FlatButton(
                  child: Text(
                    '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTED',
                  ),
                  onPressed: _switchAouthMode,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
