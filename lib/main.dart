import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization_persistence/cubits/switch_language_cubit.dart';
import 'package:flutter_localization_persistence/pages/home_page.dart';
import 'package:flutter_localization_persistence/services/user_langauge_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserLanguageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchLanguageCubit(),
      child: BlocBuilder<SwitchLanguageCubit, SupportedLangauges>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter localization',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(UserLanguageService.getPreferredLangauge),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
