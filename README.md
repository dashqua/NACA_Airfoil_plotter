# NACA_Airfoil_plotter
A quick view on how to plot NACA airfoil. Best usage on rainy sunday morning

This is a quick tutorial on how to plot NACA Airfoil profiles, to use in your favorite mesh program.
"NACA" is a norm which makes the render of airfoils easier; indeed information on the wing itself remains in its model name, we will see that later.  
Note: all commentary codes are in french

##Sources

https://fr.wikipedia.org/wiki/Profil_NACA
http://www.aerospaceweb.org/question/airfoils/q0041.shtml

## 4-Digits series
### Simple model - No camber, symmetric

The simplest way to draw an airfoil is to go on wikipedia (link provided in sources) and pick the very first equation:
![alt text](https://wikimedia.org/api/rest_v1/media/math/render/svg/3f0ceb9f31ba269f1159409d5b414d051776c668)
What to do with all these parameters ?  
Well it is simple:  
First, generate a sample vector, x, and choose and a maximal width of spread, or maximal length of the cord, c. Eventually, choose the maximal height of the curve, this is t. We have our 3 parameters:  
- c, the maximal length of cord  
- x, the sample vector dependent of the number of points  
- t, the maximal height of cord, or maximal thickness

```
nbpoints = 2000
c = 1 # la longueur max de la corde
x = (1:nbpoints )*(c/nbpoints) #les abscisses des noeuds
t = 00.12 # épaisseur max de l'aile
```

Now we can use the lovely R language to plot the whole thing.  
Why R ? Because it is convenient, easy to play with: the parameters of function are pliants.  
One important thing to notice is that, x being a vector, the function takes it as a parameters and executes it on each of its parameters to fill "top" and "bottom".  

```
NACA_sym = function(c,x,t){
  y = (t/0.2)*( 0.2969*sqrt(x/c) - 0.1260*x/c - 0.3516*(x/c)**2 + 00.2843*(x/c)**3 - 0.1015*(x/c)**4 )
  return (y)
}
```

Another thing to notice is that the previous equation renders the top profile of a symmetric airfoil. Because of that we need to fill and draw both "top" and "bottom" vectors.

```
top = NACA_sym(c,x,t)
bottom = -NACA_sym(c,x,t)
plot(x,top,col='red',ylim=range(c( -t , t    )))
lines(x,bottom,col='blue',ylim=range(c( -t , t    )))
```

![alt text](Rplot2.PNG)






