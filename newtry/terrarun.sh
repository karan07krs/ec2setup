cd ..
mkdir newuser1
cp "/home/ec2-user/terrafiles/*" "/home/ec2-user/newuser1/*"
cd newuser1
cd dev
terraform init -input=false
terraform apply -input=false -auto-approve
 
