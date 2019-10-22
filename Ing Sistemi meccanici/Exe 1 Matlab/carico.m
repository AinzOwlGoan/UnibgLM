function Fr = carico(v,dati)

% definizione della curva caratteristica
Fr = dati.m*dati.g*sin(dati.alpha)+...
    0.5*dati.Cr*dati.rho*dati.S*v^2;