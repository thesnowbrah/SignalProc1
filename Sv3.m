syms t w w0
f = exp(-t^2); % Исходная функция f(t)
F_w = fourier(f, t, w); % Преобразование Фурье исходной функции

% Применим сдвиг по частоте
f_shifted = f * exp(1i * w0 * t); % f(t) * e^(i * w0 * t)
F_shifted_w = fourier(f_shifted, t, w); % Преобразование Фурье сдвинутой функции

% Ожидаемый результат: исходное преобразование сдвинуто на w0
F_expected = subs(F_w, w, w - w0);

% Выводим результаты для проверки
disp('Преобразование Фурье исходной функции:');
disp(F_w);

disp('Преобразование Фурье сдвинутой функции:');
disp(F_shifted_w);

disp('Ожидаемый результат (сдвиг по частоте):');
disp(F_expected);

% Сравним результаты
simplify(F_shifted_w - F_expected)