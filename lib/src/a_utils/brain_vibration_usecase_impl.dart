import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

import 'brain_vibration_usecase.dart';

class BrainVibrationUseCaseImpl extends SingleKeyValueUseCaseImpl<String, bool>
    implements BrainVibrationUseCase {
  static const String KEY = "VIBRATION_KEY";
  static const bool DEFAULT_VALUE = true;

  BrainVibrationUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
          repo: KeyValueRepoModule.buildKeyValueRepo(
            converter: VibrationKeyValueConverter.converter,
            key: KEY,
          ),
        );

  @override
  bool changeValue() {
    return update(!read());
  }
}

class VibrationKeyValueConverter
    implements SingleKeyValueConverter<String, bool> {
  static final VibrationKeyValueConverter converter =
      VibrationKeyValueConverter._();

  VibrationKeyValueConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  bool stringToValue(String value) {
    return value.toLowerCase() == 'true' ? true : false;
  }

  @override
  String valueToString(bool value) {
    return value ? 'true' : 'false';
  }
}
