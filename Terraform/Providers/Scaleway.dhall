{-
Relevant functions for standing up infrastructure on Scaleway.

Example:
```
let TF/var = ../var
let s = ./Scaleway.dhall in
let images = {
  default = "aecaed73-51a5-4439-a127-6d8229847145"
} in
{
  variable = {
    organization = {=},
    token = {=}
  },

  provider = {
    scaleway = {
      organization = TF/var "organization",
      token        = TF/var "token",
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
```
-}
    let List/concat =
          https://ipfs.io/ipfs/QmdtKd5Q7tebdo6rXfZed4kN6DXmErRQHJ4PsNCtca9GbB/Prelude/List/concat

in  let List/map =
          https://ipfs.io/ipfs/QmdtKd5Q7tebdo6rXfZed4kN6DXmErRQHJ4PsNCtca9GbB/Prelude/List/map

in  let Optional/map =
          https://ipfs.io/ipfs/QmRXk8gc6mVLUFKa6qKjh9sNoqXSrCWbwBFXuguTozFoFa/Prelude/Optional/map

in  let Tf/ref3 = ../ref3

in  { ip =
          λ(name : Text)
        → λ(server : Optional Text)
        → λ(reverse : Optional Text)
        → { mapKey =
              name
          , mapValue =
              { server =
                  Optional/map
                  Text
                  Text
                  (λ(k : Text) → Tf/ref3 "scaleway_server" k "id")
                  server
              , reverse =
                  reverse
              }
          }
    , server =
          λ(name : Text)
        → λ(type : Text)
        → λ(image : Text)
        → { mapKey =
              name
          , mapValue =
              { name = name, type = type, image = image }
          }
    , volume =
          λ(name : Text)
        → λ(size : Integer)
        → λ(type : Text)
        → { mapKey =
              name
          , mapValue =
              { name = name, type = type, size_in_gb = size }
          }
    , volume_attachment =
            let AttachmentType
                : Type
                = { mapKey : Text, mapValue : { server : Text, volume : Text } }

        in    λ(name : Text)
            → λ(vols : List Text)
            → List/map
              Text
              AttachmentType
              (   λ(vol : Text)
                → { mapKey =
                      vol
                  , mapValue =
                      { server =
                          Tf/ref3 "scaleway_server" name "id"
                      , volume =
                          Tf/ref3 "scaleway_volume" vol "id"
                      }
                  }
              )
              vols
    , volume_attachments =
            let AttachmentType
                : Type
                = { mapKey : Text, mapValue : { server : Text, volume : Text } }

        in    λ(attachments : List (List AttachmentType))
            → List/concat AttachmentType attachments
    , security_group =
          λ(name : Text)
        → λ(description : Text)
        → { mapKey =
              name
          , mapValue =
              { name = name, description = description }
          }
    , security_group_rule =
            let opts =
                  { action :
                      Text
                  , direction :
                      Text
                  , ip_range :
                      Text
                  , protocol :
                      Text
                  , port :
                      Integer
                  }

        in    λ(name : Text)
            → λ(group : Text)
            → λ(opts : opts)
            → { mapKey =
                  name
              , mapValue =
                    { security_group =
                        Tf/ref3 "scaleway_security_group" group "id"
                    }
                  ∧ opts
              }
    }
