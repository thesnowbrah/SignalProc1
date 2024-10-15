syms t w f(t)
F_w = fourier(f, t, w); % Преобразование Фурье исходной функции

% Применим производную по t
f_derivative = diff(f, t); % Производная f'(t)
F_derivative_w = fourier(f_derivative, t, w); % Преобразование Фурье производной функции

% Ожидаемый результат: i*w*F(w)
F_expected = (1i * w) * F_w;

% Выводим результаты для проверки
disp('Преобразование Фурье исходной функции:');
disp(F_w);

disp('Преобразование Фурье производной функции:');
disp(F_derivative_w);

disp('Ожидаемый результат (i*w*F(w)):');
disp(F_expected);

% Сравним результаты
simplify(F_derivative_w - F_expected)