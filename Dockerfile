FROM  bellsoft/liberica-openjdk-alpine:17.0.12

RUN apk add curl jq

#workspace

WORKDIR /home/selenium-docker

#Add required files to run the test dot below represent home directory
ADD target/docker-resources ./
ADD runner.sh runner.sh
#ADD  the pom.xml pom.xml file

#Enviorment variables check
#Browser
#HUB_HOST
#TEST_SUITE
#THREAD_COUNT

#Run the test
ENTRYPOINT java -cp 'libs/*' \
						-Dselenium.grid.enabled=true \
					 	-Dselenium.grid.hubhost=${HUB_HOST}\
						-Dbrowser=${BROWSER} org.testng.TestNG \
						-threadcount ${THREAD_COUNT} test-suites/${TEST_SUITE}
						