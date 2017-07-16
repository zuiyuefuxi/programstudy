# 猜数字游戏 ，系统给出一个0-9的数字，自己再输入一个数字，三次以内猜中就算赢
# 下面是永远都猜不对的猜字游戏

import random

ls = [] # ls是一个列表,添加系统生成树到列表里
s = random.randint(0, 9)

for i in range(3):
    number = input('请输入一个数字>>>')
    ls.append(number)

    print(ls)
    if i == 2:
        while s in ls:
            s = random.randint(0, 9)
            s = random.randint(0, 9)
            print('猜错了，正确答案是 %d' % s)
    else:
        print("猜错了，还有%d次机会" % (2 - i))
