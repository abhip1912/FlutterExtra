import 'package:demo_serializer/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  ListUserResponse();

  @JsonKey(name: "page")
  int pageNo;

  @JsonKey(name: "per_page")
  int perPage;

  @JsonKey(name: "total")
  int total;

  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "data")
  List<User> usersList;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
