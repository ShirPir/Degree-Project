import pandas as pd
import numpy as np
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import StandardScaler

#Synthetic dataset
synth_train = pd.read_csv('/content/drive/MyDrive/Degree Project/train.zip', delimiter=',')
synth_test = pd.read_csv('/content/drive/MyDrive/Degree Project/test.zip', delimiter=',')
def data(df):
  Y = df['Label']                                  #Labels
  Y = Y.to_numpy()
  X = df.to_numpy()
  X = np.delete(X, -1, axis=1)
  X1 = X[:,0:2]                                    #Categorical Features
  X2 = X[:, 2:]                                    #Numerical Features
  min_val = np.min(X2,axis=0)
  max_val = np.max(X2,axis=0)
  X2 = (X2 - min_val) / (max_val - min_val)
  X1 = OneHotEncoder().fit_transform(X1).toarray() #Encode categorical features
  X = np.concatenate((X1,X2), axis=1)
  X = np.asarray(X).astype('float32')
  Y = np.asarray(Y).astype('float32')
  X = StandardScaler().fit_transform(X)            #Standardizes data
  return X,Y

X_train, Y_train = data(synth_train)
X_test, Y_test = data(synth_test)