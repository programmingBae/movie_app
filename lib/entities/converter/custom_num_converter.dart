import 'package:json_annotation/json_annotation.dart';

class CustomNumConverter implements JsonConverter<num, String> {
  const CustomNumConverter();
  @override
  num fromJson(String json) {
    // TODO: implement fromJson
    return num.parse(json);
  }

  @override
  String toJson(num object) => object.toString();
}
