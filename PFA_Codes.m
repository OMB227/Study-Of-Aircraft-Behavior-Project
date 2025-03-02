clear all; clc;close all;
format compact;
format long;

display('------------------------------------------------Ce programme est une Aide au Dimensionnement d une Aile d avion------------------------------------------------');
display('Nous adopterons comme système d unité le ..mm..Mpa..N  ')
g=9.81 ;%constante gravitationnelle

n=1;%facteur de charge n=1 car vol en mode croisiere

M=input('Entrer la masse de l Avion en [Kg]:');
while(M<=0)
    M=input('SVP Entrer la masse de l Avion [Kg] positve !!:');
end

Fz=n*M*g ;
sprintf('La valeur de la Résultante de Portance totale Fz=%0.4f N',Fz)

% soit a et h respectivement epaisseur et hauteur de l'ame
% soit l et s respectivement largeur et epaisseur de la semelle 

% sigma_e;%contrainte élastique
% Sigma_max;%contrainte maximale
% E_yg; %Module de Young 
% sigma_max=(Mf_max*y_max)/(I_gz) 

S=3 ;% coefficient de sécurité
while(S<=3)
    S=input('Entrer la Valeur du coefficient de sécurité S > 3 :'); % controle de la valeur
end 
display('------------------------------------------------Entrer les paramètre Géométrique de l aile------------------------------------------------')

E=input('Entrer valeur Effilement E:');
while (E>=1 || E<=0 )
    E=input('Entrer 0<E<1  :'); % controle de la valeur
end 
% sprintf('La valeur de l effillement est E=%0.4f',E)
b=input('Entrer valeur de l Envergure de l aile en [mm] b:');
while (b<=0 )
    b=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
end
% sprintf('La valeur de l envergure est de b=%0.4f m',b)

display('------------------------------------------------Entrer les paramètre Géométrique du Longeron------------------------------------------------')

% section de la poutre :

disp('SVP Choisir le type de section de poutre : ');
disp('     I : forme I');
disp('     R : forme Rectangulaire');
T=input('Entrer le type de section choisie : ','s'); % la forme de la longeron 
while(( T~='R')&&(T~='I'))  
      T=input('SVP vérifier votre choix :','s'); % test pour la vérification 
end 
if T == 'I' 
    
        l=input('Entrer valeur LARGEUR semelle [mm] l=\n');
        while (l<=0 )
            l=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end

        s=input('Entrer valeur EPAISSEUR semelle [mm] s=\n');
        while (s<=0 )
            s=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end
        a=input('Entrer valeur EPAISSEUR de l ame [mm] a=\n');
        while (a<=0 )
            a=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end
        h=input('Entrer valeur HAUTEUR de l ame [mm] h=\n');
        while (h<=0 )
            h=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end

        I_gz=I_gz(l,h,a,s);% Calcul du Moment quadratique section I 
else  T == 'R'
        bs=input('Entrer valeur LARGEUR de la section [mm] bs=\n');
        while (bs<=0 )
            bs=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end

        hs=input('Entrer valeur hauteur de la section [mm] hs=\n'); % controle de la valeur
        while (hs<=0 )
            hs=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
        end
        I_gz=(bs)*(hs)^3 ;% Calcul du Moment quadratique Rectangulaire 
     
end 
        

% sprintf('I_gz=%0.1000f m^4',I_gz) ;

format compact
FID=fopen('C:\Users\hp\Documents\MATLAB\Programme_PFA\n.txt') ;
module=fscanf(FID,'%c')

% le matériau
materiau=input('Entrer type de matériau : ' ,'s');
Re=input('Donner la résistance du matériau choisit Re[Mpa]=\n');% la résistance de matériau 
while (Re<=0 )
    Re=input('SVP Entrer une valeur strictement positive ! :'); % controle de la valeur
end
E_yg=input('Donner le Module de Young du matériau choisit E_yg[Mpa]= \n'); %Module de Young
while (E_yg<=0 )
    E_yg=input('SVP Entrer une valeur strictement positive ! :');  % controle de la valeur
end

display('------------------------------------------------Calculs et Evaluations des Efforts Intérieurs------------------------------------------------')
                    %Pour une distribution de OSCAR Shrenk on a
x=linspace(0,b/2,25) ;                  
P=(Fz/b)*( ((E-1)*(2*x/b)+1)/(E+1) + (2/pi)*sqrt(1-(2*x/b).^2) ); %p en [N/m]
stem(x,P,'Marker','^','color','r')
hold on
plot(x,P,'b','LineWidth',3)
title(' OSCAR SHRINK DISTRIBUTION P en [N/mm] ')
xlabel('Demi aile  discretisé en mm')
ylabel('valeu du chargement en [N/mm]')
legend('P(x)');
pause
%Efforts tranchant 

syms P(x) Mfz(xg);

P(x)=(Fz/b)*( ((E-1)*(2*x/b)+1)/(E+1) + (2/pi)*sqrt(1-(2*x/b).^2) );
T_y=int(P(x),x,b/2);
figure()
h=ezplot(T_y,[0 b/2]);
grid on
set(h,'color','r','LineWidth',3)
legend('EFFORT TRANCHANT T_y')
title('DET')
pause 
Mfz(xg)=int(P(x)*(x-xg),xg,b/2) 
figure()
h1=ezplot(Mfz,[0 b/2]);
grid on
set(h1,'color','g','LineWidth',3)
legend('MOMENT FLECHISSANT MFz')
title('DMF')
pause 
T_y ;
Mfz_max=double(Mfz(0));
display('---------------------------------Détermination du déplacement en tout point V(M) du Longeron--------------------')
syms V(xm) 
syms xm xg ;
V(xm)=(1/(E_yg*I_gz))*int( (xm-xg)*( int( P(x)*(x-xg),xg,xm ) + int( P(x)*(x-xg),xg,b/2 ) ) ,0,xm) ;
figure ()
h2=ezplot(V,[0 b/2]);
grid on 
set(h2,'color','b','LineWidth',3)
legend('V(M)')
title('Déplacement en tout point')


display('-----------------------------------------------CONDITION DE RESISTANCE------------------------------------------------------')

y_max=h/2;%la distance maximale par rapport à la fibre Neutre  
Rpe=Re/S %la Résistance pratique à l'extension 

Sigma_max=abs(Mfz_max)*abs(y_max)/I_gz ;  %la contrainte max admissible

if Sigma_max<Rpe
    display(' Bravo :) votre structure vérifie la condition de résistance ---> CL: Votre Aile Résistera ')
else 
    display(' :( Désolé votre structure ne résistera pas !')
end 

display('La contrainte max vaut :')
Sigma_max


%sigma=f(y) -->ouverture

%y dépend de la distance p/r à la fibre Neutre de la section 

%rappel notre poutre est à section constante 

%pour mon cas ymax=H/2;

% car on a une section en I




















