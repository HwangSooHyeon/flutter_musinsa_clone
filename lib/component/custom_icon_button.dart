import 'package:flutter/material.dart';
import 'package:flutter_musinsa_clone/provider/special_theme_provider.dart';
import 'package:flutter_musinsa_clone/screen/custom_plain_screen.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SpecialThemeProvider>();
    final specialThemes = provider.cache;

    return SizedBox(
      height: 200,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        childAspectRatio: 1,
        children: specialThemes.map(
          (theme) {
            return Column(
              children: [
                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CustomPlainScreen(
                          content: theme.content,
                          themeName: theme.themeName,
                        ),
                      ),
                    );
                  },
                  icon: Text(
                    theme.themeName,
                  ),
                  splashRadius: 0.1,
                ),
                Text(theme.label),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
