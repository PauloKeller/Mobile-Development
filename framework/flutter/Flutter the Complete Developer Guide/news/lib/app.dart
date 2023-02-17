import 'package:flutter/material.dart';

import 'src/blocs/comments_provider.dart';
import 'src/screens/news_list.dart';
import 'src/screens/news_detail.dart';
import 'src/blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: CommentsProvider(
        child: MaterialApp(
          title: "News!",
          onGenerateRoute: _routes,
        ),
      ),
    );
  }

  Route _routes(RouteSettings settings) {
    if(settings.name == "/") {
      return MaterialPageRoute(
          builder: (context) {
            final bloc = StoriesProvider.of(context);
            bloc.fetchTopIds();

            return NewsList();
          }
      );
    }

    return MaterialPageRoute(
        builder: (context) {
          final bloc = CommentsProvider.of(context);
          final itemId = int.parse(settings.name.replaceFirst("/", ""));

          bloc.fetchItemWithComments(itemId);

          return NewsDetail(itemId: itemId);
        }
    );
  }
}
