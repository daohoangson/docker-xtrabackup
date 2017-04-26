Percona XtraBackup container

## Examples

### Backing up

```
docker run --rm -it --net=host \
        -v /etc:/etc/mysql:ro \
        -v /var/lib/mysql:/var/lib/mysql:ro \
        -v ./files:/xtrabackup_backupfiles \
        xfrocks/xtrabackup --backup --host=127.0.0.1 --user=user --password=password
```

 * Connect to server running on the Docker host
 * Back it up reading configuration from `/etc/my.cnf`, data from `/var/lib/mysql/`
 * Put the backup files into `files/` in current directory
 
