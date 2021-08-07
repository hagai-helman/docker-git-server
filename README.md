```helmantov/git-server``` is a docker image of a Git HTTP server, that supports multiple Git repositories, each with different credentials.

It's especially useful for Git repositories with hooks.

## Installation


```
docker pull helmantov/git-server
```


## Usage   

To use the image, you need to create a folder with two sub-folders: ```repos``` and ```tokens```:
* ```repos``` contains your Git repositories (created using ```git init``` or ```git clone```);
* ```tokens``` contains a file for each repository in ```repos```:
	* The file sets the credentials needed to access the corresponding repository. 
	* The file should be named exactly like the repository folder. For example, if the folder is named ```my_repo.git```, the filename also should be ```my_repo.git```.
	* The file contains a token identifier and the secret token itself, separated by a colon. It's possible to have multiple entries, with each entry terminated by a single newline.

When running a container, the folder needs to be mounted to ```/host```.

Note that the container does not support HTTPS, and is meant to be used behind a reverse proxy that does.

To connect to a repository on the server using ```git remote``` (or ```git clone```), one should use the Git URL ```https://{token identifier}:{token secert}@{server base address}/repos/{repository folder name}```.


### Using Docker CLI  


```  
docker run \  
  -v /home/john/git-server-folder:/host \  
  -d \  
  helmantov/borg-server  
```


### Using Docker-Compose


```  
---  
version: "3"  
services:  
  borg-server:  
    image: helmantov/borg-server  
    volumes:  
      - /home/john/git-server-folder:/host
```
