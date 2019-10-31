In this tutorial we first need to establish a set of services running in 
Kubernetes. One service, called the `consumer`, fetches data from the other
service, called the `provider`, over the HTTP protocol.

In the current operational deployment, the `consumer` expects the `provider` to be
around when calling it. We can use a Chaos Toolkit experiment to explore what 
will happen when one service, the `provider` downstream service goes down in terms of how this is reflected in overall system availability, as measured by how the `consumer` responds.

To begin with, you need to setup the Kubernetes cluster with the consumer and provider services. 
First, ensure that the environment has set itself up correctly. If it has you should see a 
`All set, you can now start your class.` message in the terminal.

Once you see that message, navigate to where the files are that can setup the environment by executing the following command in the terminal:

`cd chaostoolkit-samples/service-down-not-visible-to-users`{{execute}}

Deploy the application and setup the services using the following command:

`kubectl create -f consumer-service.json -f provider-service.json -f 01-before`{{execute}}

Kubernetes may take a little while to get everything initialised and settled, so use the following command until all of the services state that they are `READY`:

`kubectl get all`{{execute}}

Once the services are running you can retrieve the public endpoint to call
the consumer service:

`/root/get-consumer-service-address.sh`{{execute}}

Take the address reported back by the previous command and execute a `curl` command, such as the following (but with your own system's service address as reported by the previous command) until the curl command responds with the message `Simple Boot Microservice Consumer Alive!`:

`curl <your service address>`

***NOTE:*** **It may take a little while for the curl command to respond successfully as Kubernetes is creating all the services and pods and then starting up the Spring Boot services that make up the consumer and the provider. Until the service is started you are likely to get a "Connection refused" message from curl.**

To check that the `consumer` and the `provider` are wired together and talking execute another `curl` command:

`curl <your service address>/invokeConsumedService`

You should see a response similar to:

```
com.russmiles.antifragilesoftware.SimpleBootMicroserviceProvider$$EnhancerBySpringCGLIB$$a4df4aa7@683c2b43 instance saying: Hello Microservice World
```

With both endpoints returning successfully the initial system is up and running! Now it's time to explore its weaknesses with some chaos...
