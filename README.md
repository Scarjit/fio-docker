This Docker image contains the `fio` tool, which is licensed under GPLv2. The Dockerfile and any related scripts are licensed under the MIT License.

For the `fio` source code and GPLv2 license, please visit: https://github.com/axboe/fio


To run execute:
```
docker pull ghcr.io/scarjit/fio-docker:latest
docker run --rm --privileged --device /dev/sda -v /tmp:/mnt/logs ghcr.io/scarjit/fio-docker:latest

```
