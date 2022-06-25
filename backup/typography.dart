import 'package:flutter/material.dart';


class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('displayLarge', style: Theme.of(context).textTheme.displayLarge),
              Text('displayMedium',
                  style: Theme.of(context).textTheme.displayMedium),
              Text('displaySmall', style: Theme.of(context).textTheme.displaySmall),
              const Divider(),
              Text('headlineLarge',
                  style: Theme.of(context).textTheme.headlineLarge),
              Text('headlineMedium',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('headlineSmall',
                  style: Theme.of(context).textTheme.headlineSmall),
              const Divider(),
              Text('headline1', style: Theme.of(context).textTheme.headline1),
              Text('headline2', style: Theme.of(context).textTheme.headline2),
              Text('headline3', style: Theme.of(context).textTheme.headline3),
              Text('headline4', style: Theme.of(context).textTheme.headline4),
              Text('headline5', style: Theme.of(context).textTheme.headline5),
              Text('headline6', style: Theme.of(context).textTheme.headline6),
              const Divider(),
              Text('titleLarge', style: Theme.of(context).textTheme.titleLarge),
              Text('titleMedium', style: Theme.of(context).textTheme.titleMedium),
              Text('titleSmall', style: Theme.of(context).textTheme.titleSmall),
              const Divider(),
              Text('subtitle1', style: Theme.of(context).textTheme.subtitle1),
              Text('subtitle2', style: Theme.of(context).textTheme.subtitle2),
              const Divider(),
              Text('bodyText1', style: Theme.of(context).textTheme.bodyText1),
              Text('bodyText2', style: Theme.of(context).textTheme.bodyText2),
              Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
              Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
              Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
              const Divider(),
              Text('labelSmall', style: Theme.of(context).textTheme.labelSmall),
              Text('labelMedium', style: Theme.of(context).textTheme.labelMedium),
              Text('labelLarge', style: Theme.of(context).textTheme.labelLarge),
              const Divider(),
              Text('button', style: Theme.of(context).textTheme.button),
              Text('caption', style: Theme.of(context).textTheme.caption),
              Text('overline', style: Theme.of(context).textTheme.overline),
            ],
          ),
        ),
      ),
    );
  }
}
