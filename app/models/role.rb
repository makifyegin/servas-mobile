class Role < ApplicationRecord
enum :role, {
  member: "member",
  admin: "admin",
  owner: "owner"
}
end
