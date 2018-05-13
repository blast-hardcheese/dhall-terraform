let List/concat = https://ipfs.io/ipfs/QmdtKd5Q7tebdo6rXfZed4kN6DXmErRQHJ4PsNCtca9GbB/Prelude/List/concat in
let List/map = https://ipfs.io/ipfs/QmdtKd5Q7tebdo6rXfZed4kN6DXmErRQHJ4PsNCtca9GbB/Prelude/List/map in
let Optional/map = https://ipfs.io/ipfs/QmRXk8gc6mVLUFKa6qKjh9sNoqXSrCWbwBFXuguTozFoFa/Prelude/Optional/map in
let lib = env:LIB in
{
  scaleway = {
    ip = \(name: Text) -> \(server: Optional Text) -> \(reverse: Optional Text) -> {
      mapKey = name,
      mapValue = {
        server = Optional/map Text Text (\(k: Text) -> lib.ref "scaleway_server" k "id") server,
        reverse = reverse
      }
    },

    server = \(name: Text) -> \(type: Text) -> \(image: Text) -> { mapKey = name, mapValue = { name = name, type = type, image = image } },

    volume = \(name: Text) -> \(size: Integer) -> \(type: Text) -> { mapKey = name, mapValue = { name = name, type = type, size_in_gb = size } },

    volume_attachment = let AttachmentType: Type = { mapKey: Text, mapValue: { server: Text, volume: Text } } in
      \(name: Text) -> \(vols: List Text) -> List/map Text AttachmentType (
        \(vol: Text) -> { mapKey = vol, mapValue = { server = lib.ref "scaleway_server" name "id", volume = lib.ref "scaleway_volume" vol "id" } }
      ) vols,

    volume_attachments = let AttachmentType: Type = { mapKey: Text, mapValue: { server: Text, volume: Text } } in
      \(attachments: List (List AttachmentType)) -> List/concat AttachmentType attachments,

    security_group = \(name: Text) -> \(description: Text) -> { mapKey = name, mapValue = { name = name, description = description } },

    security_group_rule = let opts = {
        action: Text,
        direction: Text,
        ip_range: Text,
        protocol: Text,
        port: Integer
      } in
      \(name: Text) -> \(group: Text) -> \(opts: opts) -> {
        mapKey = name,
        mapValue = {
          security_group = lib.ref "scaleway_security_group" group "id"
        } /\ opts
      }
  }
}
