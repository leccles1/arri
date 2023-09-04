// This code was autogenerated by Arri. Do not modify directly.
// For additional documentation visit http://github.com/modiimedia/arri
import "dart:convert";
import "package:arri_client/arri_client.dart";

class ExampleClient {
  final String _baseUrl;
  final Map<String, String> _headers;
  const ExampleClient({
    String baseUrl = "",
    Map<String, String> headers = const {},
  })  : _headers = headers,
        _baseUrl = baseUrl;

  ExampleClientUsersService get users {
    return ExampleClientUsersService(
      baseUrl: _baseUrl,
      headers: _headers,
    );
  }
}

class ExampleClientUsersService {
  final String _baseUrl;
  final Map<String, String> _headers;
  const ExampleClientUsersService({
    String baseUrl = "",
    Map<String, String> headers = const {},
  })  : _baseUrl = baseUrl,
        _headers = headers;

  Future<UsersGetUserResponse> getUser() {
    return parsedArriRequest(
      "$_baseUrl/users/get-user",
      method: HttpMethod.get,
      headers: _headers,
      params: null,
      parser: (body) => UsersGetUserResponse.fromJson(json.decode(body)),
    );
  }

  Future<UsersGetUsersResponse> getUsers(UsersGetUsersParams params) {
    return parsedArriRequest(
      "$_baseUrl/users/get-users",
      method: HttpMethod.get,
      headers: _headers,
      params: params.toJson(),
      parser: (body) => UsersGetUsersResponse.fromJson(json.decode(body)),
    );
  }

  Future<UsersUpdateUserResponse> updateUser(UsersUpdateUserParams params) {
    return parsedArriRequest(
      "$_baseUrl/users/update-user",
      method: HttpMethod.get,
      headers: _headers,
      params: params.toJson(),
      parser: (body) => UsersUpdateUserResponse.fromJson(json.decode(body)),
    );
  }
}

class UsersGetUserResponse {
  final String id;
  final String username;
  final String email;
  const UsersGetUserResponse({
    required this.id,
    required this.username,
    required this.email,
  });
  factory UsersGetUserResponse.fromJson(Map<String, dynamic> json) {
    return UsersGetUserResponse(
      id: typeFromDynamic<String>(json["id"], ""),
      username: typeFromDynamic<String>(json["username"], ""),
      email: typeFromDynamic<String>(json["email"], ""),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
    };
  }

  UsersGetUserResponse copyWith({
    String? id,
    String? username,
    String? email,
  }) {
    return UsersGetUserResponse(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}

class UsersGetUsersParams {
  final double limit;
  const UsersGetUsersParams({
    required this.limit,
  });
  factory UsersGetUsersParams.fromJson(Map<String, dynamic> json) {
    return UsersGetUsersParams(
      limit: doubleFromDynamic(json["limit"], 0.0),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "limit": limit,
    };
  }

  UsersGetUsersParams copyWith({
    double? limit,
  }) {
    return UsersGetUsersParams(
      limit: limit ?? this.limit,
    );
  }
}

class UsersGetUsersResponse {
  final double total;
  final List<UserSchema> items;
  const UsersGetUsersResponse({
    required this.total,
    required this.items,
  });
  factory UsersGetUsersResponse.fromJson(Map<String, dynamic> json) {
    return UsersGetUsersResponse(
      total: doubleFromDynamic(json["total"], 0.0),
      items: json["items"] is List
          ? (json["items"] as List<Map<String, dynamic>>)
              .map((val) => UserSchema.fromJson(val))
              .toList()
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "items": items.map((val) => val.toJson()).toList(),
    };
  }

  UsersGetUsersResponse copyWith({
    double? total,
    List<UserSchema>? items,
  }) {
    return UsersGetUsersResponse(
      total: total ?? this.total,
      items: items ?? this.items,
    );
  }
}

class UserSchema {
  final String id;
  final String email;
  final String username;
  const UserSchema({
    required this.id,
    required this.email,
    required this.username,
  });
  factory UserSchema.fromJson(Map<String, dynamic> json) {
    return UserSchema(
      id: typeFromDynamic<String>(json["id"], ""),
      email: typeFromDynamic<String>(json["email"], ""),
      username: typeFromDynamic<String>(json["username"], ""),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username,
    };
  }

  UserSchema copyWith({
    String? id,
    String? email,
    String? username,
  }) {
    return UserSchema(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}

class UsersUpdateUserParams {
  final String userId;
  const UsersUpdateUserParams({
    required this.userId,
  });
  factory UsersUpdateUserParams.fromJson(Map<String, dynamic> json) {
    return UsersUpdateUserParams(
      userId: typeFromDynamic<String>(json["userId"], ""),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
    };
  }

  UsersUpdateUserParams copyWith({
    String? userId,
  }) {
    return UsersUpdateUserParams(
      userId: userId ?? this.userId,
    );
  }
}

class UsersUpdateUserResponse {
  final String id;
  final String username;
  final String email;
  const UsersUpdateUserResponse({
    required this.id,
    required this.username,
    required this.email,
  });
  factory UsersUpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UsersUpdateUserResponse(
      id: typeFromDynamic<String>(json["id"], ""),
      username: typeFromDynamic<String>(json["username"], ""),
      email: typeFromDynamic<String>(json["email"], ""),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
    };
  }

  UsersUpdateUserResponse copyWith({
    String? id,
    String? username,
    String? email,
  }) {
    return UsersUpdateUserResponse(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}

enum ExampleClientEndpoints
    implements Comparable<ExampleClientEndpoints>, ArriEndpoint {
  usersGetUser(
    path: "/users/get-user",
    method: HttpMethod.get,
  ),
  usersGetUsers(
    path: "/users/get-users",
    method: HttpMethod.get,
  ),
  usersUpdateUser(
    path: "/users/update-user",
    method: HttpMethod.get,
  );

  const ExampleClientEndpoints({
    required this.path,
    required this.method,
  });
  @override
  final String path;
  @override
  final HttpMethod method;

  @override
  compareTo(ExampleClientEndpoints other) => name.compareTo(other.name);
}
