# Olympic-Medals-Analysis
This is a project to analyze the factors influencing Olympic medal counts using R and various statistical methods. The project uses data from the 2012 Summer Olympics and the World Bank.

## Objectives
The main objectives of this project are:

To create a dummy variable for G20 by checking whether the nation is at the top 20 for total GDP in 2012
To investigate models to estimate the number of gold medals won, including the dummy variables
To investigate the interactions between the G20 variable and other significant predictors
To build a model to predict the probability of being at the top 10 by total medal count using a logistic regression model

## Data Sources
The data sources used for this project are:

medals-1.csv: A dataset containing the number of medals won by each nation in the 2012 Summer Olympics
GDP.csv: A dataset containing the GDP and population of each nation in 2012 from the World Bank

## Data Analysis
The data analysis steps for this project are:

Data cleaning and preprocessing: Removing missing values, outliers, and duplicates; merging the two datasets; creating new variables
Exploratory data analysis: Visualizing the distribution of variables, correlation matrix, and scatter plots
Regression analysis: Fitting linear regression models with different predictors and transformations; checking model assumptions and diagnostics; interpreting model coefficients and significance
Logistic regression analysis: Fitting logistic regression models with different predictors; checking model performance and accuracy; interpreting 
model coefficients and odds ratios

## Results and Findings
The main results and findings of this project are:

The G20 variable is a significant predictor of gold medals and total medals, indicating that nations with higher GDP tend to win more medals
There are significant interactions between the G20 variable and other predictors, such as population and continent, suggesting that the effect of GDP on medals varies across different groups of nations
The logistic regression model can predict the probability of being in the top 10 medal-count countries with 85% accuracy, using predictors such as GDP, population, continent, and G20
The significant coefficients in the logistic regression model imply that nations with higher GDP, lower population, belonging to Europe or Oceania, and being in the G20 have higher odds of being in the top 10 medal-count countries

## Conclusion and Recommendations
The conclusion and recommendations of this project are:

This project demonstrates how R and various statistical methods can be used to analyze the factors influencing Olympic medal counts
The project provides insights into how GDP, population, continent, and G20 affect the number of medals won by each nation
The project also provides a predictive model that can estimate the probability of being in the top 10 medal-count countries based on these factors
The project suggests that nations that want to improve their Olympic performance should invest more in their sports development, increase their population size, diversify their sports participation, and join the G20 if possible
