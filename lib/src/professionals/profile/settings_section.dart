import 'package:flutter/material.dart';
import 'package:salo/src/shared/resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final mediumStyle = textTheme.titleMedium!;

    const tileContentPadding = EdgeInsets.only(right: 16);
    final dividerWidget = Divider(height: 1, color: dividerColor);
    final forwardIcon = Icon(
      Icons.arrow_forward_ios_rounded,
      size: 16,
      color: dividerColor,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            'Settings',
            style: mediumStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          dividerWidget,
          ListTile(
            dense: true,
            contentPadding: tileContentPadding,
            splashColor: Colors.transparent,
            trailing: forwardIcon,
            onTap: () => launchUrlString(
                'https://www.facebook.com/profile.php?id=61566512417792'),
            title: Text(
              'Siga no Instagram',
              style: mediumStyle.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          dividerWidget,
          ListTile(
            dense: true,
            contentPadding: tileContentPadding,
            splashColor: Colors.transparent,
            trailing: forwardIcon,
            onTap: () => launchUrlString(
                'https://www.facebook.com/profile.php?id=61566512417792'),
            title: Text(
              'Siga no Facebook',
              style: mediumStyle.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          dividerWidget,
          ListTile(
            dense: true,
            splashColor: Colors.transparent,
            contentPadding: tileContentPadding,
            trailing: forwardIcon,
            onTap: () {
              launchUrlString(
                  'https://www.apple.com/legal/internet-services/itunes/dev/stdeula');
            },
            title: Text(
              'Termos de uso (EULA)',
              style: mediumStyle.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          dividerWidget,
          const SizedBox(height: 64),
          Text(
            'Conta',
            style: mediumStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 16),
          dividerWidget,
          ListTile(
            dense: true,
            splashColor: Colors.transparent,
            contentPadding: tileContentPadding,
            //onTap: overviewCubit.signOut,
            title: Text(
              'Terminar sessão',
              style: mediumStyle.copyWith(
                color: Colors.deepOrange,
              ),
            ),
          ),
          dividerWidget,
          ListTile(
            dense: true,
            contentPadding: tileContentPadding,
            splashColor: Colors.transparent,
            //onTap: overviewCubit.deleteAccount,
            title: Text(
              'Eliminar conta',
              style: mediumStyle.copyWith(
                color: Colors.deepOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
