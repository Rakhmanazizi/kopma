import 'package:get_it/get_it.dart';
import '../data/datasource/shared_preferences_service.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // register services
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  serviceLocator.registerSingleton(sharedPreferencesService);
}
