import random

'''
if a > 10:
    print("xxxx")
    print("a = 12")

if a > 11:
    print("mmmm")
elif a == 12:
    print("zzzz")
else:
    print("end")

b = [1,2,3,4,5,6]

if 7  in b:
    print("7 在列表中")
else:
    print("7 不在列表中")

print("xxxx")
'''

'''
# input()猜字游戏
number = int(input('请输入数字：'))


if number == a:
    print("猜对了")
elif number > a:
    print('大了')
elif number < a:
    print('小了')

print('这个数其实是：',a)
print("i\'m \"ok\"!")



#python初体验
print(5 + 8)
print("i love english\n" * 7)
print("i want to " + "drink water and eat dessert\n")
# print("i want to " + 7) 这种写法有错
print("一年的长度为" )
print(365*24*3600 )
'''

'''
print("---------------我爱python语言------------------")
temp = input("不妨试试猜猜我心里的数字：")
guess = int(temp)

if guess == 8:
    print("我靠,这就被你猜对了")
    print("哼，猜中了也没有奖励")
else:
    print("傻吊，你猜错了，我内心想的是8\n")
print("游戏结束不玩了")
print("想重复试试这个游戏吗")

sel = input("输入你的选择：")
se = int(sel)
sum = 0
while se < 9:
    sum += se
print("sum = ")
print(sum)
'''
#BIF == Built -in function 内置函数

'''
# while循环
# break & continue
a = 1
while a < 10:
    print(a)
    a += 1

    if a == 5
        break

print('测试continue用例')
b = 1
while b < 7:    
    b+=1
    if b == 5:
        continue
    print(b)
    
 '''

'''
#for 循环,迭代
str = 'python'
for i in str:
    print(i)

b = [1,2,3,4,5]
for i in b:
    print(i + i,end = '  ') # end指定换行
print()

d = {'a':1,'b':2,'c':3} #字典的用法
for i in d:
    print(i,end= '  ')
for i in d.values():
    print(i ** i)
    print(i,end= '  ')
print()
print('字典的内容如下：')
for i in d.items():
    print(i)


range(5)  # 不包含5 range(5,10) range(1,10,2) 2 为步长 就是 1 3 5 7 9 
list(range(5))
for i in range(5):
    print(i)


# input()猜字游戏
# number = int(input('请输入数字：'))

a = random.randint(1,10)
n = 3
while n < 5:
    number = input("请输入数字：")
    if number.isdigit():
         number = int(number)
         if number == a:
            print("猜对了")
            break
         elif number > a:           #这个数字哦有问题，无法转换哦
            print('大了')
         else:
            print('小了')
    n += 1
else:
    print("猜的次数用完了！！！")
    print("这个数是：",a)


# 输出0 - 100 的偶数循环
x = 0
while x <= 100:
    if x % 2 == 0:
        print(x,end= '  ')
    x += 1
print()
li = [] # 列表
for i in range(0,101,2):
    li.append(i) # 将满足条件的数填入列表中
print(li)

for i in range(5):
    if i == 2:
        #break
        continue
    print(i,end= '  ')



# 分数等级测试用例
flag = 1
while flag != 0:
    score = input('请输入分数：')
    if score.isdigit():
        score = int(score)
        if score <= 100:
            if score > 90:
                print('分数等级：A')
            elif score > 80:
                print('分数等级：B')
            elif score > 60:
                print('分数等级：D')
            else:
                print('分数等级：D')
        else:
            print('输入分数范围不符合！')
    else:
        print('你输入的不是数字，请重新输入！')

    flag = int(input('输入选择：'))
else:
    print('循环结束！！！')
'''

'''
# 以下是系统函数
print(min(2,32))
print(len(range(3)))
print(max(5,3,2))

# 用函数实现分数等级的测试
# 函数定义 def 函数名():
def scoreclass():
    while True:
        score = input('请输入分数：')

        if score == 'q':
            break
        elif score == '':
            continue

        if score.isdigit():
            score = int(score)
            if score <= 100:
                if score > 90:
                    print('分数等级：A')
                elif score > 80:
                    print('分数等级：B')
                elif score > 60:
                    print('分数等级：D')
                else:
                    print('分数等级：D')
            else:
                print('输入分数范围不符合！')
        else:
            print('你输入的不是数字，请重新输入！')

# 调用scoreclass
scoreclass()

def fun():
    print('xxxx')
    return 111

print(fun())




def fun(**kw):
    print(kw)

fun(a = 1,b = 2)

'''


# 内嵌函数
def function(x):
    def function2(y):
        return y + x    # return用于 function2
    #function2('2')
    return function2

print(function('a')('3'))

def fun1(x):
    def fun2(y):
        return x*y
    return fun2

print(fun1(2)(4))




