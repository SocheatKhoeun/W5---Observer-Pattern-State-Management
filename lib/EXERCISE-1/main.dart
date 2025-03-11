import '/EXERCISE-1/logger/console_logger.dart';
import '/EXERCISE-1/models/ride_pre.dart';
import '/EXERCISE-1/service/ride_pref_service.dart';
 
void main() {
  final service = RidePreferencesService();
  final logger = ConsoleLogger();

  service.addListener(logger); 

  service.setPreference(RidePreference(name: 'Socheat')); 
  service.setPreference(RidePreference(name: 'Hello')); 

}

