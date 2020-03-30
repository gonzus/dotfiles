# vi:filetype=sshconfig

Host github.com
    User                git
    IdentityFile        ~/.ssh/keys/github+gonzalo.diethelm@gmail.com
    IdentitiesOnly      yes
