# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = {"Tecnología" => [ "Computación",
                                "Electrónica, audio y video",
                                "Impresoras e insumos",
                                "Celulares y telefonía"],
              "Alimentos y Bebidas" => ["Orgánico",
                                        "Abarrotes",
                                        "Vinos y licores"],
              "Herramientas e industrias" => ["Ferretería",
                                              "Protección y seguridad",
                                              "Construcción",
                                              "Industria gastronómica",
                                              "Equipamiento para oficina"], 
              "Salud y cuidado personal" => ["Farmacia",
                                             "Higiene y belleza",
                                             "Suministros médicos",],
              "Hogar" => ["Línea blanca",
                          "Cocina",
                          "Baño",
                          "Limpieza",
                          "Muebles"],
              "Servicios" => ["Fiestas y eventos",
                              "Publicidad",
                              "Transporte",
                              "Otros servicios"],
              "Outlet" => []
            }

categories.each do |main_category, subcategory|
  category = Category.find_or_create_by(title: main_category)

  subcategory.each do |sub|
    category.subcategories.find_or_create_by(title: sub)
  end
end