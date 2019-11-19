**Please wait for the environment preparation to finish**

The application is consisting of three components.

Let's explore them by running `docker-compose up`{{execute}}

This command is building docker containers connecting them to communicate with each other.

## Access the Shop
Each environment has a unique URL.
To the Application by clicking the **Shop** tab next to the **Terminal** tab. 

## Swagger UI
To access the Swagger UI append the `/ui` to the Shop URL:
https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ui


## Stopping the Application
You can stop the application by pressing `control + C`(Mac) or `Ctrl + C`(Linux/Win).

To clean up run `docker-compose down`{{execute}}
This will clean up the the Environment and network.