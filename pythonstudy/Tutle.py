# tuple 元组 一旦被初始化不能被修改
classmates = ('Michael','Bob','Tracy')
print(classmates )
t = (1,2)
print(t)

t1 = (1,) # 表示只有一个元素
print(t1)

t2 = (1)
print(t2)

# 注意T2和T1的区别

t3 = ('a','b',['A','B'])
print(t3[2][1])

# list 列表 append & pop
classmates = ['1','2','22','34']
print('classmates: ' ,classmates )

# 添加一个元素
classmates.append('342')

print('after add one element: ' , classmates )

#删除一个元素
classmates.pop(1)
print('after delete one elements: ',classmates)

# 从后往前取元素
print(classmates[-2])


'''
list和tuple是Python内置的有序集合，一个可变，一个不可变。根据需要来选择使用它们
'''

