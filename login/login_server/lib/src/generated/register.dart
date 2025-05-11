/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Register
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = RegisterTable();

  static const db = RegisterRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

  static RegisterInclude include() {
    return RegisterInclude._();
  }

  static RegisterIncludeList includeList({
    _i1.WhereExpressionBuilder<RegisterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegisterTable>? orderByList,
    RegisterInclude? include,
  }) {
    return RegisterIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Register.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Register.t),
      include: include,
    );
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

class RegisterTable extends _i1.Table<int?> {
  RegisterTable({super.tableRelation}) : super(tableName: 'register') {
    email = _i1.ColumnString(
      'email',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
  }

  /// The email address of the user.
  late final _i1.ColumnString email;

  /// The password of the user.
  late final _i1.ColumnString password;

  /// The name of the user.
  late final _i1.ColumnString name;

  /// The phone number of the user.
  late final _i1.ColumnString phone;

  /// The address of the user.
  late final _i1.ColumnString address;

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        password,
        name,
        phone,
        address,
      ];
}

class RegisterInclude extends _i1.IncludeObject {
  RegisterInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Register.t;
}

class RegisterIncludeList extends _i1.IncludeList {
  RegisterIncludeList._({
    _i1.WhereExpressionBuilder<RegisterTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Register.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Register.t;
}

class RegisterRepository {
  const RegisterRepository._();

  /// Returns a list of [Register]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Register>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegisterTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegisterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Register>(
      where: where?.call(Register.t),
      orderBy: orderBy?.call(Register.t),
      orderByList: orderByList?.call(Register.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Register] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Register?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegisterTable>? where,
    int? offset,
    _i1.OrderByBuilder<RegisterTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegisterTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Register>(
      where: where?.call(Register.t),
      orderBy: orderBy?.call(Register.t),
      orderByList: orderByList?.call(Register.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Register] by its [id] or null if no such row exists.
  Future<Register?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Register>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Register]s in the list and returns the inserted rows.
  ///
  /// The returned [Register]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Register>> insert(
    _i1.Session session,
    List<Register> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Register>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Register] and returns the inserted row.
  ///
  /// The returned [Register] will have its `id` field set.
  Future<Register> insertRow(
    _i1.Session session,
    Register row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Register>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Register]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Register>> update(
    _i1.Session session,
    List<Register> rows, {
    _i1.ColumnSelections<RegisterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Register>(
      rows,
      columns: columns?.call(Register.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Register]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Register> updateRow(
    _i1.Session session,
    Register row, {
    _i1.ColumnSelections<RegisterTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Register>(
      row,
      columns: columns?.call(Register.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Register]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Register>> delete(
    _i1.Session session,
    List<Register> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Register>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Register].
  Future<Register> deleteRow(
    _i1.Session session,
    Register row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Register>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Register>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RegisterTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Register>(
      where: where(Register.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegisterTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Register>(
      where: where?.call(Register.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
