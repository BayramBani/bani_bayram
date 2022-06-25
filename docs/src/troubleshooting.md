# Troubleshooting

## Build failed after adding Firebase

> /android/app/build.gradle

````
    defaultConfig {
        minSdkVersion 19
        multiDexEnabled true
    }
````

## Google Social Auth failed

>  [add the SHA1 fingerprint](https://developers.google.com/android/guides/client-auth?authuser=0&hl=en) 

````
keytool -list -v -alias androiddebugkey -keystore C:\Users\Bayram\.android\debug.keystore
android
Empreintes du certificat :
SHA 1: 98:7A:D7:C3:E6:5E:97:F1:9F:38:80:06:CF:0B:54:CA:D7:B7:98:37
SHA 256: 98:21:1D:D2:4F:3C:EA:E9:09:11:1F:48:01:DE:B1:89:FD:98:2E:F8:20:41:CB:40:9F:DC:BA:0C:62:DB:DC:97
````

# Invalid image data (Flutter does not currently support SVG)

> [flutter_svg](https://pub.dev/packages/flutter_svg)

````
Image(height: 64, width: 64, image: AssetImage(Images.back)),
=>
SvgPicture.asset(Images.signUp),
````

