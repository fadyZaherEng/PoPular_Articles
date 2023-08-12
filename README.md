# most_popular_articales

The app get most popular articles form Rest API.
______________
Used in app:
Clean architecture using Bloc with divide app into four layers
App -->contain constants , dependency injection, extension,root app.
Data -->contain data source--> local , remote and network -->Dio, error handler,network connection and RepositoryImpl.
Domain -->models, use case, Repository.
Presentation -->resources, modules
___________________________________
Explain Solid principle in my app:

Single Responsibility principle :
Each class perform only one Job in application
Used in app class for only one job
__________
Open Closed principle :
Open for extension but close for modification
Make abstract class
Then create class to need methods in it and implement it
And when I use it create object from abstract class but it is pointer on implement classes
So when I need another class only create new class(open for extension) but not modified in class 
with if condition for new class if not use abstract class or interface (closed modification)
Used in app
Always used abstract class and classes implement it
__________
Liskov Substitution Principle :
Used in app
If class Repository extends another class RepositoryImpl can say that
Class Repository=RepositoryImpl
___________
Segregation interface principle :
Interface contain one method better than alot methods
Used in app
Always interface contain on used methods for all class that implement it
____________
Dependency Inversion principle:
High level not depend on low level but between high and low must be interface
Used in app
In using home use case for Repository interface
And make RepositoryImpl that depends on Repository interface and 
home use case that is high level also depends on Repository interface so there are between them abstraction
And can pass RepositoryImpl to home use case
___________________________________
Explain patterns used:
Repository design patterns:
Software design patterns decouples data Access logic from business logic and
it's Intermediate  between data and domain layers
___________________________________
Explain using use case:
Used between domain and presentation layers as Intermediate
To ensure independence of all layers with using abstraction way by Repository interface between data and
domain layers, use case between domain and presentation layers



![home](https://github.com/fadyZaherEng/PoPular_Articles/assets/60519197/e6a8073f-be68-457f-a493-51d1991b547c)
![details1](https://github.com/fadyZaherEng/PoPular_Articles/assets/60519197/38cc62d9-13f2-48c1-ba24-67a35f0e9454)
![details2](https://github.com/fadyZaherEng/PoPular_Articles/assets/60519197/9b4e8d29-6f74-482a-8ed4-1354a92c0c59)

