import '/EXERCISE-1/models/ride_pre.dart';
import '/EXERCISE-1/service/ride_pref_listener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceChange(RidePreference changedPreference) {
    print('Preference changed: ${changedPreference.toString()}');
  }
}