- To build each of the microservices, you need to run the xxxx/build.script.sh script
- You do NOT need neither Igor nor Echo to have a functioning Spinnaker.  
These 2 microservices are responsible mostly for Jenkins / Travis integration

Before you start:
- Create the SpinnakerManaged role on your AWS account
- Read the README in the Clouddriver ECS module for how to set up your Spinnaker IAM role
- Each microservice has a NAME.yml parameter file.  You will need to update it with your own parameters, mostly URLs of load balancers where you deploy your Spinnaker microservices
- For Deck, you will need to modify the `cheese-gate-url.py` file with the proper URL for your Gate microservice.
- Deck depends on Gate.  Orca depends on Clouddriver.  Gate depends on most microservices, including Clouddriver.
- You can share a single Redis instance between all microservices
- You should use s3 as the data store for front50, as per the configuration already in place.
- The variables in the various `build.script.sh` currently assume your ECRs have the same names as the microservices.  You could change that, but there's no good reason to do it really.    

In order to build the docker images, you will need to have on your machine:
- Python
- Java 8+
- Node
- Yarn
- NPM


