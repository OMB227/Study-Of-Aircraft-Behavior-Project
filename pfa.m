close all ; clc; clear all

% I///les donn�es :
l=input('donner la lonqueur de la longeron = '); % la longueur de la longeron
m=input('donner la masse de la longeron = ' );   % la masse de la longeron 
b=l;
% section de la poutre :
disp(' pour choisir le type de section de poutre il faut choisir : ');
disp('     U : forme U');
disp('     I : forme I');
T=input('donner le type de section ','s'); % la forme de la longeron 
while(( T~='U')&&(T~='I'))  
      T=input('verifier votre choix ','s'); % test pour la v�rification 
end 
% condition de vole 
n=input('donner une facteur de charge =' );

% le materiau
materiau=input('choisir le type de materiau :' ,'s');
Re=input(' donner la r�sistance de materiau choisit :'); % la r�sistance de mat�riau 
s=input('donner une coefficient de s�curit� = ');  % la coefficient de s�curit�e 
Fz=n*m*9.98; % la force de portance 
E=input('donner une valeur pour module de young = ');
I= input('donner I');

% l'equation de charges appliqu�es sur tous la longeron
syms x;

P(x)=(Fz/b)*((((E-1)*((2*x/b)+1)/E)+((2/pi)*(1-((2*x)/b)^2))^(1/2)));
figure(1); % pr�sentation de la charge 
fplot(P,[0,l]);

%les r�actions en O 'liaison d'encastrement'

Yo=integral(P,0,l); % la resultante du torseur suivant y
Mo=integral(x*P,0,l); % le moment du torseur suivant z

%les efforts int�rieures

syms xG ;
Ty=integral(P,xG,l); % le moment tranchant 
MFz=integral(P*(xG-x),xG,l); % le moment fl�chissante 

% le deplacement dans chaque point M de la longeron 

syms xM;
Pm=P(xM);
% la force en M 
vM=integral((xG-x)*MFz/(E*I),0,l); % deplacement en M suivant y
oM=integral(MFz/(E*I),0,l);        % deplacement en M suivant z

% les conditions aux limites ( en O)

vO=0; % deplacement en O suivant y
oO=0; % deplacement en O suivant z

% 


