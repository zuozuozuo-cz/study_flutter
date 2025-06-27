
import 'package:json_annotation/json_annotation.dart';
part 'member_model.g.dart';

@JsonSerializable() /// 表示该类支持 JSON序列化和反序列化
class MemberModel{
  /// 成员 ID
  final String? sid;

  /// 成员姓名（中文名）
  final String? sname;

  /// 昵称
  final String? nickname;

  /// 生日，格式如 "06.29"
  @JsonKey(name: 'birth_day')
  final String? birthDay;

  /// 身高，单位 cm
  final String? height;

  /// 所属公司名称
  final String? company;

  /// 入团日期，字段名与 JSON 不同，使用 @JsonKey 指定映射 JSON 字段名 "join_day"
  @JsonKey(name: 'join_day')
  final String? joinDay;

  /// 十二星座，JSON 字段名 "star_sign_12"
  @JsonKey(name: 'star_sign_12')
  final String? starSign12;

  /// 出生地，JSON 字段名 "birth_place"
  @JsonKey(name: 'birth_place')
  final String? birthPlace;

  /// 构造函数，所有字段必填
  const MemberModel({
     this.sid,
     this.sname,
     this.nickname,
     this.birthDay,
     this.height,
     this.company,
     this.joinDay,
     this.starSign12,
     this.birthPlace,
  });

  /// 工厂构造函数，从 JSON Map 反序列化为 MemberModel 实例
  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  /// 实例转 JSON Map，用于序列化
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}