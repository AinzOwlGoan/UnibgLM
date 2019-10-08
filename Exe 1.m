%%%%%% PRIMO ESERCIZIO ING. SISTEMI MECCANICI!
clear
%% Dinamica di un veicolo ferroviario

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










