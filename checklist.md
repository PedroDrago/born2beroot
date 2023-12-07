# Checklist

### Partitioning
- [ ] Encrypted partitioning following example (mandatory and bonus have different partitioning).

### SSH
- [ ] SSH service running only on port 4242. 
- [ ] Impossible to connect with SSH as root.
- [ ] Port 4242 open in ufw.

### users | hostname | groups
- [ ] Hostname as your intra login ending with 42 (pdrago42).
- [ ] Additional user with your intra login as username (pdrago).
- [ ] The additional user must belong to user42 and sudo groups

### Password Policy
- [ ] Password has to expire every 30 days.
- [ ] Minimum number of days allowed before the modification of a password is 2.
- [ ] The user has to receive a warning message 7 days before their password expires.
- [ ] Your password must:
    - [ ] Contain at least 10 characters.
    - [ ] Contain an uppercase letter.
    - [ ] Contain a lowercase letter.
    - [ ] Contain a number.
    - [ ] Not contain more than 3 consecutive identical characters.
    - [ ] Not include the name of the user.
    - [ ] Root must comply to all above policies.
    - [ ] Contain at least 7 characters that are not part of the former password.
### Sudo configuration
- [ ] Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
- [ ] A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.
- [ ] Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo folder.
- [ ] tty mode has to be enabled for security reasons
- [ ] The paths that can be used by must be restricted.

### Script
- [ ] Every 10 minutes the output of the script will be displayed on all terminals. No error must be visible.
- [ ] The number of physical processors.
- [ ] The number of virtual processors.
- [ ] The current available RAM on your server and its utilization rate as a percentage.
- [ ] The current available memory on your server and its utilization rate as a percentage.
- [ ] The current utilization rate of your processors as a percentage.
- [ ] The date and time of the last reboot.
- [ ] Whether LVM is active or not.
- [ ] The number of active connections.
- [ ] The number of users using the server.
- [ ] The IPv4 address of your server and its MAC (Media Access Control) address.
- [ ] The number of commands executed with the sudo program.

### Bonus
- [ ] Partition accordingly to bonus subject example.
- [ ] Setup functional Wordpress website with:
    - [ ] lighttpd
    - [ ] MariaDB
    - [ ] php
    - [ ] Wordpress
- [ ] Setup extra service
