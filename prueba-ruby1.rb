#Vinculación del archivo .csv
def read_alumnos(file_name)
file=File.open(file_name, 'r')
alum=file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end

arr_de_alumnos = read_alumnos('notas-alumnos.csv')

#MENÚ
def menu
  puts 'MENÚ:'
  puts '1) Promedios de Notas'
  puts '2) Inasistencias'
  puts '3) Aprobados'
  puts '4) SALIR'
end

menu
puts 'Ingrese una opción: '
opcion = gets.chomp.to_i
puts ("")

#Método propio que me permite evaluar si, según la nota de cada alumno, este aprueba o repite el curso
def aprobar?(nota)
  if nota >= 5
    return true
  else
    return false
  end
end

while opcion != 4
  #Cálculo del promedio de notas por alumno
  if opcion == 1
    puts ('___________________')
    puts ""
    puts 'PROMEDIOS DE NOTAS:'

    arr_de_alumnos.each do |alumno|
      notas = alumno[1..-1].map { |num| num.to_i }
      suma_notas = notas.sum
      promedio = suma_notas / ( alumno.length - 1 ).to_f
      puts "#{alumno[0]}: #{promedio}"
    end
    puts ('___________________')
    puts ""

  #Determinación de inasistencias
  elsif opcion == 2
    puts ('___________________')
    puts ""
    puts 'INASISTENCIAS:'

    arr_de_alumnos.each do |alumno|
      inasistencias = alumno.count("A")
      puts "#{alumno[0]}: #{inasistencias}"
    end
    puts ('___________________')
    puts ""

  #Determinación de si aprueban o no el curso
  elsif opcion == 3
    puts ('___________________')
    puts ""
    puts 'APROBADOS:'
    arr_de_alumnos.each do |alumno|
      notas = alumno[1..-1].map { |num| num.to_i }
      suma_notas = notas.sum
      promedio = suma_notas / ( alumno.length - 1 )

      if aprobar?(promedio) == true
        puts "#{alumno[0]}: Aprobado"
      else
        puts "#{alumno[0]}: Repite"
      end
    end
    puts ('___________________')
    puts ""
  else
    puts ('-------------------')
    puts 'Ingrese una opción válida'
    puts ('-------------------')
    puts ""
  end
  menu
  puts 'Ingrese una opción: '
  opcion = gets.chomp.to_i
end
