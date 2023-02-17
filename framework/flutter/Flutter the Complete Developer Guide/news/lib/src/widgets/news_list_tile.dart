import 'package:flutter/material.dart';
import 'package:news/src/models/item.dart';
import 'package:news/src/blocs/stories_provider.dart';

import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget buildTile( BuildContext context, ItemModel item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(item.title),
          subtitle: Text("${item.score} votes"),
          onTap: () {
            Navigator.pushNamed(context, "${item.id}");
          },
          trailing: Column(
            children: <Widget>[
              Icon(
                Icons.comment,
                color: Colors.blueAccent,
              ),
              Text("${item.descendants}")
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Divider(
            height: 8.0,
            indent: 10.0,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return  LoadingContainer();
            }

            return buildTile(context, itemSnapshot.data);
          },
        );
      },
    );
  }
}
