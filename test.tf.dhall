let tf = env:TERRAFORM in
let images = {
  default = "aecaed73-51a5-4439-a127-6d8229847145"
} in
let s = tf.providers.scaleway in
{
  variable = {
    organization = {=},
    token = {=}
  },

  provider = {
    scaleway = {
      organization = tf.var "organization",
      token        = tf.var "token",
      region       = "par1"
    }
  },

  resource = {
    scaleway_ip = [
        s.ip "ip_0" (["test"]: Optional Text) ([]: Optional Text)
    ],
    scaleway_server = [
      s.server "test" "C2S" images.default
    ],

    scaleway_volume = [
      s.volume "test_0" 50 "l_ssd"
    ],

    scaleway_volume_attachment = s.volume_attachments [
      s.volume_attachment "test" ["test_0"]
    ],

    scaleway_security_group = [
      s.security_group "http" "allow HTTP and HTTPS traffic"
    ],

    scaleway_security_group_rule = [
      s.security_group_rule "http_accept" "http" {
        action = "accept",
        direction = "inbound",
        ip_range = "0.0.0.0/0",
        protocol = "TCP",
        port = 80
      },
      s.security_group_rule "https_accept" "http" {
        action = "accept",
        direction = "inbound",
        ip_range = "0.0.0.0/0",
        protocol = "TCP",
        port = 443
      }
    ]
  }
}
