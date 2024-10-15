syms t w
delta = dirac(t);  % Дельта-функция Дирака

% Преобразование Фурье для дельта-функции
F_delta_w = fourier(delta, t, w);

% Ожидаемый результат: 1
expected = 1;

% Выводим результаты
disp('Преобразование Фурье дельта-функции:');
disp(F_delta_w);

disp('Ожидаемый результат:');
disp(expected);

% Сравним результаты
simplify(F_delta_w - expected)