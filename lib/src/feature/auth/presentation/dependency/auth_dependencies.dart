import 'package:foodivoire/main.dart';
import 'package:foodivoire/src/feature/auth/data/api/api_service.dart';
import 'package:foodivoire/src/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/request_otp.dart';
import 'package:foodivoire/src/feature/auth/domain/usecase/verify_otp.dart';
import 'package:foodivoire/src/feature/auth/presentation/provider/auth_provider.dart';

injectAuthDependencies(){
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(),);
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(getIt<AuthApiService>()),);
  getIt.registerLazySingleton<RequestOTP>(() => RequestOTP(getIt<AuthRepoImpl>()),);
  getIt.registerLazySingleton<VerifyOTP>(() => VerifyOTP(getIt<AuthRepoImpl>()),);

}
final authProvider = AuthProvider(requestOTP: getIt<RequestOTP>(),verifyOTP: getIt<VerifyOTP>());