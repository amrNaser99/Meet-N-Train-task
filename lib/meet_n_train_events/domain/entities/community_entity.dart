import 'package:meetntrain/meet_n_train_events/data/models/community_model.dart';

class CommunityEntity extends CommunityModel {
  CommunityEntity({
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

  factory CommunityEntity.fromJson(Map<String, dynamic> json) {
    return CommunityEntity(
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
