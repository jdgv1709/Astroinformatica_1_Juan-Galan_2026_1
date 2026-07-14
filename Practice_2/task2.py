#AStroinformatics 1 Practice 2
#Juan David Galan Vargas
import sys

t_k = float(sys.argv[1]) #Temperature in Kelvin

if t_k > 30000 and t_k <=60000:
    print("The Spectral Type of your Star is: O")
elif t_k > 10000 and t_k<=30000:
    print("The Spectral Type of your Star is: B")
elif t_k > 7500 and t_k<=10000:
    print("The Spectral Type of your Star is: A")
elif t_k > 6000 and t_k<=7500:
    print("The Spectral Type of your Star is: F")
elif t_k > 5000 and t_k<=6000:
    print("The Spectral Type of your Star is: G")
elif t_k > 3500 and t_k<=5000:
    print("The Spectral Type of your Star is: K")
elif t_k >= 2000 and t_k<=3500:
    print("The Spectral Type of your Star is: M")
elif t_k <2000:
    print("Your Star is a Brown Dwarf")
else:
    print("Your star may be a Wolf-Rayet Star (TOO HOT!)")
