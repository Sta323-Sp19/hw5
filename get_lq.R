dir.create("data/lq/", showWarnings = TRUE, recursive = TRUE)

download.file(
  "https://www.lqwebservices.com/lqecommerce/api/ecommerce/propertymaster/hotels?apikey=NjAwQjY2QjEtQzJCQy00ODdFLTk2MzYtQTQ1MUVGODkxMEYz",
  destfile="data/lq/hotel.json"
)
