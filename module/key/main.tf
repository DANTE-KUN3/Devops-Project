resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = file("key.pub")
}
