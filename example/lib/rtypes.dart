import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'rtypes.g.dart';

@SerializersFor([Person])
final Serializers _serializers = _$_serializers;
Serializers serializers = (_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

abstract class Person implements Built<Person, PersonBuilder> {
  factory Person([void Function(PersonBuilder) updates]) = _$Person;
  Person._();
  static Serializer<Person> get serializer => _$personSerializer;

  int get id;

  @nullable
  bool get child;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  BuiltList<String> get hobbies;
}
