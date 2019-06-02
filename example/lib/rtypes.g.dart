// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtypes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (new Serializers().toBuilder()
      ..add(Person.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();
Serializer<Person> _$personSerializer = new _$PersonSerializer();

class _$PersonSerializer implements StructuredSerializer<Person> {
  @override
  final Iterable<Type> types = const [Person, _$Person];
  @override
  final String wireName = 'Person';

  @override
  Iterable serialize(Serializers serializers, Person object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    if (object.child != null) {
      result
        ..add('child')
        ..add(serializers.serialize(object.child,
            specifiedType: const FullType(bool)));
    }
    if (object.firstName != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.hobbies != null) {
      result
        ..add('hobbies')
        ..add(serializers.serialize(object.hobbies,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }

    return result;
  }

  @override
  Person deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'child':
          result.child = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hobbies':
          result.hobbies.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Person extends Person {
  @override
  final int id;
  @override
  final bool child;
  @override
  final String firstName;
  @override
  final BuiltList<String> hobbies;

  factory _$Person([void Function(PersonBuilder) updates]) =>
      (new PersonBuilder()..update(updates)).build();

  _$Person._({this.id, this.child, this.firstName, this.hobbies}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Person', 'id');
    }
  }

  @override
  Person rebuild(void Function(PersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonBuilder toBuilder() => new PersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Person &&
        id == other.id &&
        child == other.child &&
        firstName == other.firstName &&
        hobbies == other.hobbies;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), child.hashCode), firstName.hashCode),
        hobbies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Person')
          ..add('id', id)
          ..add('child', child)
          ..add('firstName', firstName)
          ..add('hobbies', hobbies))
        .toString();
  }
}

class PersonBuilder implements Builder<Person, PersonBuilder> {
  _$Person _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _child;
  bool get child => _$this._child;
  set child(bool child) => _$this._child = child;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  ListBuilder<String> _hobbies;
  ListBuilder<String> get hobbies =>
      _$this._hobbies ??= new ListBuilder<String>();
  set hobbies(ListBuilder<String> hobbies) => _$this._hobbies = hobbies;

  PersonBuilder();

  PersonBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _child = _$v.child;
      _firstName = _$v.firstName;
      _hobbies = _$v.hobbies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Person other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Person;
  }

  @override
  void update(void Function(PersonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Person build() {
    _$Person _$result;
    try {
      _$result = _$v ??
          new _$Person._(
              id: id,
              child: child,
              firstName: firstName,
              hobbies: _hobbies?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'hobbies';
        _hobbies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Person', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
