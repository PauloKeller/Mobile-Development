import 'package:flutter/material.dart';

import 'package:softplan_challenge/src/pages/pages.dart';

import 'bloc.dart';
import 'provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc;
  bool _isLogged = false;

  void _navigateToTodosPage() {
    _bloc.saveLogin();
    final route = MaterialPageRoute(builder: (_) => TodosPage());
    Navigator.pushReplacement(context, route);
  }

  void _submit() {
    _navigateToTodosPage();
  }

  Widget _buildLogo() {
    return Flexible(
      child: Image.asset(
        "assets/todo.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTextField() {
    return StreamBuilder<String>(
      stream: _bloc.login,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: TextField(
            onChanged: _bloc.changeLogin,
            decoration: InputDecoration(
              errorText: snapshot.error,
              labelText: "Nome",
              hintText: "Digite seu nome",
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return StreamBuilder<String>(
      stream: _bloc.login,
      builder: (context, snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: RaisedButton(
            onPressed: snapshot.hasData ? _submit : null,
            child: Text(
              "entrar".toUpperCase(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _bloc = LoginProvider.of(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _isLogged = _bloc.getIsLogged();

    if (_isLogged) {
      Future.delayed(Duration(seconds: 0), () =>  _navigateToTodosPage());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("tarefa fácil".toUpperCase()),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildLogo(),
              _buildTextField(),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
