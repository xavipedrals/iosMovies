# Music app 

This app will show you the last top albums released by using the itunes RSS feed.

The url is https://itunes.apple.com/us/rss/topalbums/limit=10/json
or https://itunes.apple.com/us/rss/topmovies/limit=10/json

Find a gide of itunes RSS urls here https://affiliate.itunes.apple.com/resources/blog/introduction-rss-feed-generator/

![itunes](https://support.apple.com/content/dam/edam/applecare/images/en_US/itunes/featured-contetn-itunes-icon_2x.jpg)
![rss](https://help.campaignmonitor.com/img/help/RSS-feed-icon.png)


<p align="center">
<img src="https://support.apple.com/content/dam/edam/applecare/images/en_US/itunes/featured-contetn-itunes-icon_2x.jpg" width="32%" margin="auto">

<img src="https://help.campaignmonitor.com/img/help/RSS-feed-icon.png" width="32%" margin="auto">
</p>



For this app we will use 3 libraries:

[Alamofire]() To make http calls:

![Alamofire](https://raw.githubusercontent.com/Alamofire/Alamofire/assets/alamofire.png)

[Kingfisher]() To download and catch images:
![Kingfisher](https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png)

[SwiftyJSON]() To work with JSONs in an easy way:
![SwiftyJSON](https://www.percona.com/sites/default/files/json-logo.png)
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
> github ...
> github ...
- Run "carthage upddate"
- In this case better run "carthage update --platform iOS --no-use-binaries"

Explain error in FlickHockey README

Carthage will create  folder named Carthage, inside this folder you'll have a iOS folder where you can find the .framework compiled files of the libraries cited before.





Dillinger is a cloud-enabled, mobile-ready, offline-storage, AngularJS powered HTML5 Markdown editor.

  - Type some Markdown on the left
  - See HTML in the right
  - Magic

You can also:
  - Import and save files from GitHub, Dropbox, Google Drive and One Drive
  - Drag and drop files into Dillinger
  - Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.  As [John Gruber] writes on the [Markdown site][df1]

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [keymaster.js] - awesome keyboard handler lib by [@thomasfuchs]
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Download and extract the [latest pre-built release](https://github.com/joemccann/dillinger/releases).

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ npm run predeploy
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins

* Dropbox
* Github
* Google Drive
* OneDrive

Readmes, how to use them in your own application can be found here:

* [plugins/dropbox/README.md] [PlDb]
* [plugins/github/README.md] [PlGh]
* [plugins/googledrive/README.md] [PlGd]
* [plugins/onedrive/README.md] [PlOd]

### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantanously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma start
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 80, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
cd dillinger
npm run-script build-docker
```
This will create the dillinger image and pull in the necessary dependencies. Moreover, this uses a _hack_ to get a more optimized `npm` build by copying the dependencies over and only installing when the `package.json` itself has changed.  Look inside the `package.json` and the `Dockerfile` for more details on how this works.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 80 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart="always" <youruser>/dillinger:latest
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


#### docker-compose.yml

Change the path for the nginx conf mounting path to your full path, not mine!

### N|Solid and NGINX

More details coming soon.


### Todos

 - Write Tests
 - Rethink Github Save
 - Add Code Comments
 - Add Night Mode

Licen
