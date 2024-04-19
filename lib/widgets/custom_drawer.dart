import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.hello ?? "Hello World",
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.helloWorld ?? "Hello",
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(),
                    content: Text(
                      AppLocalizations.of(context)
                              ?.areYouSureToDeleteThisItem ??
                          "Are you sure to delete this item?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)?.yes ?? "Yes",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)?.no ?? "No",
                        ),
                      )
                    ],
                  );
                },
              );
            },
            title: Text(
              AppLocalizations.of(context)?.delete ?? "Delete",
            ),
            trailing: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
