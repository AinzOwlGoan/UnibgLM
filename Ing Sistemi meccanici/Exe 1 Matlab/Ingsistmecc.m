%%%%%% PRIMO ESERCIZIO ING. SISTEMI MECCANICI!

%% Dinamica di un veicolo ferroviario

m = 8000; % massa totale in [kg]
S = 7.5; % [m^2] area sezione frontale
C_r = 0.7; % coefficiente resistenza aerodinamica
D = 600*10^(-3); % diametro delle ruote
J_m = 0.1; % [kg m^2] momento inerzia motore
tau = 5/24; % rapporto di trasmissione
eta = 0.97; % rendimento della trasmissione
p = 30/1000; % pendenza 3 per mille
rho = 1.25; % [kg/m^3] resistenza dell'aria 
% Sapendo che il veicolo percorre un tratto di salita con
% pendenza p, determinare la velocità di regime ed il tempo di avviamento