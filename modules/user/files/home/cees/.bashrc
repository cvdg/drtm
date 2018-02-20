#
# This file is maintained by Puppet.
# Manual changes will be overwritten.
#

if [ -d ${HOME}/bin ] ; then
    PATH=${HOME}/bin:${PATH}
fi

if [ -f /etc/motd ] ; then
    cat /etc/motd
fi

awsauth() {
    MFA_ARN="arn:aws:iam::108935868295:mfa/Cees_van_de_Griend"
    PROFILE="Cees_van_de_Griend"


    unset AWS_PROFILE
    unset AWS_DEFAULT_PROFILE

    echo -n "Enter MFA: "; read MFA_TOKEN

    SESSION=$(aws sts get-session-token --profile $PROFILE --serial-number $MFA_ARN --token-code $MFA_TOKEN | jq -r '.Credentials | .AccessKeyId + " " + .SecretAccessKey + " " + .SessionToken')
    export AWS_ACCESS_KEY_ID=$(echo "$SESSION" | cut -d' ' -f1)
    export AWS_SECRET_ACCESS_KEY=$(echo "$SESSION" | cut -d' ' -f2)
    export AWS_SESSION_TOKEN=$(echo "$SESSION" | cut -d' ' -f3)
}
