import 'package:flutter_test/flutter_test.dart';
import 'package:search_github_repositories/src/screens/repository_details/model/repo_details_model.dart';

void main() {
  Map<String, dynamic> repoDetailsOneAsJson = {
    "url": "https://api.github.com/repos/pdliuw/ai_barcode/issues/1",
    "title": "Different behaviour in iOS vs. Android",
    "body":
        "Hi,\r\n\r\nI'm currently playing around with this barcode scanner plugin, as it offers the most room for including it to another view.\r\nHowever, I found a different behaviour of your example code in iOS vs. Android:\r\n- iOS: When a barcode is scanned, the camera image stays active and just continues to display whatever you point it at.\r\n- Android: As soon as a barcode is scanned, the camera image freezes until you call the startCameraPreview() of the scannerController again.\r\n\r\nIs there a way how both behave the same way?\r\n\r\nI played around with the stop/startCamera and stop/startCameraPreview methods: Whereas on Android the camera image freezes as soon as any of the two stop methods is called, in iOS it does not freeze at all but it's just getting grey when stopCameraPreview is called. \r\nIs it possible to also freeze the camera image as soon as a barcode is scanned successfully on iOS?\r\n\r\nThanks in advance!\r\nBen",
    "created_at": "2020-02-05T08:08:45Z",
  };

  RepoDetailsModel expectedRepoDetailsOne = const RepoDetailsModel(
    url: "https://api.github.com/repos/pdliuw/ai_barcode/issues/1",
    title: "Different behaviour in iOS vs. Android",
    body:
        "Hi,\r\n\r\nI'm currently playing around with this barcode scanner plugin, as it offers the most room for including it to another view.\r\nHowever, I found a different behaviour of your example code in iOS vs. Android:\r\n- iOS: When a barcode is scanned, the camera image stays active and just continues to display whatever you point it at.\r\n- Android: As soon as a barcode is scanned, the camera image freezes until you call the startCameraPreview() of the scannerController again.\r\n\r\nIs there a way how both behave the same way?\r\n\r\nI played around with the stop/startCamera and stop/startCameraPreview methods: Whereas on Android the camera image freezes as soon as any of the two stop methods is called, in iOS it does not freeze at all but it's just getting grey when stopCameraPreview is called. \r\nIs it possible to also freeze the camera image as soon as a barcode is scanned successfully on iOS?\r\n\r\nThanks in advance!\r\nBen",
    createdAt: "2020-02-05T08:08:45Z",
  );

  Map<String, dynamic> repoDetailsTwoAsJson = {
    "url":
        "https://api.github.com/repos/nodriver-ai/flutter_azure_b2c/issues/9",
    "title": "Unable to run Azure AD screen",
    "body":
        "I used your example and added flutter_azure_b2c in my flutter application, and updated AndroidManifest.xml, created a config file named b2c_config.json and saved it in path: android/app/main/res/raw/ for android and updated my main.dart with your example's main.dart and getting this screen on my emulator\r\n \r\n\r\n![image](https://user-images.githubusercontent.com/32321520/186174140-d6e2116b-be42-4cca-90b2-e0fcab73822c.png)\r\n\r\nBut when i click on login button i am not able load azure ad login page when i click on login, i think b2c config is not getting loaded in this app and i have checked same config with android native app its working for it",
    "created_at": "2022-08-23T13:45:10Z",
  };

  RepoDetailsModel expectedRepoDetailsTwo = const RepoDetailsModel(
    url: "https://api.github.com/repos/nodriver-ai/flutter_azure_b2c/issues/9",
    title: "Unable to run Azure AD screen",
    body:
        "I used your example and added flutter_azure_b2c in my flutter application, and updated AndroidManifest.xml, created a config file named b2c_config.json and saved it in path: android/app/main/res/raw/ for android and updated my main.dart with your example's main.dart and getting this screen on my emulator\r\n \r\n\r\n![image](https://user-images.githubusercontent.com/32321520/186174140-d6e2116b-be42-4cca-90b2-e0fcab73822c.png)\r\n\r\nBut when i click on login button i am not able load azure ad login page when i click on login, i think b2c config is not getting loaded in this app and i have checked same config with android native app its working for it",
    createdAt: "2022-08-23T13:45:10Z",
  );

  List<dynamic> repoDetailsListAsJson = [
    {
      "url": "https://api.github.com/repos/pdliuw/ai_barcode/issues/1",
      "title": "Different behaviour in iOS vs. Android",
      "body":
          "Hi,\r\n\r\nI'm currently playing around with this barcode scanner plugin, as it offers the most room for including it to another view.\r\nHowever, I found a different behaviour of your example code in iOS vs. Android:\r\n- iOS: When a barcode is scanned, the camera image stays active and just continues to display whatever you point it at.\r\n- Android: As soon as a barcode is scanned, the camera image freezes until you call the startCameraPreview() of the scannerController again.\r\n\r\nIs there a way how both behave the same way?\r\n\r\nI played around with the stop/startCamera and stop/startCameraPreview methods: Whereas on Android the camera image freezes as soon as any of the two stop methods is called, in iOS it does not freeze at all but it's just getting grey when stopCameraPreview is called. \r\nIs it possible to also freeze the camera image as soon as a barcode is scanned successfully on iOS?\r\n\r\nThanks in advance!\r\nBen",
      "created_at": "2020-02-05T08:08:45Z",
    },
    {
      "url":
          "https://api.github.com/repos/nodriver-ai/flutter_azure_b2c/issues/9",
      "title": "Unable to run Azure AD screen",
      "body":
          "I used your example and added flutter_azure_b2c in my flutter application, and updated AndroidManifest.xml, created a config file named b2c_config.json and saved it in path: android/app/main/res/raw/ for android and updated my main.dart with your example's main.dart and getting this screen on my emulator\r\n \r\n\r\n![image](https://user-images.githubusercontent.com/32321520/186174140-d6e2116b-be42-4cca-90b2-e0fcab73822c.png)\r\n\r\nBut when i click on login button i am not able load azure ad login page when i click on login, i think b2c config is not getting loaded in this app and i have checked same config with android native app its working for it",
      "created_at": "2022-08-23T13:45:10Z",
    }
  ];

  List<RepoDetailsModel> expectedRepoDetailsList = [
    const RepoDetailsModel(
      url: "https://api.github.com/repos/pdliuw/ai_barcode/issues/1",
      title: "Different behaviour in iOS vs. Android",
      body:
          "Hi,\r\n\r\nI'm currently playing around with this barcode scanner plugin, as it offers the most room for including it to another view.\r\nHowever, I found a different behaviour of your example code in iOS vs. Android:\r\n- iOS: When a barcode is scanned, the camera image stays active and just continues to display whatever you point it at.\r\n- Android: As soon as a barcode is scanned, the camera image freezes until you call the startCameraPreview() of the scannerController again.\r\n\r\nIs there a way how both behave the same way?\r\n\r\nI played around with the stop/startCamera and stop/startCameraPreview methods: Whereas on Android the camera image freezes as soon as any of the two stop methods is called, in iOS it does not freeze at all but it's just getting grey when stopCameraPreview is called. \r\nIs it possible to also freeze the camera image as soon as a barcode is scanned successfully on iOS?\r\n\r\nThanks in advance!\r\nBen",
      createdAt: "2020-02-05T08:08:45Z",
    ),
    const RepoDetailsModel(
      url:
          "https://api.github.com/repos/nodriver-ai/flutter_azure_b2c/issues/9",
      title: "Unable to run Azure AD screen",
      body:
          "I used your example and added flutter_azure_b2c in my flutter application, and updated AndroidManifest.xml, created a config file named b2c_config.json and saved it in path: android/app/main/res/raw/ for android and updated my main.dart with your example's main.dart and getting this screen on my emulator\r\n \r\n\r\n![image](https://user-images.githubusercontent.com/32321520/186174140-d6e2116b-be42-4cca-90b2-e0fcab73822c.png)\r\n\r\nBut when i click on login button i am not able load azure ad login page when i click on login, i think b2c config is not getting loaded in this app and i have checked same config with android native app its working for it",
      createdAt: "2022-08-23T13:45:10Z",
    )
  ];

  group("Test RepoModel initialization from JSON", () {
    test('Test using json one', () {
      expect(RepoDetailsModel.fromJson(repoDetailsOneAsJson),
          expectedRepoDetailsOne);
    });
    test('Test using json two', () {
      expect(RepoDetailsModel.fromJson(repoDetailsTwoAsJson),
          expectedRepoDetailsTwo);
    });
  });

  group("Test mapJSONList To RepoList", () {
    test('Test mapJSONListToRepoList using json one', () {
      expect(
          RepoDetailsModel.mapJSONListToRepoDetailsList(repoDetailsListAsJson),
          expectedRepoDetailsList);
    });
  });
}
