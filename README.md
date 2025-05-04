# Kubernetes DevOps Test Project

Репозиторий с выполнением тестового задания по DevOps: от создания Docker-образа до деплоя в Kubernetes с использованием Helm и CI/CD.

## Содержание задания:

1. **Docker-образ**
   - Работает под UID `1001`.
   - Запускает web-сервер на порту `8000`.
   - Отдаёт содержимое `/app`, например, `http://localhost:8000/test.html`.
   - Образ доступен на Docker Hub: `docker.io/yourusername/imagename`.

2. **Kubernetes-манифесты**
   - Деплой приложения с liveness/readiness-пробами.
   - Настроены ресурсы (limits и requests).
   - Файлы в директории `k8s/`.

3. **Helm-чарт**
   - Универсализирован деплой с возможностью конфигурации.
   - Размещён в директории `helm/`.

4. **CI/CD**
   - Скрипт сборки и деплоя образа: `cicd/deploy.sh`.
   - Готов к интеграции с GitLab CI или GitHub Actions.

5. **Проверка работоспособности**
   - `curl http://<pod-ip>:8000/test.html`
   - `kubectl logs <pod>`
   - `kubectl get pods` и `kubectl describe pod <pod>`

6. **Обновление деплойментов**
   - Команда: `bash restart-all-deployments.sh`
   - Обновляет все деплойменты, содержащие `test` в имени.

7. **Удаление подов из `kube-system`**
   - Скрипт: `bash delete-kube-system-pods.sh`
   - Объяснение:
     - `core-dns` восстанавливается ReplicaSet'ом.
     - `kube-apiserver` — static pod, управляется kubelet с ноды.

---

## Навыки, демонстрируемые в проекте:

- Создание Docker-образов под конкретные требования
- Работа с Kubernetes (манифесты, ресурсы, probes)
- Helm — шаблонизация и параметризация деплойментов
- CI/CD пайплайн деплоя
- Умение отлаживать и управлять кластером

---

## Как запустить

```bash
# Сборка Docker-образа
docker build -t yourusername/imagename .

# Деплой через kubectl
kubectl apply -f k8s/

# Либо деплой через Helm
helm install myapp helm/ --values helm/values.yaml

