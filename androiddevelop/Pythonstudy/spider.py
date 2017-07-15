import  math
import  turtle


t = turtle.Turtle()


# # 向前走，单位是像素
# t.forward(100)
#
# # 向右转，单位是角度
# t.right(90)
# for i in range(4):
#     t.forward(100)
#     t.right(90)
# 将画笔抬起来，不会有线条

# t.penup()
# # 调到指定位置
# t.goto(-100,-100)
# # 设置画笔颜色
# t.pencolor('red')
# # 设置填充颜色
# t.fillcolor('green')
# #  开始填充
# t.begin_fill()
#
# for i in range(2):
#     t.forward(100)
#     t.right(90)
#     t.forward(150)
#     t.right(90)
# # 结束填充
# t.end_fill()

# 封装成函数

# 设置颜色
def setcolor(color):
    t.pencolor(color)
    # 设置填充颜色
    t.fillcolor(color)
    t.hideturtle()

def setpen(x,y):
    t.penup()
    t.goto(x,y)
    t.pendown()
    t.setheading(0)
# 从左下角开始
def rect(x,y,w,h,color):
    setcolor(color)
    setpen(x,y)
    # 朝上开始画
    t.setheading(90)

    t.begin_fill()
    for i in range(2):
        t.forward(h)
        t.right(90)
        t.forward(w)
        t.right(90)
    t.end_fill()



temps = [16,17,22,30,21,27,24]

def line_chart(x,y,color,temps,pixel,space):
    setpen(x,y)
    setcolor(color)

    for i,j in enumerate(temps):
        x1 = x + (i + 1) * space
        y1 = y + j * pixel
        # t.goto(x1,y1)
        dot(x1,y1)

def dot(x,y):
    t.pencolor('black')
    # 指定画笔出息
    t.pensize(2)

    t.goto(x,y)
    t.begin_fill()
    # turtle 自带的画圆函数
    t.circle(4)
    t.end_fill()

# line_chart(0,0,'red',temps,10,20)
def axise_wh(x,y,w,h):
    setpen(x,y)
    setcolor('gray')
    t.goto(x + w,y)
    setpen(x,y)
    t.goto(x,y+ h)
    setpen(x,y)

def bar_chart(x,y,color,temps,w = 500,h = 300,space = 30):
    axise_wh(x,y,w,h)
    length = len(temps)
    # 求出柱子的宽
    width = (w - (length + 1) * space) / length

    # 求出最高温度
    m = max(temps)
    pixel = h * 0.95 / m

    for i,j in enumerate(temps):
        # i : 0 1 2 3 4 5 6  j : 16 17
        height = j * pixel
        x1 = x + space + (width + space) * i
        rect(x1,y,width,height,color)


bar_chart(-100,0,'blue',temps)




# 最后一定要写
turtle.done()


