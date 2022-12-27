// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  @JsonKey(name: "poster_path")
  String get posterPath => throw _privateConstructorUsedError;
  bool get adult => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: "release_date")
  String get releaseDate =>
      throw _privateConstructorUsedError; // @JsonKey(name: "genre_ids") required List<int> genreIds,
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "original_title")
  String get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "original_language")
  String get originalLanguage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "backdrop_path")
  String get backdropPath => throw _privateConstructorUsedError;
  num get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_count")
  int get voteCount => throw _privateConstructorUsedError;
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_average")
  num get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String posterPath,
      bool adult,
      String overview,
      @JsonKey(name: "release_date") String releaseDate,
      int id,
      @JsonKey(name: "original_title") String originalTitle,
      @JsonKey(name: "original_language") String originalLanguage,
      String title,
      @JsonKey(name: "backdrop_path") String backdropPath,
      num popularity,
      @JsonKey(name: "vote_count") int voteCount,
      bool video,
      @JsonKey(name: "vote_average") num voteAverage});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = null,
    Object? adult = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? id = null,
    Object? originalTitle = null,
    Object? originalLanguage = null,
    Object? title = null,
    Object? backdropPath = null,
    Object? popularity = null,
    Object? voteCount = null,
    Object? video = null,
    Object? voteAverage = null,
  }) {
    return _then(_value.copyWith(
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as num,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$_MovieCopyWith(_$_Movie value, $Res Function(_$_Movie) then) =
      __$$_MovieCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "poster_path") String posterPath,
      bool adult,
      String overview,
      @JsonKey(name: "release_date") String releaseDate,
      int id,
      @JsonKey(name: "original_title") String originalTitle,
      @JsonKey(name: "original_language") String originalLanguage,
      String title,
      @JsonKey(name: "backdrop_path") String backdropPath,
      num popularity,
      @JsonKey(name: "vote_count") int voteCount,
      bool video,
      @JsonKey(name: "vote_average") num voteAverage});
}

/// @nodoc
class __$$_MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res, _$_Movie>
    implements _$$_MovieCopyWith<$Res> {
  __$$_MovieCopyWithImpl(_$_Movie _value, $Res Function(_$_Movie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = null,
    Object? adult = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? id = null,
    Object? originalTitle = null,
    Object? originalLanguage = null,
    Object? title = null,
    Object? backdropPath = null,
    Object? popularity = null,
    Object? voteCount = null,
    Object? video = null,
    Object? voteAverage = null,
  }) {
    return _then(_$_Movie(
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as num,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie implements _Movie {
  const _$_Movie(
      {@JsonKey(name: "poster_path") required this.posterPath,
      required this.adult,
      required this.overview,
      @JsonKey(name: "release_date") required this.releaseDate,
      required this.id,
      @JsonKey(name: "original_title") required this.originalTitle,
      @JsonKey(name: "original_language") required this.originalLanguage,
      required this.title,
      @JsonKey(name: "backdrop_path") required this.backdropPath,
      required this.popularity,
      @JsonKey(name: "vote_count") required this.voteCount,
      required this.video,
      @JsonKey(name: "vote_average") required this.voteAverage});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  @JsonKey(name: "poster_path")
  final String posterPath;
  @override
  final bool adult;
  @override
  final String overview;
  @override
  @JsonKey(name: "release_date")
  final String releaseDate;
// @JsonKey(name: "genre_ids") required List<int> genreIds,
  @override
  final int id;
  @override
  @JsonKey(name: "original_title")
  final String originalTitle;
  @override
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @override
  final String title;
  @override
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  @override
  final num popularity;
  @override
  @JsonKey(name: "vote_count")
  final int voteCount;
  @override
  final bool video;
  @override
  @JsonKey(name: "vote_average")
  final num voteAverage;

  @override
  String toString() {
    return 'Movie(posterPath: $posterPath, adult: $adult, overview: $overview, releaseDate: $releaseDate, id: $id, originalTitle: $originalTitle, originalLanguage: $originalLanguage, title: $title, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movie &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      posterPath,
      adult,
      overview,
      releaseDate,
      id,
      originalTitle,
      originalLanguage,
      title,
      backdropPath,
      popularity,
      voteCount,
      video,
      voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      __$$_MovieCopyWithImpl<_$_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {@JsonKey(name: "poster_path")
          required final String posterPath,
      required final bool adult,
      required final String overview,
      @JsonKey(name: "release_date")
          required final String releaseDate,
      required final int id,
      @JsonKey(name: "original_title")
          required final String originalTitle,
      @JsonKey(name: "original_language")
          required final String originalLanguage,
      required final String title,
      @JsonKey(name: "backdrop_path")
          required final String backdropPath,
      required final num popularity,
      @JsonKey(name: "vote_count")
          required final int voteCount,
      required final bool video,
      @JsonKey(name: "vote_average")
          required final num voteAverage}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  @JsonKey(name: "poster_path")
  String get posterPath;
  @override
  bool get adult;
  @override
  String get overview;
  @override
  @JsonKey(name: "release_date")
  String get releaseDate;
  @override // @JsonKey(name: "genre_ids") required List<int> genreIds,
  int get id;
  @override
  @JsonKey(name: "original_title")
  String get originalTitle;
  @override
  @JsonKey(name: "original_language")
  String get originalLanguage;
  @override
  String get title;
  @override
  @JsonKey(name: "backdrop_path")
  String get backdropPath;
  @override
  num get popularity;
  @override
  @JsonKey(name: "vote_count")
  int get voteCount;
  @override
  bool get video;
  @override
  @JsonKey(name: "vote_average")
  num get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      throw _privateConstructorUsedError;
}
