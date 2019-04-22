#!/bin/sh
scp -i/home/satya/Downloads/key.pem /home/satya/Downloads/test_images/* ubuntu@ec2-13-233-179-28.ap-south-1.compute.amazonaws.com:/home/ubuntu/test_images            
ssh -i/home/satya/Downloads/key.pem ubuntu@ec2-13-233-179-28.ap-south-1.compute.amazonaws.com "sh s2.sh"
