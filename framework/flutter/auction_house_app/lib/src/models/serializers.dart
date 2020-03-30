import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:auction_house_app/src/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const[
  UserModel,
  Auction,
  Item,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();