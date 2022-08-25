my_hash = { 
  
  "Name" => "Vitor",
  :teste => "testando"

}

puts my_hash[:teste]

puts my_hash.fetch(:name, "Não Encontrado")

my_hash[:teste2] = "Testando 2"

my_hash["Name"]  = "Vitor Serigati"

puts my_hash

my_hash.delete(:teste2)

puts my_hash

hash2 = {
  try_this: "Works!",
  so_beauty: "isn't it?"
}
