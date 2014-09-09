MAVEN_REPO=${HOME}/.mozosmdroid/repository
MVN=/usr/local/bin/mvn -Dmaven.repo.local=${MAVEN_REPO}

all: jar

# This builds target/osmdroid-android-4.3-SNAPSHOT.jar
jar: build
	${MVN} package

build:
	${MVN} compile

android_sdk:
	rm -rf ${MAVEN_REPO}
	rm -rf maven-android-sdk-deployer
	git clone https://github.com/mosabua/maven-android-sdk-deployer.git
	cd $(shell pwd)/maven-android-sdk-deployer && ${MVN} install -P 4.4

test:
	${MVN} test

clean:
	${MVN} clean
