import 'package:meetntrain/meet_n_train_events/domain/entities/community.dart';

class CommunityModel extends Community {
  CommunityModel({
    super.id,
    super.title,
    super.image,
    super.bio,
    super.points,
    super.ratingCount,
    super.connectionCount,
    super.eventCount,
    super.profilePicture,
    super.deeplink,
    super.linkExpiry,
    super.state,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      bio: json['bio'],
      points: json['points'],
      ratingCount: json['rating_count'],
      connectionCount: json['connection_count'],
      eventCount: json['event_count'],
      profilePicture: json['profile_picture'],
      deeplink: json['deeplink'],
      linkExpiry: json['link_expiry'],
      state: json['state'],
    );
  }
}
