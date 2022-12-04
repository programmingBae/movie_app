import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

class CustomBoolConverter implements JsonConverter<Bool, String> {
  const CustomBoolConverter();

  @override
  Bool fromJson(String json) {
    // TODO: implement fromJson
    Bool b = (json == 'true') as Bool;
    return b;
  }

  @override
  String toJson(Bool object) => object.toString();
}
