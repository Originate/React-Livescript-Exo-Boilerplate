# React Livescript Exosphere Boilerplate

## Development
To get started on development, run:
* `exo setup` - this will run `npm install` in every service's directory
* `exo run` - this will run the application and you can view it by visiting localhost:3000 in your browser.

This is a very lightweight example and includes only a starter for exosphere. It doesn't actually connect to any other exosphere microservices. The react code with livescript is simply a starter, and shows how to locally load in stylesheets and other react components.

##### Exosphere Services
These are located in the service.yml file. Add sending/receiving objects in order to send/receive from other exosphere microservices.

##### Client
Application is run at `localhost:3000` and all relevant code is found in /web-api/app. Index.ls starts the react root. From there the file system adds components in the /components folder. Localized styles are shown in an example within nav.

##### React-e
An Originate styling library used with React to easily create DOM elements and attach styles from the stylesheets.

##### Stylus
Using Stylus instead of CSS or SCSS, because, well, it's just better. Might as well have the styles look and feel the same as LiveScript.
