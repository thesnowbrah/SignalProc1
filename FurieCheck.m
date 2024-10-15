% Подключение символьного пакета
syms t w a b f(t) g(t) F(w) G(w) n

% Определение преобразования Фурье
fourier_f = fourier(f(t), t, w);
fourier_g = fourier(g(t), t, w);

%% 1. Линейность: F(a*f(t) + b*g(t)) = a*F(w) + b*G(w)
lin_check = simplify(fourier(a*f(t) + b*g(t), t, w));
lin_result = a*fourier_f + b*fourier_g;
disp('Проверка линейности:')
disp(isequal(lin_check, lin_result))

%% 2. Сдвиг по времени: F(f(t-a)) = exp(-i*w*a)*F(w)
shift_check = simplify(fourier(f(t - a), t, w));
shift_result = exp(-1i*w*a) * fourier_f;
disp('Проверка сдвига по времени:')
disp(isequal(shift_check, shift_result))



%% 4. Масштабирование: F(f(a*t)) = |a|^(-1) * F(w/a)
scaling_check = simplify(fourier(f(a*t), t, w));
scaling_result = abs(a)^(-1) * subs(fourier_f, w, w/a);
disp('Проверка масштабирования:')
disp(isequal(scaling_check, scaling_result))

