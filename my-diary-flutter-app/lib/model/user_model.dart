// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  String name;
  String email;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
      profilePic: map['profilePic'] as String,
      createdAt: map['createdAt'] as String,
      phoneNumber: map['phoneNumber'] as String,
      uid: map['uid'] as String,
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'bio': bio,
      'profilePic': profilePic,
      'createdAt': createdAt,
      'phoneNumber': phoneNumber,
      'uid': uid,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? bio,
    String? profilePic,
    String? createdAt,
    String? phoneNumber,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      createdAt: createdAt ?? this.createdAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      uid: uid ?? this.uid,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, bio: $bio, profilePic: $profilePic, createdAt: $createdAt, phoneNumber: $phoneNumber, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.bio == bio &&
        other.profilePic == profilePic &&
        other.createdAt == createdAt &&
        other.phoneNumber == phoneNumber &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        bio.hashCode ^
        profilePic.hashCode ^
        createdAt.hashCode ^
        phoneNumber.hashCode ^
        uid.hashCode;
  }
}


