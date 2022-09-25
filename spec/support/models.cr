abstract class Model < Jennifer::Model::Base
end

class User < Model
  mapping(
    id: Primary32,
    name: String,
    age: Int32?,
    admin: {type: Bool, default: false}
  )
end
