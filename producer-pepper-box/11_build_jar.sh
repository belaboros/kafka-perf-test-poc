#sudo apt install openjdk-8-jdk

cd pepper-box
mvn clean package -Djmeter.version=3.0 -Dkafka.version=0.9.0.1
cp pepper-box/target/pepper-box-1.0.jar ../

