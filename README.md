# iOS Movies

This app will show you the last top movies released by using the itunes RSS feed.

The url of the itunes RSS is https://itunes.apple.com/us/rss/topmovies/limit=10/json

Find a gide of itunes RSS urls here https://affiliate.itunes.apple.com/resources/blog/introduction-rss-feed-generator/

<p align="center">
<img src="https://support.apple.com/content/dam/edam/applecare/images/en_US/itunes/featured-contetn-itunes-icon_2x.jpg" width="20%" margin="auto">

<img src="https://help.campaignmonitor.com/img/help/RSS-feed-icon.png" width="20%" margin="auto">
</p>


For this app we will use 3 Swift libraries:

- [Alamofire]() To make http calls:

<p align="center">
<img src="https://raw.githubusercontent.com/Alamofire/Alamofire/assets/alamofire.png" width="60%" margin="auto">
</p>

- [Kingfisher]() To download and catch images:

<p align="center">
<img src="https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png" width="50%" margin="auto">
</p>

- [SwiftyJSON]() To work with JSONs in an easy way:

<p align="center">
<img src="https://www.percona.com/sites/default/files/json-logo.png" width="45%" margin="auto">
</p>

###### NOTE: This isn't the SwiftyJSON Logo, Swifty JSON has no logo :(

To see a beautiful JSON we will use [JSONFormatter](https://jsonformatter.curiousconcept.com)

## Carthage
[Carthage](https://github.com/Carthage/Carthage) is intended to be the simplest way to add frameworks to your Cocoa application.

To install Carthage:

```sh
$ brew update
$ brew install carthage
```

How to use carthage:
- Create a file named "Cartfile" in the project root folfer
- Add the following content to the file

```sh
github "Alamofire/Alamofire" ~> 4.3
github "onevcat/Kingfisher" ~> 3.0
github "SwiftyJSON/SwiftyJSON"
```

- Run "carthage update --platform iOS --no-use-binaries"

###### NOTE: You can run only "carthage update" but it will fetch libraries for macOS and tvOS too.

Carthage now will create a folder named Carthage in the root directory of the project and there you will find folders for each library with a .framework file inside.

Take the file and drop it inside your Xcode Project, ensure the checkbox "Copy items if needed" is marked.

Then click your Xcode project, go to Build Phases and check if a section called Copy Files exist. If not you can create it by clicking the + button. There add the .framework files you just added to the project.

<p align="center">
<img src="https://github.com/xavipedrals/iosMovies/blob/master/GithubScreenshots/settings.png" margin="auto">
</p>

## Add custom fonts
To add custom fonts simply drop them into the project. Then go to your info.plist file and add a section named "Fonts provided by application", there add the fonts you want to use. You need the specify the font path and extension.


<p align="center">
<img src="https://raw.githubusercontent.com/xavipedrals/iosMovies/master/GithubScreenshots/fonts-infoplist.png" margin="auto"> 
</p>




