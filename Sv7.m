syms t tau w f(t) g(t)

% Вычислим свёртку f(t) и g(t) через интеграл
conv_fg = int(f(tau) * g(t - tau), tau, -inf, inf); % Свёртка

% Преобразование Фурье для f(t) и g(t)
F_w = fourier(f, t, w); 
G_w = fourier(g, t, w);

% Преобразование Фурье свёртки
F_conv_w = fourier(conv_fg, t, w);

% Ожидаемый результат: произведение F(w) * G(w)
F_expected = F_w * G_w;

% Выводим результаты для проверки
disp('Преобразование Фурье f(t):');
disp(F_w);

disp('Преобразование Фурье g(t):');
disp(G_w);

disp('Преобразование Фурье свёртки f(t) * g(t):');
disp(F_conv_w);

disp('Ожидаемый результат (F(w) * G(w)):');
disp(F_expected);

% Сравним результаты
simplify(F_conv_w - F_expected)