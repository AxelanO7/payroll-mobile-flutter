import 'package:property_change_notifier/property_change_notifier.dart';

class ConstantsService extends PropertyChangeNotifier<String> {
  bool _isLoggedOut = false;

  bool get isLoggedOut => _isLoggedOut;

  set isLoggedOut(bool value) {
    _isLoggedOut = value;
    notifyListeners('isLoggedOut');
  }
}
