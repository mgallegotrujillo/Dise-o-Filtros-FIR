function []=firexample()

n=0:511;%tiempo
k=n/512;%frecuencias
xn=2+3*cos(2*pi*n/25)+2*sin(2*pi*n/20)+2*sin(2*pi*n/15);
xn=awgn(xn, 10);
xk=abs(fft(xn));

figure()
subplot(2,1,1);
stem(n,xn);

title('Señal de prueba x(n)');
subplot(2,1,2);
stem(k,xk);
title('Espectro de frecuencia');


%enventanado
%frec corte = 1/32
h1n=fir1(80,[0.0450 0.0550]);
y1n=filter(h1n,1,xn);
y1k=abs(fft(y1n));
figure('name','enventanado');
freqz(h1n,1);

figure('name','enventanado');
subplot(2,1,1)
stem(n,y1n);
title('Señal filtrada con FIR1');
subplot(2,1,2);
stem(k,y1k);
title('Espectro de frecuencia');
