// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';




GetIt locator = GetIt.instance;

Future<void> init() async{
  // Registering Blocs
/*   locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => RegistrarBloc(locator())); */

  // Registering Use Case
/*   locator.registerLazySingleton(() => LoginUseCase(usuarioRepository: locator()));
  locator.registerLazySingleton(() => RegistrarUseCase(usuarioRepository: locator())); */

  // Registering Repositories
/*   locator.registerLazySingleton<IUsuarioRepository>(() => UsuarioRepository(usuarioService: locator())); */

  // Registering Datasources
/*   locator.registerLazySingleton<IUsuarioService>(() => UsuarioService(client: locator())); */

  //Registering Core
/*   locator.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(connectionChecker: locator())); */
  
  //External Components
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);

}