#Git rebase current branch on upstream master
gnbm () {
  git fetch origin && \
  git branch $1 origin/master && \
  git checkout $1
}

#Git push new branch
gpnb () {
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

branch () {
  git branch | fzf | xargs git checkout
}

###################
# AWS CLI Functions
###################

#List buckets and search via FZF
aslb () {
  aws s3api list-buckets | jq -r '.Buckets[].Name' | fzf | xargs -I '{}' aws s3 ls s3://{}
}

#list rds and get information from selected
arld () {
 aws rds describe-db-instances | jq -r '.DBInstances[].DBInstanceIdentifier' | fzf | xargs aws rds describe-db-instances --db-instance-identifier
}

#trying out a different function naming convention
#List IAM Roles
list-roles () {
  aws iam list-roles --query "Roles[*].RoleName" | fzf | sed -e 's/^\s*\"//g' -e 's/\",$//g' | xargs aws iam list-attached-role-policies --role-name
}

#list policies attached to an IAM role
grp () {
  aws iam list-roles | jq -r '.Roles[].RoleName' | fzf | xargs aws iam list-attached-role-policies --role-name
}

asar () {
  aws sts assume-role --role-arn $1 | jq -r '.Credentials | export AWS_ACCESS_KEY_ID=\(.AccessKeyId\) \
    export AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey \
    export AWS_SESSION_TOKEN=\(.SessionToken\)'
}

#Find ip address of EC2 instance given instance name using fzf, and SSH into it
ceb () {
  aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | " \(.InstanceId) \(.Tags[] | select(.Key|test("Name")) | .Value) \(.PrivateIpAddress)" ' | fzf | xargs -o aws ssm start-session --target
}


#################
# Terraform Stuff
# ###############

#Inspect remote state objects
tss () {
  terraform state list | fzf | xargs terraform state show
}

###############
# Kubectl stuff
##############

#get live manifest of pod in yaml format given the namespace
kdp () {
  kubectl get pods -n $1 -o NAME | fzf | xargs -I {} kubectl get -n $1 {} -o yaml | bat
}

##################
# Helm Chart Stuff
##################

ht () {
  helm dependency update && helm template -f $1 . | bat
}

#################
# Terraform Module Hash Update
# ###############

thu () {

}

#################
# Chef Stuff
################
#knife bootstrap -N <node_name> -E <environment> -r 'role[base],role[something]' -i <path_to_ssh_key> -x centos --secret-file <path_to_secret_key> -y --sudo <ip address>
#
#############
# Other stuff
# ###########
#
#generate random str alphanumeric string given string length as integer
genstring () {
  cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w $1 | head -n1
}
