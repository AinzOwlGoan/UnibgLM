function Cmrid = motore(v,dati)

% voglio trasformare da numero di giri a vel. angolare
% scrivendo poi l'espressione in funz. alla vel. del veicolo
wm = v /(dati.tau*dati.r);
n = wm*(60/(2*pi));

% per trovare quella ridotta all'albero dell'utilizzatore
% devo dividere per il rapporto di trasmissione e il raggio della ruota
Cm = (dati.Cs + dati.k*n);
% ridotta all'utilizzatore -> una forza
Cmrid = Cm/(dati.tau*dati.r)*dati.eta;