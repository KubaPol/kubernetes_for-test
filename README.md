Способы проверки работы приложения в кубернетес:

kubectl logs deployment/devops-test

Проверка доступности сервиса:

kubectl get svc devops-test-service

kubectl port-forward svc/devops-test-service 8000:8000

curl -v http://localhost:8000

Проверка подов:

kubectl get pods

kubectl describe pod <pod-name>




Рестарт все deployments с подстрокой test в названии

kubectl get deployments | grep "test" | awk '{print $1}' | xargs kubectl rollout restart deploymenit 

или kubectl get deployments | grep "test" | awk '{print $1}' | xargs kubectl rollout restart deployment

Проверка статуса:

kubectl get pods

kubectl describe deployment devops-test



Удаление подов в куб и почему они восстанавливаются:

kubectl delete pod <pod-name> -n kube-system

а после через пару сек снова появится 

kubectl get pods -n kube-system

все это происходит потому что это часть механизма самовостановления кубернетес
