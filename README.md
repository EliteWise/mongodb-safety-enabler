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

### Security Highlights
Authentication: The script activates authentication, which ensures that users must provide a valid username and password before they're granted access.

Admin User Creation: By creating an administrative user, you can manage other users and their permissions effectively.

IP Binding: By default, MongoDB listens on 127.0.0.1 (localhost). The --allow-external-access option expands this to listen on all network interfaces. This should be used judiciously, ensuring that firewalls and other security measures are in place.
