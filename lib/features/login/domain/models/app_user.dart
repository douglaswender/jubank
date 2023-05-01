// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final String? uid;
  final String name;
  final String phone;
  final String email;
  final int? balanceId;
  final bool? isAdmin;
  final String? password;
  AppUser({
    this.uid,
    required this.name,
    required this.phone,
    required this.email,
    this.balanceId,
    this.isAdmin,
    this.password,
  });

  AppUser copyWith({
    String? uid,
    String? name,
    String? phone,
    String? email,
    int? balanceId,
    bool? isAdmin,
    String? password,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      balanceId: balanceId ?? this.balanceId,
      isAdmin: isAdmin ?? this.isAdmin,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'balanceId': balanceId,
      'isAdmin': isAdmin,
      'password': password,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      balanceId: map['balanceId'] != null ? map['balanceId'] as int : null,
      isAdmin: map['isAdmin'] != null ? map['isAdmin'] as bool : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(uid: $uid, name: $name, phone: $phone, email: $email, balanceId: $balanceId, isAdmin: $isAdmin, password: $password)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.balanceId == balanceId &&
        other.isAdmin == isAdmin &&
        other.password == password;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        balanceId.hashCode ^
        isAdmin.hashCode ^
        password.hashCode;
  }
}
