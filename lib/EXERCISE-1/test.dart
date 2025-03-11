import '/EXERCISE-1/logger/console_logger.dart';
import '/EXERCISE-1/models/ride_pre.dart';
import '/EXERCISE-1/service/ride_pref_service.dart';

void main() {
  RidePreferencesService ridePreferencesService = RidePreferencesService();
  ConsoleLogger consoleLogger = ConsoleLogger();

  // Register ConsoleLogger as a listener
  ridePreferencesService.addListener(consoleLogger);

  // Simulate a preference change
  ridePreferencesService.setPreference(RidePreference.defaultPreference);

}
