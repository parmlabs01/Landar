import '../models/user_model.dart';

/// Handles sign-in, sign-up, sign-out, and current-session state.
///
/// Skeleton only — connect this to Firebase Auth, a custom backend, or
/// whichever identity provider LANDER settles on.
class AuthService {
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  UserModel? currentUser;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError('Connect to your auth provider (e.g. Firebase Auth).');
  }

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    required String userType,
  }) async {
    throw UnimplementedError('Connect to your auth provider (e.g. Firebase Auth).');
  }

  Future<void> signOut() async {
    currentUser = null;
  }

  bool get isSignedIn => currentUser != null;
}
