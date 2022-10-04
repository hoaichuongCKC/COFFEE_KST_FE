import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  const ReviewEntity({
    required this.id,
    required this.content,
    required this.ratingStar,
    required this.postedDate,
    required this.avatar,
    required this.fullname,
  });

  final int id;
  final String content;
  final int ratingStar;
  final String postedDate;
  final dynamic avatar;
  final String fullname;

  @override
  List<Object?> get props =>
      [id, content, ratingStar, postedDate, avatar, fullname];
}
