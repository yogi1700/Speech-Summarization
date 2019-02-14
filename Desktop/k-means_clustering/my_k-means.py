

# Dependencies

import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
#%matplotlib inline
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()
# Load the train and test datasets to create two DataFrames

#train_url = "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"
train = pd.read_csv("/home/iplab/Desktop/Merge_csv/b.csv")
#test_url = "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"
#test = pd.read_csv(test_url)

print("***** Train_Set *****")
print(train.head())
print("\n")
'''print("***** Test_Set *****")
print(test.head())'''

print("***** Train_Set *****")
print(train.describe())
print("\n")
'''print("***** Test_Set *****")
print(test.describe())'''

print(train.columns.values)

train.isna().head()

'''# For the test set
test.isna().head()'''

print("*****In the train set*****")
print(train.isna().sum())
print("\n")
'''print("*****In the test set*****")
print(test.isna().sum())'''

# Fill missing values with mean column values in the train set
train.fillna(train.mean(), inplace=True)

'''# Fill missing values with mean column values in the test set
test.fillna(test.mean(), inplace=True)'''

print(train.isna().sum())

'''print(test.isna().sum())'''

train['pitch'].head()

train['intensity'].head()

'''train[['Pclass', 'Survived']].groupby(['Pclass'], as_index=False).mean().sort_values(by='Survived', ascending=False)

train[["Sex", "Survived"]].groupby(['Sex'], as_index=False).mean().sort_values(by='Survived', ascending=False)

train[["SibSp", "Survived"]].groupby(['SibSp'], as_index=False).mean().sort_values(by='Survived', ascending=False)

g = sns.FacetGrid(train, col='Survived')
g.map(plt.hist, 'Age', bins=20)

grid = sns.FacetGrid(train, col='Survived', row='Pclass', size=2.2, aspect=1.6)
grid.map(plt.hist, 'Age', alpha=.5, bins=20)
grid.add_legend();'''

train.info()

train = train.drop(['length'], axis=1)
train = train.drop(['Name'], axis=1)
#train = train.drop(['y'], axis=1)


'''test = test.drop(['Name','Ticket', 'Cabin','Embarked'], axis=1)'''

labelEncoder = LabelEncoder()
labelEncoder.fit(train['intensity'])
#labelEncoder.fit(test['Sex'])
train['intensity'] = labelEncoder.transform(train['intensity'])
#test['Sex'] = labelEncoder.transform(test['Sex'])
# Let's investigate if you have non-numeric data left


train.info()

'''test.info()'''

X = np.array(train.astype(float))

#y = np.array(train['Survived'])

train.info()


'''kmeans = kmeans = KMeans(n_clusters=2, max_iter=600, algorithm = 'auto')
kmeans.fit(X)
KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=600,
    n_clusters=2, n_init=10, n_jobs=1, precompute_distances='auto',
    random_state=None, tol=0.0001, verbose=0)
correct = 0
for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = kmeans.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))'''

kmeans = KMeans(n_clusters=2) 
# You want cluster the passenger records into 2: Survived or Not #    survived
kmeans.fit(X)
y_kmeans = kmeans.predict(X);

KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=1000,
    n_clusters=5, n_init=10, n_jobs=1, precompute_distances='auto',
    random_state=None, tol=0.0001, verbose=0)

le = len(y_kmeans)
print(le)
one = 0;
for i in range(le):
  if y_kmeans[i] == 1 :
     one += 1
print(y_kmeans)
print(one)
print(le - one)

plt.scatter(X[:, 0], X[:, 1], c=y_kmeans, s=50, cmap='BrBG')
centers = kmeans.cluster_centers_
plt.scatter(centers[:, 0], centers[:, 1], c='black', s=200, alpha=0.5);
plt.show();


'''#df = pd.read_csv("/home/iplab/Desktop/Merge_csv/b.csv")
df['y'] = y_kmeans 
df.to_csv("/home/iplab/Desktop/Merge_csv/b.csv")'''


'''correct = 0

for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = kmeans.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))
kmeans = KMeans(n_clusters=2, max_iter=600, algorithm = 'auto')
kmeans.fit(X)

KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=600,
    n_clusters=2, n_init=10, n_jobs=1, precompute_distances='auto',
    random_state=None, tol=0.0001, verbose=0)

correct = 0
for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = kmeans.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))

scaler = MinMaxScaler()
X_scaled = scaler.fit_transform(X)
kmeans.fit(X_scaled)
KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=600,
    n_clusters=2, n_init=10, n_jobs=1, precompute_distances='auto',
    random_state=None, tol=0.0001, verbose=0)
correct = 0

for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = kmeans.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))

scaler = MinMaxScaler()
X_scaled = scaler.fit_transform(X)
kmeans.fit(X_scaled)
KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=600,
    n_clusters=2, n_init=10, n_jobs=1, precompute_distances='auto',
    random_state=None, tol=0.0001, verbose=0)
correct = 0

for i in range(len(X)):
    predict_me = np.array(X[i].astype(float))
    predict_me = predict_me.reshape(-1, len(predict_me))
    prediction = kmeans.predict(predict_me)
    if prediction[0] == y[i]:
        correct += 1

print(correct/len(X))
'''




