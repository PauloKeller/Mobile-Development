import 'package:flutter/material.dart';

import 'provider.dart';
import 'package:softplan_challenge/src/models/models.dart';
import 'package:softplan_challenge/src/pages/pages.dart';

class TodoListItem extends StatelessWidget {
  final TodoModel todo;

  TodoListItem(this.todo);

  void _navigateToOwnerPage(BuildContext context, UserModel user) {
    final route = MaterialPageRoute(builder: (_) => OwnerPage(user: user,));
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = TodosProvider.of(context);

    return Card(
      child: InkWell(
        onTap: ()  async {
          final user = await _bloc.fetchUserById(todo.userId);
          _navigateToOwnerPage(context, user);
        } ,
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Icon(
                        todo.completed ? Icons.done : Icons.close,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(todo.title),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
