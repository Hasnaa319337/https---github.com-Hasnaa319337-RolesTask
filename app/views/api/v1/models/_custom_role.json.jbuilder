json.id resource.id
# could be nil for a deleted agent hence the safe operator before account id
json.name resource.name
json.description resource.description
json.permissions resource.current_permissions_stringified
