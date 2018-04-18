
# coding: utf-8

# ## Logistic Regression

# #### Libraries

# In[23]:


import numpy as np
import pandas as pd
import statsmodels.api as sm
import statsmodels.formula.api as smf


# #### Data 

# In[2]:


bank = pd.read_csv("data/bank.csv")
bank.head()


# #### Summary Statistics

# In[3]:


bank.describe()


# #### Frequency Table

# In[4]:


bank['job'].value_counts()


# In[5]:


bank['education'].value_counts()


# In[6]:


bank['marital'].value_counts()


# #### Cross Tabulation

# In[7]:


marital = bank['marital']
subscribed = bank['y']
pd.crosstab(marital, subscribed)


# In[8]:


education = bank['education']
pd.crosstab(education, subscribed)


# #### Regression

# In[25]:


formula = 'y ~ age + education + marital + job'
model = smf.glm(formula=formula, data=bank, family=sm.families.Binomial())
result = model.fit()
print(result.summary())


# #### Confidence Intervals

# In[26]:


print(result.conf_int())


# #### Odds Ratio

# In[27]:


print(np.exp(result.params))


# #### Odds Ratio & Confidence Intervals

# In[28]:


params = result.params
conf = result.conf_int()
conf['OR'] = params
conf.columns = ['2.5%', '97.5%', 'OR']
print(np.exp(conf))

