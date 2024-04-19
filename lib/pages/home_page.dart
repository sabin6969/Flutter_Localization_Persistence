import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization_persistence/cubits/switch_language_cubit.dart';
import 'package:flutter_localization_persistence/models/language_model.dart';
import 'package:flutter_localization_persistence/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LanguageModel> langauges = [
    LanguageModel(
      locale: const Locale("ne"),
      countryFlag: "🇳🇵",
      langaugeName: "नेपाली",
    ),
    LanguageModel(
      locale: const Locale("hi"),
      countryFlag: "🇮🇳",
      langaugeName: "हिंदी",
    ),
    LanguageModel(
      locale: const Locale("bn"),
      countryFlag: "🇧🇩",
      langaugeName: "বাংলা",
    ),
    LanguageModel(
      locale: const Locale("en"),
      countryFlag: "🇺🇸",
      langaugeName: "English",
    )
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.hello,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            BlocBuilder<SwitchLanguageCubit, SupportedLangauges>(
              builder: (context, state) {
                return DropdownButton(
                  hint: Text(
                    AppLocalizations.of(context)?.selectLanguageOfYourChoice ??
                        "Select langauge of your choice",
                  ),
                  items: langauges.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          "${e.countryFlag}   ${e.langaugeName}",
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    context.read<SwitchLanguageCubit>().switchLangage(value!);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
