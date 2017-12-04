####################################
#     exemple de NACA0012          #
####################################

NACA_sym = function(c,x,t){
  y = (t/0.2)*( 0.2969*sqrt(x/c) - 0.1260*x/c - 0.3516*(x/c)**2 + 00.2843*(x/c)**3 - 0.1015*(x/c)**4 )
  return (y)
}

nbpoints = 2000
c = 1 # la longueur max de la corde
x = (1:nbpoints )*(c/nbpoints) #les abscisses des noeuds
t = 00.12 # épaisseur max de l'aile

top = NACA_sym(c,x,t)
bottom = -NACA_sym(c,x,t)
plot(x,top,col='red',ylim=range(c( -t , t    )))
lines(x,bottom,col='blue',ylim=range(c( -t , t    )))





####################################
#     exemple de NACA2412          #
####################################

NACA_asym = function(c,x,m,p,t){
  PC = p*c
  y = 0

  if ((x>=0)&&(x<p)){
    yc = m/(p*p)*(2*p*x - x*x)
    theta = atan(   m/(p*p)*(2*p - 2*x)   )
  }
  if ((x>=p)&&(x<=c)){
    yc = m/( (1-p)**2 )*( 1-2*p + 2*p*x - x*x)
    theta = atan(   m/( (1-p)**2 )*( 2*p - 2*x)   )
  }
  yt = (t/0.2)*( 0.2969*sqrt(x) -0.1260*x -0.3516*x*x +0.2843*x*x*x -0.1015*x*x*x*x )
  xU = x-yt*sin(theta)
  yU = yc+yt*cos(theta)
  xL = x+yt*sin(theta)
  yL = yc-yt*cos(theta)
  
  p = plot(xU,yU, col='red',ylim=range(c( -t , t    )))
  lines(xL,yL, col='blue',ylim=range(c( -t , t    )))
  legend("topright",
         legend = c("higher contribution","lower contribution"),
         col = c('red', 'blue'), 
         pch = c(17,19), 
         bty = "n", 
         pt.cex = 2, 
         cex = 1.2, 
         text.col = "black", 
         horiz = F , 
         inset = c(0.1, 0.1)
  )
  return
}

m = 2 /100 #cambrure max - premier chiffre
p = 4 / 10 # position de la cambrure max - deuxième chiffre
nbpoints = 2000
c = 1 # la longueur max de la corde
x = (1:nbpoints )*(c/nbpoints) #les abscisses des noeuds
t = 00.12
NACA_asym(c,x,m,p,t)