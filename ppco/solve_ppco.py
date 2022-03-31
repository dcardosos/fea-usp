from sympy import symbols, solve

x1, x2, x3, x4, y1, y2, y3, y4, e = symbols('x1 x2 x3 x4 y1 y2 y3 y4 e')

equation = 400 * (x1 + x2 + x3 + x4) + 450 * (y1 + y2 + y3 + y4) + 20 * (e)

print(equation)