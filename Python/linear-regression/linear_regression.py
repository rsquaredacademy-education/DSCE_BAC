
# coding: utf-8

# ##### Linear Regression

# #### Libraries

# In[10]:


import numpy as np
import pandas as pd
import statsmodels.api as sm
from sklearn import datasets


# #### Data

# In[16]:


data = datasets.load_boston()
df = pd.DataFrame(data.data, columns=data.feature_names)
target = pd.DataFrame(data.target, columns=["MEDV"])


# #### Regression

# In[20]:


X = df["RM"]
X = sm.add_constant(X)
y = target["MEDV"]
model = sm.OLS(y, X)
results = mod.fit()
print(results.summary())


# ##### Predictions

# In[21]:


predictions = results.predict(X)
predictions


# ##### Parameters

# In[22]:


results.params


# In[23]:


results.rsquared

