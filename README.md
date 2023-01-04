# Docker image with browsers and Cypress installed

This particular image is build to match Node and NPM versions of [Meteor](https://www.meteor.com) framework and the lowest possible browser versions (for compatiblity test).

Images hosted on Docker Hub: [megawebmaster/cypress](https://hub.docker.com/r/megawebmaster/cypress)


Name + Tag                     | Node    | NPM     | Firefox | Google Chrome | Microsoft Edge | Cypress | Plugins
------------------------------ | ------- | ------- | ------- | ------------- | -------------- | ------- | -------
megawebmaster/cypress:4.4.0    | 13.6.0  |         | 72.0.2  | 80.0.3987.87  |                | 4.4.0   |
megawebmaster/cypress:4.5.0-1  | 13.6.0  |         | 72.0.2  | 80.0.3987.87  |                | 4.5.0   |
megawebmaster/cypress:5.2.0-2  | 13.8.0  |         | 75.0    | 81.0.4044.113 |                | 5.2.0   | cypress-file-upload@4.1.1
megawebmaster/cypress:5.2.0-3  | 13.8.0  |         | 75.0    | 81.0.4044.113 |                | 5.2.0   | cypress-file-upload@4.1.1, cypress-wait-until@1.7.1
megawebmaster/cypress:5.6.0-1  | 12.14.1 |         | 81.0    | 85.0.4183.121 |                | 5.6.0   | cypress-file-upload@4.1.1, cypress-wait-until@1.7.1
megawebmaster/cypress:6.2.0-1  | 12.18.3 |         | 82.0    | 85.0.4183.121 |                | 6.2.0   | cypress-file-upload@4.1.1, cypress-wait-until@1.7.1
megawebmaster/cypress:6.2.0-2  | 12.18.3 |         | 79.0    | 85.0.4183.121 |                | 6.2.0   | cypress-file-upload@4.1.1, cypress-wait-until@1.7.1
megawebmaster/cypress:6.5.0-1  | 12.18.3 |         | 86.0    | 85.0.4183.121 |                | 6.5.0   | cypress-file-upload@5.0.2, cypress-wait-until@1.7.1
megawebmaster/cypress:6.7.0-1  | 12.18.4 |         | 88.0.1  | 90.0.4430.93  |                | 6.7.0   | cypress-file-upload@5.0.2, cypress-wait-until@1.7.1
megawebmaster/cypress:7.4.0-1  | 12.18.4 |         | 88.0.1  | 90.0.4430.93  |                | 7.4.0   | cypress-file-upload@5.0.2, cypress-wait-until@1.7.1
megawebmaster/cypress:9.5.1-1  | 14.18.1 |         | 88.0.1  | 90.0.4430.93  |                | 9.5.1   | cypress-wait-until@1.7.1
megawebmaster/cypress:9.6.1-1  | 14.18.1 |         | 88.0.1  | 90.0.4430.93  |                | 9.6.1   | cypress-wait-until@1.7.2
megawebmaster/cypress:9.7.0-1  | 14.18.1 |         | 88.0.1  | 90.0.4430.93  |                | 9.7.0   | cypress-wait-until@1.7.2
megawebmaster/cypress:12.3.0-3 | 14.21.1 | 6.14.17 | 93.0    | 81.0.4044.92  | 95.0.1020.38   | 12.3.0  |

