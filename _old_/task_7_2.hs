{--
    Task 7.2
    *Доп задача, до 7.10*
    Описать функцию dioph, параметры которой - два списка из 4 целых чисел [a, b, c, d] и [k, l, m, n], и которая возвращает список из 3 целых чисел [x, y, z] таких, что:

    a*x+b*y+c*z=d
    k*x+l*y+m*z=n

    Замечания: 
    - Что делать, если таких чисел нет - на ваше усмотрение. Можно выдать ошибку, можно вернуть (0, 0, 0) и т.д. В тестах таких случаев не будет.
    - Числа в тестах могут быть достаточно большими для того, чтобы эту задачу не было смысла решать простым перебором, надо придумать что-то более эффективное.
    - Эта задача не то чтобы очень сложная, но решение, которое я знаю - довольно громоздкое, в нем надо рассматривать разные вырожденные случаи и т.д.. Т.е. это для тех, кому интересно решить что-то немного посложнее.
--}

euclid a b 
  | a == 0 = (0, b `div` (abs b))
  | otherwise =
      let
        (x1, y1) = euclid (mod b a) a
      in (y1 - (div b a) * x1, x1)
euclidF a b =
    let
      d = gcd a b
      (x, y) = euclid (a `div` d) (b `div` d)
    in (x, y)
euclidFull a b res = 
    let
      (x,y) = euclidF a b
      d = res `div` (gcd a b)
    in (x*d, y*d)

dioph' [a1,a2,a3,a4]
  | a2 /= 0 = 
      let
        (y, z) = euclidF a2 a3
        d = gcd a2 a3
        (x, k) = euclidFull a1 d a4
      in [x, y*k, z*k]
  | a1 /= 0 =
      let
        [y,x,z] = dioph' [a2,a1,a3,a4]
      in [x,y,z]
  | a3 /= 0 =
      let
        [x,z,y] = dioph' [a1,a3,a2,a4]
      in [x,y,z]
  | otherwise = [0,0,0]

dioph [a1,a2,a3,a4] [b1,b2,b3,b4]
  | a1*b4 == a4*b1 && a2*b4 == a4*b2 && a3*b4 == a4*b3 = 
      if a4 == 0 && b4 == 0 then [0,0,0]
      else if a4 == 0 then dioph' [b1,b2,b3,b4]
      else if b4 == 0 then dioph' [a1,a2,a3,a4]
      else dioph' [a1,a2,a3,a4]

  | a2*b1 == a1*b2 && a3*b1 == a1*b3 = [0,0,0]

  | a2*b1 /= a1*b2 && a3*b1 == a1*b3 =
      let
        y = (a4*b1 - b4*a1) `div` (a2*b1 - b2*a1)
      in if a1 == 0 && a3 == 0
         then
           let
             (x, z) = euclidFull b1 b3 (b4 - b2*y)
           in [x, y, z]
         else
           let
             (x, z) = euclidFull a1 a3 (a4 - a2*y)
           in [x, y, z]

  | a2*b1 == a1*b2 && a3*b1 /= a1*b3 =
      let
        z = (a4*b1 - b4*a1) `div` (a3*b1 - b3*a1)
      in if a1 == 0 && a2 == 0
         then
           let
             (x, y) = euclidFull b1 b2 (b4 - b3*z)
           in [x, y, z]
         else
           let
             (x, y) = euclidFull a1 a2 (a4 - a3*z)
           in [x, y, z]

  | a1*b4 /= a4*b1 =
      let
        k1 = a2*b1 - b2*a1
        k2 = a3*b1 - b3*a1
        (y, z) = euclidFull k1 k2 (a4*b1 - b4*a1)
        d = gcd k1 k2
        m1 = k1 `div` d
        m2 = k2 `div` d
        k3 = a2*m2 - a3*m1
        k4 = a4 - a2*y - a3*z
        (x, t) = euclidFull a1 k3 k4
      in [x, y + m2*t, z - m1*t]

  | a1*b4 == a4*b1 =
      let
        k = (a2*b1 - b2*a1) `div` (b3*a1 - a3*b1)
        k1 = a2 + k*a3
        (x, y) = euclidFull a1 k1 a4
      in [x, y, k*y]
