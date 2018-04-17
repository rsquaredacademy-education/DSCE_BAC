
# coding: utf-8

# ## Import Data into Python

# #### Agenda
# 
# In this module, we will learn to:
# 
# - read data from delimited/flat files
# - read data from excel files
# - read data from statistical softwares

# #### Libraries

# In[1]:


import pandas as pd


# #### Comma Separated Values

# In[2]:


pd.read_csv("data/mtcars.csv")


# ##### Specify Delimiter

# In[3]:


pd.read_table("data/mtcars.csv", sep = ",")


# ##### Column Names

# In[4]:


pd.read_csv("data/mtcars1.csv", header = None)


# ##### Skip Rows

# In[6]:


pd.read_csv("data/mtcars2.csv", skiprows = 19)


# ##### Maximum Rows

# In[7]:


pd.read_csv("data/mtcars.csv", nrows = 20)


# #### Excel Files

# In[14]:


pd.read_excel("data/sample.xls", sheet_name = 0)


# ##### Read Specific Columns

# In[17]:


pd.read_excel("data/sample.xls", sheet_name = 0, usecols = "A:C")


# #### Statistical Softwares

# ##### SAS

# In[18]:


pd.read_sas("data/airline.sas7bdat")


# ##### STATA

# In[19]:


pd.read_stata("data/airline.dta")


# #### Summary
# 
# - use read_csv for flat/delimited files
# - use read_excel for excel files
# - use read_sas for SAS files
# - use read_stat for STATA files
