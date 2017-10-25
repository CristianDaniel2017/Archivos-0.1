#!/usr/bin/env ruby

def check(vect)
	
	raise "Sintax Error" if (vect =~ /^(-?\d+|\*|\+|\/|\^|\-|\%|[sc])$/) == nil	 #excepcion si no caza con la expresion regular
	true #ruby devuelve por defecto la ultima expresion evaluada. En este caso, si caza devuelve false. Si no caza es true
	
end

#------DECLARACION VARIABLES
pila = Array.new()
aux = Array.new()


#------CAPTURA DE DATOS
DATOS = ARGV[0].split
DATOS.each { 
	    |vect| pila.push(vect) if check(vect)
          }

#----MOSTRANDO PILAS

def write(tmp)
  puts 
  i=0
    tmp.each{
      print " #{tmp[i]}"
      i+=1
    }  
  puts 
end  



#-------------------CODIGO--------------------


def signo(actual,pila,aux) 

oprx = (aux.pop).to_f


    case actual
      when '-'
	opry = (aux.pop).to_f
	aux.push((opry - oprx).to_s())	
      when '+'
	opry = (aux.pop).to_f
	aux.push((opry + oprx).to_s())
      when '*'
	opry = (aux.pop).to_f
	aux.push((opry * oprx).to_s())
      when '/'
	opry = (aux.pop).to_f
	aux.push((opry / oprx).to_s())
      when '^'
	opry = (aux.pop).to_f
	aux.push((opry ** oprx).to_s())	
      when '%'
	aux.push(Math.sqrt((oprx)).to_s())	
      when 's'
	aux.push(Math.sin((oprx)).to_s())	
      when 'c'
	aux.push(Math.cos((oprx)).to_s())		
    end   
   
end
 



write(pila)




begin 

actual = pila.shift

    case actual
      when '-','+','*','/','^','%','s','c'
	signo(actual,pila,aux)	
      else
	 aux.push(actual)
    end   

 
write(pila)   
write(aux)

puts 


end while(pila.empty? ==false)

print " resultado: #{aux.pop}"
puts 
puts 
