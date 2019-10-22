function f = myfun(v,dati)

Fr = carico(v,dati);
Cmrid = motore(v,dati);
f = Cmrid - Fr;