# find_or_create_by(title: sub)

main_measures = ['Kilo',
                 'Pieza',
                 'Caja',
                 'Paquete',
                 'Unidad',
                 'Costal']

main_measures.each do |measure|
  Measure.find_or_create_by(name: measure)
end
