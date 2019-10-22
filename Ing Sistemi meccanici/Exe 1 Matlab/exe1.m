%%%%%% PRIMO ESERCIZIO ING. SISTEMI MECCANICI!
clear
%% Dinamica di un veicolo ferroviario 08/10/2019

% Dati
m = 8000; % massa totale in [kg]
S = 7.5; % [m^2] area sezione frontale
Cr = 0.7; % coefficiente resistenza aerodinamica
D = 600e-3; % [m] diametro delle ruote
Jm = 0.1; % [kg m^2] momento inerzia motore
tau = 5/24; % rapporto di trasmissione
eta = 0.97; % rendimento della trasmissione
p = 30/1000; % pendenza 3 per mille
rho = 1.25; % [kg/m^3] resistenza dell'aria 
r = D/2; % raggio [m]
% Sapendo che il veicolo percorre un tratto di salita con
% pendenza p, determinare la velocità di regime ed il tempo di avviamento

%% Disegno delle curve carattersitiche nel piano del carico

% dal diagramma nel pdf pag 2
Cs = 900; % [Nm]
n0 = 1000; % RPM
g = 9.81; 
alpha = atan(p); % prendo l'angolo di inclinazione del piano [rad]

%% Curva caratteristica del motore
k = -Cs/n0;
n = 0:10:n0;
Cm = Cs + k*n;
Cmrid = Cm*eta/(tau*r); % coppia motrice ridotta
wm = n*2*pi/60;
wmrid = wm*tau*r; % velocità motrice ridotta in [m/s]
wmridkmh = wmrid*3.6;

%% Curva caratteristica del carico
vkmh = 0:40; % velocità in km/h
v = vkmh/3.6;
Fp = m*g*sin(alpha);
Fa = 0.5*Cr*S*rho*v.^2;
Fr = Fp + Fa; % forza totale

% plot
figure
plot(wmridkmh,Cmrid,'red')
hold on 
plot(vkmh, Fr, 'blue')
grid on;
xlabel('velocità [km/h]')
ylabel('Forza [N]')
title('Curve caratteritiche motore carico')
%% Parte 2: 22/10/2019

% utilizzo della funzione per richiamare i dati:
dati = parametri();

m = dati.m;
S = dati.S;
Cr = dati.Cr;
D = dati.D;
Jm = dati.Jm;
tau = dati.tau;
eta = dati.eta;
p = dati.p;
rho = dati.rho;
r = dati.r;
Cs = dati.Cs;
n0 = dati.n0;
g = dati.g;
alpha = dati.alpha;

range_km = [10 40];
range_ms = range_km/3.6;
vreg = fzero(@(v) myfun(v,dati),range_ms);
vreg_kmh = vreg*3.6;

disp(['Velocità di regime [km/h]',num2str(vreg_kmh)])

%% moto in transitorio

% utilizzo del metodo di eulero
tf = 10;
dt = 0.01;
t = 0:dt:tf;
v(1) = 0;
for i = 1:length(t)
    
    Cmrid = motore(v(i),dati);
    Fr = carico(v(i),dati);
    a(i) = (Cmrid - Fr)/(m+eta*Jm/((tau*r)^2));
    v(i+1) = v(i)+a(i)*dt;
    
end

v_kmh = v*3.6;
% plot
figure
plot(t,v(1:end-1),'green')
grid on;
xlabel('tempo [S]')
ylabel('velocità [km/h]')
title('Andamento velocità durante avviamento')
