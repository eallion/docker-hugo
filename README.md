# Build latest Hugo  

Build latest Hugo Docker image based on `ubuntu:latest`  

> https://hub.docker.com/r/eallion/hugo

# Usage

### 1. Clone

```bash
git clone https://github.com/eallion/docker-hugo
```

### 2. Download 

- Download Hugo latest via shell script.

```bash
./hugo.sh
```

- Or download `.deb` at [Hugo Releases](https://github.com/gohugoio/hugo/releases) mannerly, save it into `./tmp` folder named `hugo.deb`.

### 3. Build image

> `eallion` is my Docker hub username.

```bash
docker build -t eallion/hugo .
```

> **Warning**   
> Don't forget the dot `.` at the end.  

Test the image:  
```
docker run --rm -it eallion/hugo hugo version
```
You will get the message like this:
```
hugo v0.105.0-0e3b42b4a9bdeb4d866210819fc6ddcf51582ffa linux/amd64 BuildDate=2022-10-28T12:29:05Z VendorInfo=gohugoio
```

### 4. Push image

- Login to Docker hub

```
docker login -u eallion
```
> Then enter the Docker hub token

- Push image

```
docker push eallion/hugo:latest
```

### 5. Push to other registry (Option)

#### 5.1 Push to [Coding.net](https://eallion.coding.net/public-artifacts/eallion/hugo/packages)

> **Note**  
> You need to generate your own `<PASSWORD>`  

- Login
```
docker login -u <USERNAME> -p <PASSWORD> eallion-docker.pkg.coding.net
```

- Retag
```
docker tag eallion/hugo:latest eallion-docker.pkg.coding.net/eallion/hugo/hugo:latest
```

- Push
```
docker push eallion-docker.pkg.coding.net/eallion/hugo/hugo:latest
```

- Pull
```
docker pull eallion-docker.pkg.coding.net/eallion/hugo/hugo:latest
```

#### 5.2 Push to [Aliyun](https://www.aliyun.com/product/acr)  

- Login
```
docker login -u <USERNAME> registry.cn-shanghai.aliyuncs.com
```

- Retag
```
docker tag eallion/hugo:latest registry.cn-shanghai.aliyuncs.com/eallion/hugo:latest
```

- Push
```
docker push registry.cn-shanghai.aliyuncs.com/eallion/hugo:latest
```

- Pull
```
docker pull registry.cn-shanghai.aliyuncs.com/eallion/hugo:latest
```
