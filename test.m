clear 
Lines = readlines("coi-lw1\wdelay\putty-2kHz.log");
Len = round(length(Lines)/10);
A = 0 : 1/(Len): 1-1/Len;
A1 = 0:1/(10*Len):1-1/Len;

a=200;
w = Len/2;
ph=pi/2;

FirstLines = Lines(1:Len);
for I = 1:Len   
    NumLines2(I) = str2num(FirstLines(I))-300;   
end
%Вывод экспериментального сигнала
plot(A, NumLines2);
xlim([0 10/Len]);
ylim([-50 600]);
xlabel('Время');
ylabel('Амплитуда');

%Вывод синусоидального сигнала
Signal = a*sin(2*pi*w*A1+ph);
plot(A1,Signal);

%преобразование фурье
y = fft(NumLines2);
n = length(NumLines2);
f = (0:n-1)*(Len/n);
power = abs(y).^2/n;

%Смещение к нулю и вывод ачх
z = fftshift(y);
fshift=(-n/2:n/2-1)*(Len/n);
powershift = abs(z).^2/n;
plot(fshift,powershift);
xlabel('Frequency');
ylabel('Power');
%% вывод фчх

phase=angle(z);
phase(powershift<1000000)=0;
stem(fshift,phase);
xlim([360 380])
xlabel('Frequency');
ylabel('Angle');

