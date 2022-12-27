import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit.freezed.dart';
part 'credit.g.dart';

@JsonSerializable()
@freezed
class Credit with _$Credit {
  const factory Credit({
    required String name,
    @JsonKey(name: "profile_path") required String? profilePath,
  }) = _Credit;

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
}
