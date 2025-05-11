/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Register implements _i1.SerializableModel {
  Register._({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory Register({
    int? id,
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) = _RegisterImpl;

  factory Register.fromJson(Map<String, dynamic> jsonSerialization) {
    return Register(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      name: jsonSerialization['name'] as String,
      phone: jsonSerialization['phone'] as String,
      address: jsonSerialization['address'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The email address of the user.
  String email;

  /// The password of the user.
  String password;

  /// The name of the user.
  String name;

  /// The phone number of the user.
  String phone;

  /// The address of the user.
  String address;

  /// Returns a shallow copy of this [Register]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Register copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? address,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegisterImpl extends Register {
  _RegisterImpl({
    int? id,
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) : super._(
          id: id,
          email: email,
          password: password,
          name: name,
          phone: phone,
          address: address,
        );

  /// Returns a shallow copy of this [Register]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Register copyWith({
    Object? id = _Undefined,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? address,
  }) {
    return Register(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
