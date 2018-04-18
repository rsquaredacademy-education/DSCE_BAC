
# coding: utf-8

# ##### Linear Regression

# #### Libraries

# In[24]:


get_ipython().run_line_magic('matplotlib', 'inline')

import numpy as np
import pandas as pd
import statsmodels.api as sm
from sklearn import datasets
import statsmodels.stats.api as sms
import matplotlib.pyplot as plt
from statsmodels.compat import lzip
import statsmodels.formula.api as smf


# #### Data

# In[2]:


data = datasets.load_boston()
df = pd.DataFrame(data.data, columns=data.feature_names)
target = pd.DataFrame(data.target, columns=["MEDV"])


# #### Regression

# In[4]:


X = df["RM"]
X = sm.add_constant(X)
y = target["MEDV"]
model = sm.OLS(y, X)
results = model.fit()
print(results.summary())


# ##### Predictions

# In[21]:


predictions = results.predict(X)
predictions


# ##### Parameters

# In[5]:


results.params


# #### R-Squared

# In[6]:


results.rsquared


# #### Normality Tests

# In[10]:


name = ['Jarque-Bera', 'Chi^2 two-tail prob.', 'Skew', 'Kurtosis']
test = sms.jarque_bera(results.resid)
lzip(name, test)


# In[11]:


name = ['Chi^2', 'Two-tail probability']
test = sms.omni_normtest(results.resid)
lzip(name, test)


# #### Influence Tests

# In[12]:


from statsmodels.stats.outliers_influence import OLSInfluence
test_class = OLSInfluence(results)
test_class.dfbetas[:5,:]


# In[14]:


from statsmodels.graphics.regressionplots import plot_leverage_resid2
fig, ax = plt.subplots(figsize=(10,8))
fig = plot_leverage_resid2(results, ax = ax)


# #### Multicollinearity

# In[15]:


np.linalg.cond(results.model.exog)


# #### Heteroskedasticity Tests

# ##### Breusch Pagan Test

# In[17]:


name = ['Lagrange multiplier statistic', 'p-value', 
        'f-value', 'f p-value']
test = sms.het_breuschpagan(results.resid, results.model.exog)
lzip(name, test)


# ##### Goldfeld Quandt Test

# In[18]:


name = ['F statistic', 'p-value']
test = sms.het_goldfeldquandt(results.resid, results.model.exog)
lzip(name, test)


# #### Harvey Collier Multiplier Test

# In[19]:


name = ['t value', 'p value']
test = sms.linear_harvey_collier(results)
lzip(name, test)


# #### Influence Plots

# In[21]:


fig, ax = plt.subplots(figsize=(12,8))
fig = sm.graphics.influence_plot(results, ax=ax, criterion="cooks")

