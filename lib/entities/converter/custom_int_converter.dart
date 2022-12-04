import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

class CustomIntConverter implements JsonConverter<Int, String> {
  const CustomIntConverter();
  @override
  Int fromJson(String json) {
    // TODO: implement fromJson
    return int.parse(json) as Int;
  }

  @override
  String toJson(Int object) => object.toString();
}
