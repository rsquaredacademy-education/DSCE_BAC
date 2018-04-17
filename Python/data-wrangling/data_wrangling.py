
# coding: utf-8

# ## Data Wrangling with Pandas

# #### Agenda
# 
# In this module, we will learn to:
# 
# - select columns
# - filter rows
# - sort data
# - generate new variables
# - create grouped summaries

# #### Libraries

# In[14]:


import pandas as pd
import numpy as np


# #### Data 

# In[7]:


ecom = pd.read_csv("data/web.csv")
ecom.head()


# #### Filter Data

# In[8]:


ecom1 = ecom.query('purchase == True')
ecom1.head()


# #### Select Columns

# In[13]:


ecom2 = ecom1.loc[:, ['device', 'order_items', 'order_value']]
ecom2.head()


# ##### Group By

# In[18]:


ecom3 = ecom2.groupby('device').sum()
ecom3


# ##### Compute Average Order Value

# In[20]:


ecom3['aov'] = ecom3['order_value'] / ecom3['order_items']
ecom3


# ##### Sort AoV

# In[23]:


ecom3.sort_values('aov')

