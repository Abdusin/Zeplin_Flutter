# Zeplin_Flutter

Control your flutter application on [zeplin](https://zeplin.io).

## 🎯 Usage

```dart
var zeplinData = ZeplinFlutter.fetchFromZeplin(token: @token,projectId: @projectId);
zeplinData.getColor(@COLORNAME); //Color
zeplinData.getTextStyle(@STYLENAME); //TextStyle
zeplinData.boxSpace(@SPACERNAME); //SizedBox
zeplinData.horizontalSpace(@SPACERNAME); //SizedBox
zeplinData.verticalSpace(@SPACERNAME); //SizedBox

--- OR ---

await ZeplinFlutter.fetchFromZeplin(token: @token,projectId: @projectId);

ZeplinFlutter.instance.getColor(@COLORNAME); //Color
ZeplinFlutter.instance.getTextStyle(@STYLENAME); //TextStyle
ZeplinFlutter.instance.boxSpace(@SPACERNAME); //SizedBox
ZeplinFlutter.instance.horizontalSpace(@SPACERNAME); //SizedBox
ZeplinFlutter.instance.verticalSpace(@SPACERNAME); //SizedBox
```

## 💻 Example

![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/mobile_ss.png?raw=true)


## 🚀 How To Get Project ID

open your project on [zeplin app](https://support.zeplin.io/en/articles/244698-downloading-mac-and-windows-apps) or [web site](https://app.zeplin.io) then go to styleguide tab

Step 1             |  Step2
:-------------------------:|:-------------------------:
![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/step1.png?raw=true) | ![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/step2.png?raw=true)


## 🚀 How To Get Token

go to zeplin [developer page](https://app.zeplin.io/profile/developer) 

Step 1             |  Step 3             | Step 3
:-------------------------:|:-------------------------:|:-------------------------:
![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/token_step1.png?raw=true) | ![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/token_step2.png?raw=true) | ![url](https://github.com/Abdusin/Zeplin_Flutter/blob/main/screenshots/token_step3.png?raw=true)

## 🙋‍♀️🙋‍♂️ Contributing

All contributions are welcome! Just make sure that it's not an already existing issue or pull request.

<!-- DO NOT REMOVE - contributor_list:start -->

## 👥 Contributors

- **[@Abdusin](https://github.com/abdusin)**

<!-- DO NOT REMOVE - contributor_list:end -->