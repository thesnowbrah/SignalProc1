syms t w
c = 1; % Константа

% Функция f(t) = 1
f = c; 

% Преобразование Фурье для f(t) = 1
F_w = fourier(f, t, w);

% Ожидаемый результат: c * 2*pi * delta(omega)
expected_result = c * 2 * pi * dirac(w);

% Выводим результаты
disp('Преобразование Фурье функции 1:');
disp(F_w);

disp('Ожидаемый результат (1 * 2 * pi * delta(omega)):');
disp(expected_result);

% Сравним результаты
difference = simplify(F_w - expected_result);
disp('Разница:');
disp(difference);