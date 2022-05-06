students = [
  %{name: "John Doe", age: 18},
  %{name: "Mary Su", age: 21},
  %{name: "Chris Smith", age: 16},
  %{name: "Bob Doe", age: 20},
]

students
|> Enum.filter(&(&1.age >= 18)) # 判別年齡
|> Enum.map(fn %{name: name} -> String.split(name, " ") end) # 切開姓名
|> Enum.map(fn [_, last_name] -> last_name end) # 只拿姓
|> Enum.uniq # 去掉重覆