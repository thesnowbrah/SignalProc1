% Создадим тестовые сигналы
t = 0:0.01:1; % временная ось
x1 = sin(2*pi*10*t); % синус с частотой 10 Гц
x2 = cos(2*pi*20*t); % косинус с частотой 20 Гц
N = length(t); % длина сигнала

% 1. Линейность
a = 2; b = 3;
x_combined = a*x1 + b*x2;
fft_combined = fft(x_combined);
fft_individual = a*fft(x1) + b*fft(x2);

% Сравнение результатов
figure;
subplot(2,1,1);
plot(abs(fft_combined), 'b'); hold on;
plot(abs(fft_individual), 'r--');
title('Линейность: ПФ(a*x1 + b*x2) и a*ПФ(x1) + b*ПФ(x2)');
legend('ПФ(a*x1 + b*x2)', 'a*ПФ(x1) + b*ПФ(x2)');

% 2. Сдвиг по времени
t_shift = 0.1; % сдвиг на 0.1 секунды
x_shifted = sin(2*pi*10*(t + t_shift)); % сдвиг сигнала во времени
fft_shifted = fft(x_shifted);
fft_original = fft(x1);
omega = 2*pi*(0:N-1)/N; % частотная ось
fft_expected_shifted = fft_original .* exp(-1j*omega*t_shift*N);

% Сравнение результатов
subplot(2,1,2);
plot(abs(fft_shifted), 'b'); hold on;
plot(abs(fft_expected_shifted), 'r--');
title('Сдвиг по времени: ПФ(x(t - t_0)) и ПФ(x(t)) * exp(-jωt_0)');
legend('ПФ(x(t - t_0))', 'ПФ(x(t)) * exp(-jωt_0)');

% 4. Масштабирование
x_scaled = sin(2*pi*10*2*t); % сигнал с измененной частотой
fft_scaled = fft(x_scaled);
fft_original_scaled = fft(sin(pi*10*t));
% Для масштабирования частотной оси
fft_expected_scaled = abs(fft_original_scaled / 2); % учтём масштаб

% Сравнение результатов
figure;
subplot(2,1,1);
plot(abs(fft_scaled), 'b'); hold on;
plot(abs(fft_expected_scaled), 'r--');
title('Масштабирование: ПФ(x(a*t)) и (1/|a|) * ПФ(x(t/a))');
legend('ПФ(x(2*t))', 'Ожидаемый результат');

% 7. Свертка
conv_result = conv(x1, x2, 'same'); % свертка сигналов
fft_conv_result = fft(conv_result);
fft_multiplied = sqrt(2*pi) * fft(x1) .* fft(x2);

% Сравнение результатов
figure;
plot(abs(fft_conv_result), 'b'); hold on;
plot(abs(fft_multiplied), 'r--');
title('Свертка: ПФ(x1 * x2) и sqrt(2)ПФ(x1) .* ПФ(x2)');
legend('ПФ свертки', 'Произведение ПФ');

%8. Свертка
mult_result = x1.*x2; % 
fft_mult_result = fft(mult_result);
fft_conv_multiplied =  conv(fft(x1), fft(x2), 'same')/sqrt(2*pi);

% Сравнение результатов
figure;
plot(abs(fft_mult_result), 'b'); hold on;
plot(abs(fft_conv_multiplied), 'r--');
title('Свертка: ПФ(x1 * x2) и sqrt(2)ПФ(x1) .* ПФ(x2)');
legend('ПФ свертки', 'Произведение ПФ');