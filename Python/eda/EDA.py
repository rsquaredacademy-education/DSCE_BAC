
# coding: utf-8

# ##### Exploratory Data Analysis

# #### Libraries

# In[2]:


import pandas as pd


# #### Data

# In[3]:


mtcars = pd.read_csv("data/mtcars.csv")


# #### Describe

# In[4]:


mtcars.describe()


# #### First and Last 5 Rows

# In[5]:


mtcars.head()


# In[6]:


mtcars.tail()


# #### Count

# In[11]:


x = mtcars['cyl'].value_counts()
x


# #### Cross Tabulation

# In[13]:


cyl = mtcars['cyl']
gear = mtcars['gear']
pd.crosstab(cyl, gear)


# ##### Binning

# In[18]:


mpg = mtcars['mpg']
pd.qcut(mpg, 5)


# In[19]:


mpg = mtcars['mpg']
pd.qcut(mpg, 5, labels = False)

