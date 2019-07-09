import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/products/products.dart';
import 'package:flutter_app/scoped_models/scoped_models.dart';

class ProductsPage extends StatelessWidget {
  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
       return IconButton(
         icon: Icon(model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border),
         onPressed: () {
            model.toggleDisplayMode();
         },
       );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text("EasyList"),
        actions: <Widget>[
          _buildButton(),
        ],
      ),
      body: Products(),
    );
  }
}
