import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_persistence/constants/app_constants.dart';
import 'package:flutter_localization_persistence/models/language_model.dart';
import 'package:flutter_localization_persistence/services/user_langauge_service.dart';

enum SupportedLangauges {
  english,
  nepali,
  hindi,
  bangla,
}

class SwitchLanguageCubit extends Cubit<SupportedLangauges> {
  SwitchLanguageCubit() : super(SupportedLangauges.english);
  void switchLangage(LanguageModel language) async {
    await UserLanguageService.setpreferredLangauge(language.locale);
    switch (language.locale.languageCode) {
      case AppConstants.englishLanguageCode:
        emit(SupportedLangauges.english);
        break;
      case AppConstants.nepaliLanguageCode:
        emit(SupportedLangauges.nepali);
        break;
      case AppConstants.hindiLangaugeCode:
        emit(SupportedLangauges.hindi);
        break;
      case AppConstants.banglaLangaugeCode:
        emit(SupportedLangauges.bangla);
        break;
      default:
        emit(SupportedLangauges.english);
    }
  }
}
