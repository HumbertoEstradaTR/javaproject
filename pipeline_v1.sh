rd /s /q "C:\Users\Humberto Estrada\Desktop\buffer_maven\javaproject"
git clone https://github.com/Singedpls/javaproject
cd C:\Users\Humberto Estrada\Desktop\buffer_maven\javaproject
docker container stop maven_app_test
docker container rm maven_app_test
docker build -t maven_app_image:v1.0 .
docker run -it --name maven_app_test maven_app_image:v1.0
docker container prune -f && docker image prune -f