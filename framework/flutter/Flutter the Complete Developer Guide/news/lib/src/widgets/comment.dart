import 'package:flutter/material.dart';
import 'package:news/src/widgets/loading_container.dart';

import '../models/item.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: itemMap[itemId],
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final item = snapshot.data;

        final children = <Widget>[
          ListTile(
            title: _buildText(item),
            subtitle: item.by == "" ? Text("Deleted") : Text(item.by),
            contentPadding: EdgeInsets.only(
              left: (depth + 1)* 16.0,
              right: 16.0,
            ),
          ),
          Divider(),
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }
  
  Widget _buildText(ItemModel item) {
    final text = item.text.replaceAll("&#x27;", "'").replaceAll("<p>", "\p\p").replaceAll("</p>", "");

    return Text(text);
  }
}
