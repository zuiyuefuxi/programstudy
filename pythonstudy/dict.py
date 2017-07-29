# dictionary 和 set

# --- dictionary --- key -value
d = {'Michael':95,'Bob':83,'Jay':99}
print(d['Michael'])


# 切片的使用
L = ['Michael','Bob','Hello','Jack']
print(L[0:3])    # 从 0 到 2

print('L[0:3] =', L[0:3])
print('L[:3] =', L[:3])
print('L[1:3] =', L[1:3])
print('L[-2:] =', L[-2:])

R = list(range(100))
print('R[:10] =', R[:10])
print('R[-10:] =', R[-10:])
print('R[10:20] =', R[10:20])
print('R[:10:2] =', R[:10:2])
print('R[::5] =', R[::5])
