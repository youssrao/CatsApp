# CatsApp

## Description of the problem and solution. 
The goal of this project was to create an iOS application fetch a list of cat breeds and information about them from The Cats API and to display it in a list.

The solution was fetching the information about the cats using URLSession and Combine and display them using SwiftUIs List. On the initial screen, a list of images is shown alongside the name of the cat. When the show detailed view button is pressed, you’ll be redirected to a second screen that also contains a list of general and characteristic information about the selected cat.


## The technical choices you made, trade-offs you might have taken, possible approvements you want to do and anything left out.
The app was created using Combine and SwiftUI. The reason for choosing Combine is for the advantages it provides for processing values over time. The code is easier to read and understand for storing and fetching the values from the API. For this app I followed the MVVM architecture. Firstly, I created a model with the values from the result of the API. The weight and the image of the cat breeds were nested in the JSON result so the for those values another struct had to be made to use it as a type. 

The second step was to write a method to fetch the data from the url, with an API key in the header of the request. This function was written using a generic type. The reason for that is to make sure that the function can be reused to fetch any kind of data from an url with an api key. 

In the view model the fetch function gets called to gather the data from the API and then subscribe on the values. An approvement that can be made in this file is not hard coding the url and the api key but storing this in a more safely manner such as storing it in a backend and access it through an API call or store it in User Default/Core Data.

Lastly, it’s time to display the information. For this I used SwiftUIs List and Navigation View to display a detailed view of the different cat breeds. I created an object to use the view model to display the information gathered from the cats API. In the List I display the image of the cat and the name of the cat. By clicking the show detail view button you’ll be taken to another view in which more detail about the specific cat breed will be displayed in a section. The section is divided into 2 groups, this is to group the information about the cat itself together and the characteristics of the cat in another group. 

## Not completed
In the model I haven’t set all the values from the result of the API call. The reason for this is because when I started the model, the first goal was to get just one value and display in the console and then in the actual list. From displaying one value I expanded on adding more values. But I did not have time to fully populate the model with all the values.