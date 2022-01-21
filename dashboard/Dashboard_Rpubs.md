 
========================================================
css: css-file.css
<style>
.section .reveal .state-background {
    background: url(https://cdn.pixabay.com/photo/2017/03/27/21/31/money-2180338_1280.jpg);
    background-position: center center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: 100% 100%;
}
body {
      background-image: url(https://image.freepik.com/free-vector/white-gold-geometric-pattern-background-vector_53876-140726.jpg);
      background-position: center center;
      background-attachment: fixed;
      background-repeat: no-repeat;
      background-size: 100% 100%;
    }
</style>
### PERSONAL FINANCE DASHBOARD  
<span style="color:black"><font size="5"> 
Lai Ke Wei (U2102777)<br>
Jianbang Dai (S2116427)<br>
Sizhao Zou (S2104420)<br>
Shizheng Zhang (S2023000)</font>
<font size = "3">-------[25 January 2022]</font></span>  
![](Rpubs1.png)

========================================================
## Why Personal Finance Dashboard?
### Introduction
<font size="5">
This is the presentation for the WIA1007 group project(create a beneficial Shiny App). Nowadays, many people suffer from financial problems because of the continuously increased prices of goods and services. Since we cannot change the social and economic environment, personal finance is becoming very important.<br>Objective of this project is to provide a simple online tool to analyze their income and expenses and guideline to those who don't know where to start saving.
</font>    

### Summary Of Experience
<font size = "5">
This Shiny App group project is very challenging for us since this is the first time to use R to build an app. In R, there are a lot of methods and functions we are not used to, and we need much time to think and find out the most suitable ways to perform analysis. However, it is still interesting to us. We basked in glory when we saw the app finished under schedule step by step.
</font>  

========================================================
<div style="float: left; width: 45%;">
<span style="font-weight: bold;">Stakeholders</span><br> 
<font size="5">
- Anyone who want to budget his expenses<br>   
- Anyone who like to know better about his economic status<br>   
- Anyone who feels headache analysing account by himself<br>
</font><br>  
</div>
<div style="float: right; width: 55%;">
<span style="font-weight: bold;">Problem Statement</span><br> 
<font size="5">
1. What is the reason of the continuously increased amount of people facing financial problems?<br>
2. What are the type of living expenses cost the most?<br>
3. What are the type of major income and minor income?<br>
4. Can people have savings after all expenses are paid?<br>
</font>
</div><br>  

### Data Science Process
#### 1. Getting Data
<font size="5">
@ Customer Price Index from: [https://data.worldbank.org/indicator/FP.CPI.TOTL](https://data.worldbank.org/indicator/FP.CPI.TOTL)  
@ Data Input from User, the .xlsx file
</font> 



========================================================
#### 2. Data Cleaning & Analyzing  
![](cleaning.png)
![](cleaning2.png)  
<font size = "4">
We clean the data by remove incorrect, irrelevant and incomplete data so that they became organized and usable.
</font>
![](Str.png)
![](Summary.png)  
<font size = "4">
We use str() and summary() functions to know more details about our data.  
</font>  
![](description.png)

========================================================
#### 3. Data Visualisation
![](Pie.png)
![](Line.png)  
<font size = "4">
We use plot the data into different types of chart for easy understanding.
</font>  
Link to the App: [https://wei3.shinyapps.io/Personal_Finance_Dashboard/](https://wei3.shinyapps.io/Personal_Finance_Dashboard/)    
Link to the Github Source Code:  [https://github.com/WEI-728/introdatascience/blob/main/dashboard/app.R](https://github.com/WEI-728/introdatascience/blob/main/dashboard/app.R)
<br>
<br>

## The End.  
## Thank You.
