# Docker Guideline

## Containers

- Containers should be ephemeral.
- Use a .dockerignore file.
- Use multi-stage builds.
- Avoid installing unnecessary packages.
- Each container should have only one concern.
- Minimize the number of layers.
- Sort multi-line arguments.
- Build cache.
- Dont trust arbitrary base images.
- Use small base image.
- Use the builder pattern.

## Inside Container

- Use non-root user inside container.
- Make the file system read only.
- One process per container.
- Dont restart on failure, crash cleanly instead.
- Log to stdout & stdderr
- Add dumb-init to prevent zombie processes.

## Contact

Binh Nguyen
