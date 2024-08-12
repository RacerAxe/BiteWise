# BiteWise

BiteWise leverages the power of Google Gemini to offer AI-driven meal tracking and planning, providing users with personalized recipe suggestions. 

Video Demo: https://www.youtube.com/watch?v=UNOnZME067A

<img width="357" alt="Screenshot 2024-08-11 at 10 44 32 PM" src="https://github.com/user-attachments/assets/13169bde-0003-4221-8bf7-d38d7f990dbf">

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release. 

After signing in and entering basic user information, users can either take an image from the device camera, choose an existing image or enter text to prompt the model to generate recipe ideas. 

<img width="358" alt="Screenshot 2024-08-11 at 10 45 13 PM" src="https://github.com/user-attachments/assets/095ecbdd-13e0-4f10-9593-ea40bde3559c">

We’ve also incorporated a re-prompting feature, giving users the flexibility to regenerate recipes if the initial output does not meet their expectations. When the user has decided on a recipe to follow, the user can save it to track weekly nutrition intake and calories consumed, displayed on the dashboard. 

<img width="476" alt="Screenshot 2024-08-11 at 10 53 14 PM" src="https://github.com/user-attachments/assets/43dc7e82-4129-4bdd-a113-b54df69d57c7">

<img width="477" alt="Screenshot 2024-08-11 at 10 56 53 PM" src="https://github.com/user-attachments/assets/02af169a-3293-4772-9ed6-01cdb2f1d894">

## IMPORTANT

In order to activate the image generation capability (which is currently implemented through OpenAI DALL·E 3), users need to enter their own API Key inside the generateImage.dart file to provide the necessary authorization to access the service. Alternatively, users can also opt to user a different model to generate images for the recipe by updating the API endpoint. 


