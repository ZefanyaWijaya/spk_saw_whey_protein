
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// final locator = GetIt.instance;
// late final Dio _dio;
// late final Dio _tokenDio;

// Future<void> setupService() async {
//   // await Firebase.initializeApp();

//   // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   /// Report All Flutter Error to Sentry
//   //TODO: activate sentry
//   // await _exceptionReportingSetup();

//   //TODO: Change Base URL To Target Production or Staging'
//   initDio(baseUrl: 'http://localhost:3000');

//   // Register EconolabFresh
//   final PersistentEconolabTokenStorage _tokenStorage =
//       PersistentEconolabTokenStorage();

//   final ApiAuthenticationProvider _authenticationProvider =
//       ApiAuthenticationProvider(
//     tokenDio: _tokenDio,
//     dio: _dio,
//   );

//   final EconolabFresh<EconolabToken> _fresh = EconolabFresh(
//     tokenHeader: (token) => {
//       'Authorization': 'Bearer ${token.accessToken}',
//     },
//     tokenStorage: _tokenStorage,
//     refreshToken: _authenticationProvider.refreshToken,
//     shouldRefresh: _shouldRefresh,
//     httpClient: _tokenDio,
//   );

//   _dio.interceptors.add(_fresh);