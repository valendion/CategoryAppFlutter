import 'package:freezed_annotation/freezed_annotation.dart';

part 'CategoryModel.freezed.dart';
part 'CategoryModel.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel(
      {@Default(0) int id,
      @Default('') String name,
      @Default('') String slug,
      @Default(0) int parent}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
