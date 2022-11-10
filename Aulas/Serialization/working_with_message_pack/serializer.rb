require 'json'

module BasicSerializable
  # should point to a class; change to a different
  # class (e.g. MessagePack, Json, Yaml) to get a different
  # serialization

  @@serializer = JSON

  def serialize
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.each_key do |key|
      instance_variable_set(key, obj[key])
    end
  end
end
