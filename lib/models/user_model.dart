class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.phoneVerifiedAt, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.countryId, 
      this.type, 
      this.status, 
      this.image,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryId = json['country_id'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  dynamic phoneVerifiedAt;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  num? countryId;
  num? type;
  num? status;
  dynamic image;
UserModel copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  dynamic phoneVerifiedAt,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
  num? countryId,
  num? type,
  num? status,
  dynamic image,
}) => UserModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  countryId: countryId ?? this.countryId,
  type: type ?? this.type,
  status: status ?? this.status,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['phone_verified_at'] = phoneVerifiedAt;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['country_id'] = countryId;
    map['type'] = type;
    map['status'] = status;
    map['image'] = image;
    return map;
  }

}