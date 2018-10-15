import pandas as pd
from sklearn import datasets
import numpy as np
import matplotlib.pyplot as plt

boton=datasets.load_boston
print(boston.keys())
df=pd.Dataframe(boston.data)
df.columns=boston.frature_names
df['PRICE']=boston.target
df.head()

cdf=df[['ZN','INDUS','CHAS','RM','TAX','PTRATIO','PRICE','CRIM']]
cdf.head()

cdf.head(11)

ktr=cdf[['ZN','INDUS','RM','TAX','PTRATIO','PRICE','CRIM']]
ktr.hist()
plt.show()
plt.scatter(cdf.CRIM,cdf.PRICE,color='blue')
plt.xlabel('crime_rate')
plt.ylabel('price of houses')
plt.title('crime_rate vs price of houses')
plt.show()

msk=np.random.rand((len(df)))<0.8
train=cdf[msk]
test=cdf[~msk]

plt.scatter(train.CRIM,train.PRICE,color='blue')
plt.xlabel('crime rate')
plt.ylabel('price of houses')
plt.show()

from sklearn import linear_model
lr=linear_model.LinearRegression()
x=np.asanyarray(train['CRIM'])
print(pd.DataFrame(x))
print(pd.DataFrame(y))
print(x)
y=np.asanyarray(train['PRICE'])
a=np.reshape(x,(-1,1))
b=np.reshape(y,(-1,1))
lr.fit(a,b)
print(lr.coef_)
print(lr.intercept_)

plt.scatter(a,b,color='blue')
plt.plot(a,lr.coef_[0][0]*a+lr.intercept_[0],'-r')
plt.xlabel("crime rate")
plt.ylabel("price of houses")
plt.title("crime vs price")
plt.show()
