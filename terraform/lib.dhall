{
  ref = \(scope: Text) -> \(resource: Text) -> \(name: Text) -> "\${${scope}.${resource}.${name}}",
  var = \(name: Text) -> "\${var.${name}}"
}
