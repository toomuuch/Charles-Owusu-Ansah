#Business and Entertainment purpose

# The objectives are:
   #Identify which studios have the best rate of return on their production budget for division acquisition.
   #Develop a screening criteria to help users select a movie to watch based on the filters they apply.
   #Years with highly rated movies based on proposed metascore.

#Dataset source: https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset
#we used the "IMDb movies.csv" data

#The data consist of 8126 rows and 22 columns of movie entries. 
#The columns include ['imdb_title_id','title','original_title','year','date_published','genre', 'duration','country','language','director','writer',
#'production_company','actors','description','avg_vote','votes','budget','usa_gross_income','worlwide_gross_income','metascore','reviews_from_users','reviews_from_critics']


#Import dependencies
#read data or make a dataframe

#Data Cleaning
#Before reading the data, we visualised the dataset to understand and select the correct methods for our analysis.
#We cleaned the data by dropping NAN, removing currency signs and performed other data pre-processing methods.

#created a dictionary of the currency rates versus dollar using the conversion rates of 2/23/2021 at 8:00pm.
#created a currency converter function which converts the currencies into their dollar equivalent value.
#Made a list of the converted currencies.
#converted the list to dataframe and merged it to the original dataframe.
#Deduced the profit margin by subtracting the production budget from the worldwide gross income
#printed and plotted studios with the largest profit margin
#Calculated the percentage profit for each movie


#Made a copy of the dataframe
#Deduced the profit made by each production company
#listed the production company with top 20 rate of return on the production budget
#plotted a bar chart for production company versus budget and profit
#listed and plotted a bar chart for production company with least returns


#Made a copy of the dataframe
#Normalised the reviews_from_critics, reviews_from_users and votes columns to generate the proposed metascore
#Calculated the average of the normalised columns
#developed a method that select a movie from a list based on the user input (genre and year or its combination)
#plotted a scatter plot of years versus our proposed metascore