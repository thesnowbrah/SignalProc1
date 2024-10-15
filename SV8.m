syms t w wp
f = exp(-t^2); % Первая функция f(t)
g = sin(t);    % Вторая функция g(t)

% Преобразование Фурье для f(t) и g(t)
F_w = fourier(f, t, w); 
G_w = fourier(g, t, w);

% Произведение функций f(t) и g(t)
prod_fg = f * g;

% Преобразование Фурье от произведения
F_prod_w = fourier(prod_fg, t, w);

% Свёртка преобразований Фурье F(w) и G(w)
F_w_func = matlabFunction(F_w); % Превращаем F(w) в функцию
G_w_func = matlabFunction(G_w); % Превращаем G(w) в функцию

% Выполняем свёртку через интеграл
conv_FG = int(F_w_func(wp) * G_w_func(w - wp), wp, -inf, inf) / (2 * pi);

% Преобразуем свёртку в функцию для численного расчета
conv_FG_func = matlabFunction(conv_FG);

% Выбираем значения для численного сравнения
w_val = 1; % Пример значения частоты

% Вычисляем значения для преобразования Фурье от произведения и свёртки
F_prod_val = double(subs(F_prod_w, w, w_val));
conv_FG_val = conv_FG_func(w_val);

% Выводим результаты для численного сравнения
disp('Преобразование Фурье от произведения f(t) * g(t) для w = 1:');
disp(F_prod_val);

disp('Свёртка F(w) * G(w) для w = 1:');
disp(conv_FG_val);

% Сравнение значений
disp('Сравнение значений:');
epsilon = 1e-15;
complex_differ = conv_FG_val - F_prod_val;
disp(and(real(complex_differ) < epsilon, imag(complex_differ) < epsilon));