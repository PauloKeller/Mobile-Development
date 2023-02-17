import 'package:flutter/material.dart';
import 'package:news/src/blocs/comments_bloc.dart';

import 'package:news/src/blocs/comments_provider.dart';
import 'package:news/src/widgets/comment.dart';

import '../models/item.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  @override
  Widget build(BuildContext context) {
    final _bloc = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: _buildBody(_bloc),
    );
  }

  Widget _buildBody(CommentsBloc bloc) {
    return StreamBuilder<Map<int, Future<ItemModel>>>(
      stream: bloc.itemWithComments,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading!");
        }

        final itemFuture = snapshot.data[itemId];

        return FutureBuilder<ItemModel>(
          future: itemFuture,
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text("Loading!");
            }

            return _buildList(itemSnapshot.data, snapshot.data);
          },
        );
      },
    );
  }

  Widget _buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    final children = <Widget>[];
    final commentsList = item.kids.map((kidId) => Comment(itemId: kidId, itemMap: itemMap, depth: 0,)).toList();

    children.add(_buildTitle(item));
    children.addAll(commentsList);

    return ListView(
      children: children,
    );
  }

  Widget _buildTitle(ItemModel item) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10),
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
