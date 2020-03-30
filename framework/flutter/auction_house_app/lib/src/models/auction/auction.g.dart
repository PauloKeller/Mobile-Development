// GENERATED CODE - DO NOT MODIFY BY HAND

part of auction;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Auction> _$auctionSerializer = new _$AuctionSerializer();

class _$AuctionSerializer implements StructuredSerializer<Auction> {
  @override
  final Iterable<Type> types = const [Auction, _$Auction];
  @override
  final String wireName = 'Auction';

  @override
  Iterable<Object> serialize(Serializers serializers, Auction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'minimumBid',
      serializers.serialize(object.minimumBid,
          specifiedType: const FullType(int)),
      'buyOut',
      serializers.serialize(object.buyOut, specifiedType: const FullType(int)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
      'item',
      serializers.serialize(object.item, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Auction deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuctionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'minimumBid':
          result.minimumBid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'buyOut':
          result.buyOut = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Auction extends Auction {
  @override
  final String id;
  @override
  final int minimumBid;
  @override
  final int buyOut;
  @override
  final String owner;
  @override
  final String item;

  factory _$Auction([void Function(AuctionBuilder) updates]) =>
      (new AuctionBuilder()..update(updates)).build();

  _$Auction._({this.id, this.minimumBid, this.buyOut, this.owner, this.item})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Auction', 'id');
    }
    if (minimumBid == null) {
      throw new BuiltValueNullFieldError('Auction', 'minimumBid');
    }
    if (buyOut == null) {
      throw new BuiltValueNullFieldError('Auction', 'buyOut');
    }
    if (owner == null) {
      throw new BuiltValueNullFieldError('Auction', 'owner');
    }
    if (item == null) {
      throw new BuiltValueNullFieldError('Auction', 'item');
    }
  }

  @override
  Auction rebuild(void Function(AuctionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuctionBuilder toBuilder() => new AuctionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Auction &&
        id == other.id &&
        minimumBid == other.minimumBid &&
        buyOut == other.buyOut &&
        owner == other.owner &&
        item == other.item;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), minimumBid.hashCode), buyOut.hashCode),
            owner.hashCode),
        item.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Auction')
          ..add('id', id)
          ..add('minimumBid', minimumBid)
          ..add('buyOut', buyOut)
          ..add('owner', owner)
          ..add('item', item))
        .toString();
  }
}

class AuctionBuilder implements Builder<Auction, AuctionBuilder> {
  _$Auction _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _minimumBid;
  int get minimumBid => _$this._minimumBid;
  set minimumBid(int minimumBid) => _$this._minimumBid = minimumBid;

  int _buyOut;
  int get buyOut => _$this._buyOut;
  set buyOut(int buyOut) => _$this._buyOut = buyOut;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _item;
  String get item => _$this._item;
  set item(String item) => _$this._item = item;

  AuctionBuilder();

  AuctionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _minimumBid = _$v.minimumBid;
      _buyOut = _$v.buyOut;
      _owner = _$v.owner;
      _item = _$v.item;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Auction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Auction;
  }

  @override
  void update(void Function(AuctionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Auction build() {
    final _$result = _$v ??
        new _$Auction._(
            id: id,
            minimumBid: minimumBid,
            buyOut: buyOut,
            owner: owner,
            item: item);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
