What to contribute
==================

- New wrappers for [Terraform Providers](https://www.terraform.io/docs/providers/index.html)
- New versions of existing [Terraform Providers](./Terraform/Providers/)

How to contribute
=================

- Expose both Data Sources and Resources, where applicable
- Follow existing patterns for ergonomics
- Segment files where applicable for large providers

Ergonomics
==========

The underlying Terraform JSON structure is not always useful for humans to interact with. As a result, one of the goals of this project is to strike a balance between what the users expect (what's publicly documented in the Terraform Provider specification) and what is most convenient to consume from Dhall.

What follows are some examples of ergonomics, in lieu of a formal specification:

Repeted structures
------------------

### JSON
```
        "scaleway_volume_attachment": {
            "test_0": {
                "server": "${scaleway_server.test.id}",
                "volume": "${scaleway_volume.test_0.id}"
            },
            "test_1": {
                "server": "${scaleway_server.test.id}",
                "volume": "${scaleway_volume.test_1.id}"
            }
        }
```

### Dhall
```
    scaleway_volume_attachment = s.volume_attachments [
      s.volume_attachment "test" ["test_0", "test_1"]
    ]
```

### Why
The server ID and volume IDs are the primary focus. We don't care what the keys are in the `scaleway_volume_attachment` object, so long as they are unique. Given the goal of fully specifying all volume attachments associated with a server name, we find ourselves with nested `List`s. As `List/concat` isn't provided in Dhall by default, we provide `volume_attachments`, which depends on `List/concat` and re-exposes a concretized interface.

Structural Parameters vs other Parameters
-----------------------------------------

### JSON
```
        "scaleway_security_group_rule": {
            "http_accept": {
                "security_group" : "${scaleway_security_group.http.id}",
                "action"    : "accept",
                "direction" : "inbound",
                "ip_range"  : "0.0.0.0/0",
                "protocol"  : "TCP",
                "port"      : 80
            }
        }
```

### Dhall
```
    scaleway_security_group_rule = [
      s.security_group_rule "http_accept" "http" {
        action = "accept",
        direction = "inbound",
        ip_range = "0.0.0.0/0",
        protocol = "TCP",
        port = 80
      }
    ]
```

### Why
`http_accept` is the name of the rule, `http` is the name of the security group. Neither of these provide any information that will be rendered into the infrastructure; as a result, by separating the Structural Parameters, we provide more clarity to the reader of what's actually important.
