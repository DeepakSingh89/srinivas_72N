import 'result.dart';

class BannersResponse {
  List<Result>? result;

  BannersResponse({this.result});

  factory BannersResponse.fromJson(Map<String, dynamic> json) {
    return BannersResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
