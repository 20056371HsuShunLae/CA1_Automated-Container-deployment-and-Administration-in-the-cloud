resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("C:/Users/User/public_key.pub") 
}

