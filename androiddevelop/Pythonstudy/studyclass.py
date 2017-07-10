class Fruits:
    def __init__(self,color,name): #初始化函数
        self.name = name
        self.color = color
    def eat(self):
        print("啊，我被吃完了，怎么办！" + self.name)

apple = Fruits('red','apple')
banana = Fruits('yellow','banna')


print(banana.color)
banana.eat()



