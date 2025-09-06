# Design Document

## CI Pipeline
- Trigger: push y pull_request a `main`.
- Matriz Python: 3.10, 3.11, 3.12.
- Linter: flake8.
- Tests: pytest + coverage (XML y resumen).
- Build Docker image y tag con la rama (`github.ref_name`).
- Push de la imagen a un registry público (GHCR).
- Subir artifacts: resultados de tests y coverage.xml.
- Comentar en el PR con: link de la imagen, resultados, % cobertura y links a artifacts.

## CD Pipeline
- Trigger: solo tras CI exitoso (workflow_run).
- Pull de la imagen publicada.
- “Mock deploy”: ejecutar el contenedor (`python -m sample_app 2 3`).
- Comentar en el PR con el estado del “deploy”.

## Notas
- Bonus: cache de dependencias, security scan, umbral de cobertura.
