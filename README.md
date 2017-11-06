Percona XtraBackup container

## Examples

### Backing up

```
docker run --rm -it --net=host \
        -v /etc:/etc/mysql:ro \
        -v /var/lib/mysql:/var/lib/mysql:ro \
        -v "$PWD/files:/xtrabackup_backupfiles" \
        xfrocks/xtrabackup --backup --host=127.0.0.1 --user=user --password=password
```

 * Connect to server running on the Docker host
 * Back it up reading configuration from `/etc/my.cnf`, data from `/var/lib/mysql/`
 * Put the backup files into `files/` in current directory
 
### Preparing

```
docker run --rm -it \
        -v "$PWD/files:/xtrabackup_backupfiles" \
        xfrocks/xtrabackup --prepare
```

Prepare the backed-up files in `files/` (the backup must be prepared before it can be used FYI).

# Compressed Backup

The image has `qpress` installed so it's possible to use xtrabackup's Compress Backup feature. Something like below should work:

```bash
# Backup with compress + parallel enabled
xtrabackup --backup \
	--compress --compress-threads=4 \
	--parallel=4 \
	--host=127.0.0.1 --user=user --password=password

# Decompress it
xtrabackup --decompress \
        --parallel=4

# Then prepare as normal
xtrabackup --prepare
```

