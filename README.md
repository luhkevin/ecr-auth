This container authenticates a docker daemon with ECR.
One solution we considered was this project: https://github.com/awslabs/amazon-ecr-credential-helper 
Unfortunately, the amazon-ecr-credential-helper only works with Docker v1.11 and above, and our machines are v1.7
