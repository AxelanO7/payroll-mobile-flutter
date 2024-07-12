import 'package:json_annotation/json_annotation.dart';


part 'filter.g.dart';

@JsonSerializable()
class Filter {
      Filter();

  @JsonKey(defaultValue: false) late bool selected;
  late dynamic value;
  late String label;
  late int index;
  @JsonKey(name: 'sub_label') late String subLabel;
  @JsonKey(name: 'box_color') late String boxColor;
  late dynamic data;

  factory Filter.fromJson(Map<String,dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
