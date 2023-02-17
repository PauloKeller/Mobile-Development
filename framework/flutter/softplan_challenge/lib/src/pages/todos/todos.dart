import 'package:flutter/material.dart';
import 'package:softplan_challenge/src/models/models.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:softplan_challenge/src/pages/login/login.dart';

import 'bloc.dart';
import 'provider.dart';
import 'todo_list_item.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  TodosBloc _bloc;

  void _logout() async {
    _bloc.logout();
    final route = MaterialPageRoute(builder: (_) => LoginPage());
    Navigator.pushReplacement(context, route);
  }

  Widget _buildTodosList() {
    return StreamBuilder<List<TodoModel>>(
      stream: _bloc.todos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitPouringHourglass(
            color: Theme.of(context).primaryColorLight,
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await _bloc.fetchAllTodos();
          },
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return TodoListItem(snapshot.data[index]);
            },
          ),
        );
      }
    );
  }


  @override
  void didChangeDependencies() {
    _bloc = TodosProvider.of(context);
    _bloc.fetchAllTodos();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.not_interested),
            onPressed: _logout,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _buildTodosList(),
        ),
      ),
    );
  }
}
