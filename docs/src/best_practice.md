# Best Practice

## Generate MaterialColor

> [material_color_generator](https://pub.dev/packages/material_color_generator)

````
    primarySwatch: const MaterialColor(
      0xff195860,
      <int, Color>{
        50: Color(0xff256168),
        100: Color(0xff195860),
        200: Color(0xff195860),
        300: Color(0xff195860),
        400: Color(0xff195860),
        500: Color(0xff195860),
        600: Color(0xff195860),
        700: Color(0xff195860),
        800: Color(0xff195860),
        900: Color(0xff134147),
      },
    ),
    
    // =>
    
     primarySwatch: generateMaterialColor(color: const Color(0xff195860)),
    
````
