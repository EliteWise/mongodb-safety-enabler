# mongodb-safety-enabler

The primary goal of this script is to enhance MongoDB's security. By default, MongoDB runs without authentication enabled. This script aims to quickly secure your MongoDB instance by creating an administrative user and enabling necessary security settings.

### Usage
```sh
./setup.sh [options]
```
### Options
- `-u` or `--username`: Specify the username for the new admin user. This user will have privileges to perform any action on any database.
- `-p` or `--password`: Specify the password for the new admin user.
- `--allow-external-access`: This option allows MongoDB to accept connections from any IP address. By default, for security reasons, MongoDB will only listen on 127.0.0.1.

### Example
To create a secure user named "myAdminUser" with password "securePassword" and allow controlled external access:

```sh
./script_name.sh -u myAdminUser -p securePassword --allow-external-access
```
