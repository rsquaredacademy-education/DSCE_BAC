
# coding: utf-8

# ## Data Visualization 

# #### Agenda

# ##### Libraries

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt


# ##### Import Data

# In[15]:


mtcars = pd.read_csv("data/mtcars.csv")
mtcars.head()


# ##### Line Chart

# In[7]:


mt1 = mtcars.sort_values('disp')
x = mt1['disp']
y = mt1['mpg']
plt.plot(x, y)


# ##### Line Aesthetics

# In[10]:


plt.plot(x, y, color = "red", linewidth = 1, linestyle = "--")


# ##### Axis Limits

# In[12]:


plt.plot(x, y, color = "red", linewidth = 1, linestyle = "--")
plt.xlim(0, 500)
plt.ylim(0, 40)


# ##### Scatter Plots

# In[13]:


plt.scatter(x, y)


# ##### Bar Plots

# In[36]:


x = [4, 6, 8]
y = [11, 7, 14]
plt.bar(x, y)


# ##### Modify Color

# In[37]:


plt.bar(x, y, color = "red")


# ##### Horizontal Bar Plot

# In[40]:


plt.barh(x, y)


# ##### Histograms

# In[41]:


x = mtcars['disp']
plt.hist(x)


# ##### Specify Bins

# In[43]:


plt.hist(x, bins = 5)


# ##### Histogram Color

# In[44]:


plt.hist(x, color = "red")


# ##### Box Plots

# In[45]:


plt.boxplot(x)


# ##### Compare Median

# In[47]:


plt.boxplot(x, notch = True)


# ##### Horizontal Box Plot

# In[48]:


plt.boxplot(x, vert = False)


# ##### Title & Axis Labels

# In[52]:


mt1 = mtcars.sort_values('disp')
x = mt1['disp']
y = mt1['mpg']
plt.scatter(x, y)
plt.title("Displacement vs Mileage")
plt.xlabel("Displacement")
plt.ylabel("Mileage")

