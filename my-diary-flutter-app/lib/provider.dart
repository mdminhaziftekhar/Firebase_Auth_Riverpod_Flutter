import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/api/api.dart';
import 'package:my_diary/model/user_model.dart';
import 'package:my_diary/provider/authentication_provider.dart';
import 'package:my_diary/services/api_services.dart';

final apiProvider = Provider<Api>((ref) => Api.instance);
final apiServiceProvider =
    Provider<ApiService>((ref) => ApiService(ref.read(apiProvider)));

// Provider for User
final userProvider =
    StateNotifierProvider<AuthenticationProvider, AuthenticationState>(
  (ref) => AuthenticationProvider(),
);
