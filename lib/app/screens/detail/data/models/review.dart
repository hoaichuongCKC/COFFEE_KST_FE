import 'package:coffee_kst/app/screens/detail/domain/entities/review.dart';
import 'package:easy_localization/easy_localization.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel(
      {required super.id,
      required super.content,
      required super.ratingStar,
      required super.postedDate,
      required super.avatar,
      required super.fullname});
  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        content: json["content"],
        ratingStar: json["rating_star"],
        postedDate: DateFormat("dd-MM-yyyy")
            .format(DateTime.parse(json["posted_date"])),
        avatar: json["avatar"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "rating_star": ratingStar,
        "posted_date": postedDate,
        "avatar": avatar,
        "fullname": fullname,
      };

  @override
  String toString() => toJson().toString();
}
