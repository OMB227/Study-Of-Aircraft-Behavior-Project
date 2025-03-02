% syms f(x,y)
% f(x,y)=x+2*y ;
% f(0,1)
% f(1,2)

%%test de mes plots
Fz=2500;
b=100;
E=0.6;

syms P(x) Mfz(xg) ;
% syms xg;
P(x)=(Fz/b)*( ((E-1)*(2*x/b)+1)/(E+1) + (2/pi)*sqrt(1-(2*x/b).^2) );
ezplot(P,[0 b/2])
T_y=int(P,x,b/2);
figure()

h=ezplot(T_y,[0 b/2])
set(h,'color','r','LineWidth',2)
legend('EFFORT TRANCHANT T_y')
pause 
Mfz(xg)=int(P*(x-xg),xg,b/2)
% min = fminbnd(Mfz,0,b/2 ) 
% max(double(Mfz),0,b/2)
figure()
h1=ezplot(Mfz,[0 b/2])
set(h1,'color','g','LineWidth',2)
legend('MOMENT FLECHISSANT MFz')
% pause 
% T_y ;
% Mfz;
% display('**********Determination du deplacement en tout point V(M) du Longeron*************')
% syms xg;
% syms xm ;

V=(1/(E_yg*I_gz))*int( (xm-xg)*( int( P(x)*(x-xg),xg,xm ) + int( P(x)*(x-xg),xg,b/2 ) ) ,0,xm) ;
ezplot(V,[0 b/2])