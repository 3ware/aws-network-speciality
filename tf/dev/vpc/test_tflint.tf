resource "aws_iam_policy" "policy" {
  name   = "test_policy"
  policy = <<-EOF
{
	"Version": "2012-10-17",
	"Statement": [
	  {
			"Sid": "This contains invalid-characters.", //invalid Sid
	    "Action": [
	      "ec2:Describe*"
			],
			"Effect": "Allow",
			"Resource": "arn:aws:s3:::<bucketname>/*"
	  }
	]
}
EOF
}
