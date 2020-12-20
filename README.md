# README
# Lotus Flower Bomb
## Learning Goals

* Build out CRUD functionality for a many to many relationship
* Use ActiveRecord to write queries that join multiple tables of data together
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Validate models and handle sad paths for invalid data input
* Use flash messages to give feedback to the user
* Use partials in views
* Use `within` blocks in tests
* Track user stories using GitHub Projects
* Deploy an application to Heroku
### PREWORK
```
[x] done >> Deploy your application to Heroku

As a visitor of the site
I will perform all user stories
By visiting the application on Heroku.
Localhost is fine for development, but
the application must be hosted on Heroku.
```
## ONE TO MANY USER STORIES 

[x] done >> Schema Design

You can create as many columns on each table as you would like, but we need a few columns represented on at least one table:
    1. One boolean column
    2. One numeric column
    3. Two DateTime columns

**CRUD Functionality**

* Teahouse

1. [x] done >> User Story 1, Teahouse Index 

For each teahouse table
As a visitor
When I visit '/teahouses'
Then I see the name of each teahouse record in the system

2. [x] done >> User Story 2, Teahouse Show 

As a visitor
When I visit '/teahouses/:id'
Then I see the teahouse with that id including the teahouse's attributes:
- data from each column that is on the teahouse table

3. [x] done >> User Story 3, Teahouse Creation 

As a visitor
When I visit the Teahouse Index page
Then I see a link to create a new Teahouse record, "New Teahouse"
When I click this link
Then I am taken to '/teahouses/new' where I  see a form for a new teahouse record
When I fill out the form with a new teahouse's attributes:
And I click the button "Create Teahouse" to submit the form
Then a `POST` request is sent to the '/teahouses' route,
a new teahouse record is created,
and I am redirected to the Teahouse Index page where I see the new Teahouse displayed.

4. [x] done >> User Story 4, Teahouse Update 

As a visitor
When I visit a teahouse show page
Then I see a link to update the teahouse "Update Teahouse"
When I click the link "Update Teahouse"
Then I am taken to '/teahouses/:id/edit' where I  see a form to edit the teahouse's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/teahouses/:id',
the teahouse's info is updated,
and I am redirected to the Teahouse's Show page where I see the teahouse's updated info

5. [x] done >> User Story 5, Teahouse Delete 

As a visitor
When I visit a teahouse show page
Then I see a link to delete the teahouse
When I click the link "Delete Teahouse"
Then a 'DELETE' request is sent to '/teahouses/:id',
the teahouse is deleted, and all boba_tea records are deleted
and I am redirected to the teahouse index page where I no longer see this teahouse

* Boba_tea can be associated to the Teahouse. Boba_tea belong to a teahouse.
- Anywhere you see boba_tea_table_name think pets from our Pets and Shelters example.

6. [x] done >> User Story 6, Boba Tea Index 

As a visitor
When I visit '/boba_tea_table_name'
Then I see each Boba_tea in the system including the Boba_tea's attributes:

7. [x] done >> User Story 7, Teahouse Boba Teas Index 

As a visitor
When I visit '/teahouses/:teahouse_id/boba_tea_table_name'
Then I see each Boba_tea that is associated with that Teahouse with each Boba_tea's attributes

8. [x] done >> User Story 8, Boba_tea Show 

As a visitor
When I visit '/boba_tea_table_name/:id'
Then I see the boba_tea with that id including the boba_tea's attributes:

9. [x] done >> User Story 9, Teahouse Boba_tea Creation 

As a visitor
When I visit a Teahouse Boba_teas Index page
Then I see a link to add a new purchasable boba_tea for that teahouse "Add Boba Tea"
When I click the link
I am taken to '/teahouses/:teahouse_id/boba_tea_table_name/new' where I see a form to add a new purchasable boba_tea
When I fill in the form with the boba_tea's attributes:
And I click the button "Add Boba Tea"
Then a `POST` request is sent to '/teahouses/:teahouse_id/boba_tea_table_name',
a new boba_tea object/row is created for that teahouse,
and I am redirected to the Teahouse Boba_teas Index page where I can see the new boba_tea listed

10. [x] done >> User Story 10, Boba_tea Update 

As a visitor
When I visit a Boba_tea Show page
Then I see a link to update that Boba_tea "Update Boba_tea"
When I click the link
I am taken to '/boba_tea_table_name/:id/edit' where I see a form to edit the boba_tea's attributes:
When I click the button to submit the form "Update Boba_tea"
Then a `PATCH` request is sent to '/boba_tea_table_name/:id',
the boba_tea's data is updated,
and I am redirected to the Boba_tea Show page where I see the Boba_tea's updated information

11. [x] done >> User Story 11, Boba_tea Delete 

As a visitor
When I visit a boba_tea show page
Then I see a link to delete the boba_tea "Delete Boba_tea"
When I click the link
Then a 'DELETE' request is sent to '/boba_tea_table_name/:id',
the boba_tea is deleted,
and I am redirected to the boba_tea index page where I no longer see this boba_tea
CRUD functionality will be reviewed at your first check-in

**ActiveRecord**
12. [ ] done >> User Story 12, Records with a DateTime Column Automatically Sort by the Most Recently Created Records on Their Index Page 

As a visitor
When I visit the '/teahouses' index page for a teahouse table that has a DateTime column
I see the most recently created records in order by recency from top to bottom
I also see the DateTime(s) next to each of the records in a reasonably formatted manner

13. [x] done >> User Story 13, Teahouse Boba_tea Count 

As a visitor
When I visit a teahouse's `boba_tea_table_name` index page
I see a count of the number of `boba_tea_table_name` associated with this teahouse

14. [x] done >> User Story 14, Boolean Column `true` Records are Displayed First on All Index Pages

As a visitor
When I visit the /boba_teas' index page for a boba_tea table that has a boolean column
I see the records that have a `true` above/before the records that have a false

15. [x] done >> User Story 15, Display Records Over a Given Threshold if the Records Have a Numeric Column

As a visitor
When I visit the '/teahouses' or '/boba_tea_table_name' index page for any teahouse or boba_tea table that has a numeric column
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.

16. [ ] done >> User Story 16, Sort Teahouses by Number of Boba_tear 

As a visitor
When I visit the Teahouses Index Page
Then I see a link to sort teahouses by the number of `boba_tea_table_name` they have
When I click on the link
I'm taken back to the Teahouse Index Page where I see all of the teahouses in order of their count of `boba_tea_table_name` (highest to lowest) And, I see the number of boba_tea next to each teahouse name

17. [ ] done >> User Story 17, Sort Teahouse's Boba_tear in Alphabetical Order by name 

As a visitor
When I visit the Teahouse's boba_tea Index Page
Then I see a link to sort boba_tea in alphabetical order
When I click on the link
I'm taken back to the Teahouse's boba_tea Index Page where I see all of the teahouses in alphabetical order
ActiveRecord functionality will be reviewed at your first and second check-in

**Usability**
Users should be able to use the site easily. This means making sure there are links/buttons to reach all parts of the site and the styling/layout is sensible.

18. [ ] done >> User Story 18, Teahouse Update From Teahouse Index Page 

As a visitor
When I visit the teahouse index page
Next to every teahouse, I see a link to edit that teahouse's info
When I click the link
I should be taken to that teahouses edit page where I can update its information just like in User Story 5

19. [ ] done >> User Story 19, Teahouse Delete From Teahouse Index Page 

As a visitor
When I visit the teahouse index page
Next to every teahouse, I see a link to delete that teahouse
When I click the link
I am returned to the Teahouse Index Page where I no longer see that teahouse

20. [ ] done >> User Story 20, Boba_tea Update From Boba_teas Index Page 

As a visitor
When I visit the `boba_tea_table_name` index page or a teahouse `boba_tea_table_name` index page
Next to every boba_tea, I see a link to edit that boba_tea's info
When I click the link
I should be taken to that `boba_tea_table_name` edit page where I can update its information just like in User Story 11

21. [ ] done >> User Story 21, Boba_tea Delete From Boba_teas Index Page 

As a visitor
When I visit the `boba_tea_table_name` index page or a teahouse `boba_tea_table_name` index page
Next to every boba_tea, I see a link to delete that boba_tea
When I click the link
I should be taken to the `boba_tea_table_name` index page where I no longer see that boba_tea

22. [ ] done >> User Story 22, Teahouse Links

As a visitor
When I click on the name of a teahouse anywhere on the site
Then that link takes me to that Teahouse's show page

23. [ ] done >> User Story 23, Boba_tea Links

As a visitor
When I click on the name a boba_tea anywhere on the site
Then that link takes me to that Boba_tea's show page

24. [ ] done >> User Story 24, Boba_tea Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Boba_tea Index

25. [ ] done >> User Story 25, Teahouse Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Teahouse Index

26. [ ] done >> User Story 26, Teahouse Boba_tea Index Link

As a visitor
When I visit a teahouse show page ('/teahouses/:id')
Then I see a link to take me to that teahouse's `boba_tea_table_name` page ('/teahouses/:id/boba_tea_table_name')
Usability functionality will be reviewed at your second check-in

Extensions
27. [ ] done >> User Story 27, Search by name (exact match)

As a visitor
When I visit an index page ('/teahouses') or ('/boba_tea_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page

28. [ ] done >> User Story 28, Search by name (partial match)

As a visitor
When I visit an index page ('/teahouses') or ('/boba_tea_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
## MANY TO MANY USER STORIES 
```
```
## Apply for Tea(s)

Visitors to the site will be able to create applications to inquire about Teas. An application has many Teas. Teas can have many applications.
```
```
1. [ ] done >> Application Show Page

As a visitor
When I visit an applications show page
Then I can see the following:
- Name of the Applicant
- Full Address of the Applicant including street address, city, state, and zip code
- Description of why the applicant says they'd be a good home for this Tea(s)
- names of all Teas that this application is for (all names of Teas should be links to their show page)
- The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"

2.  [ ] done >> Starting an Application

As a visitor
When I visit the Tea index page
Then I see a link to "Start an Application"
When I click this link
Then I am taken to the new application page where I see a form
When I fill in this form with my:
  - Name
  - Street Address
  - City
  - State
  - Zip Code
  - Conditions you’d like to heal with the Tea(s)
And I click submit
Then I am taken to the new application's show page
And I see my Name, address information, and description of why I would make a good home
And I see an indicator that this application is "In Progress"

3.  [ ] done >>  Starting an Application, Form not Completed

As a visitor
When I visit the new application page
And I fail to fill in any of the form fields
And I click submit
Then I am taken back to the new applications page
And I see a message that I must fill in those fields.

4.  [ ] done >>  Searching for Teas for an Application

As a visitor
When I visit an application's show page
And that application has not been submitted,
Then I see a section on the page to "Add a Tea to this Application"
In that section I see an input where I can search for Teas by name
When I fill in this field with a Tea's name
And I click submit,
Then I am taken back to the application show page
And under the search bar I see any Tea whose name matches my search

5.  [ ] done >>  Add a Tea to an Application

As a visitor
When I visit an application's show page
And I search for a Tea by name
And I see the names Teas that match my search
Then next to each Tea's name I see a button to "Inquire about this Tea"
When I click one of these buttons
Then I am taken back to the application show page
And I see the Tea I want to inquire about listed on this application

6.  [ ] done >>  Submit an Application

As a visitor
When I visit an application's show page
And I have added one or more Teas to the application
Then I see a section to submit my application
And in that section I see an input to enter why I would make a good owner for these Tea(s)
When I fill in that input
And I click a button to submit this application
Then I am taken back to the application's show page
And I see an indicator that the application is "Pending"
And I see all the Teas that I want to adopt
And I do not see a section to add more Teas to this application

7.  [ ] done >> No Teas on an Application

As a visitor
When I visit an application's show page
And I have not added any Teas to the application
Then I do not see a section to submit my application

8.  [ ] done >> Partial Matches for Tea Names

As a visitor
When I visit an application show page
And I search for Teas by name
Then I see any Tea whose name PARTIALLY matches my search
For example, if I search for "fluff", my search would match Teas with names "fluffy", "fluff", and "mr. fluff"

9.  [ ] done >> Case Insensitive Matches for Tea Names

As a visitor
When I visit an application show page
And I search for Teas by name
Then my search is case insensitive
For example, if I search for "fluff", my search would match Teas with names "Fluffy", "FLUFF", and "Mr. FlUfF"
```
```
## Approving Applications

Teas on an application can either be accepted or rejected. Once all Teas on an application have been marked either accepted or rejected, then the application is no longer "Pending". If all the Teas were accepted, then the application is "Accepted". If one or more Teas on the application is rejected, then the entire application is "Rejected".

For this set of stories, we will be making routes that begin with '/admin'. This is to indicate that only a user with special privileges should be able to accept or reject Teas on an application. Normally, we would want to make sure that a user is logged into an admin account before being able complete any of this workflow, but we will not add any log in or authorization functionality to this project.
```
```
10. [ ] done >> Approving a Tea for Purchase

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every Tea that the application is for, I see a button to approve the application for that specific Tea
When I click that button
Then I'm taken back to the admin application show page
And next to the Tea that I approved, I do not see a button to approve this Tea
And instead I see an indicator next to the Tea that they have been approved

11. [ ] done >> Rejecting a Tea for Purchase

As a visitor
When I visit an admin application show page ('/admin/applications/:id')
For every Tea that the application is for, I see a button to reject the application for that specific Tea
When I click that button
Then I'm taken back to the admin application show page
And next to the Tea that I rejected, I do not see a button to approve or reject this Tea
And instead I see an indicator next to the Tea that they have been rejected

12. [ ] done >> Approved/Rejected Teas on one Application do not affect other Applications

As a visitor
When there are two applications in the system for the same Tea
When I visit the admin application show page for one of the applications
And I approve or reject the Tea for that application
When I visit the other application's admin show page
Then I do not see that the Tea has been accepted or rejected for that application
And instead I see buttons to approve or reject the Tea for this specific application

13. [ ] done >>  All Teas Accepted on an Application

As a visitor
When I visit an admin application show page
And I approve all Teas for an application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Approved"

14. [ ] done >> One or More Teas Rejected on an Application

As a visitor
When I visit an admin application show page
And I reject one or more Teas for the application
And I approve all other Teas on the application
Then I am taken back to the admin application show page
And I see the application's status has changed to "Rejected"

15. [ ] done >>  Application Approval makes Teas not purchasable

As a visitor
When I visit an admin application show page
And I approve all Teas on the application
And when I visit the show pages for those Teas
Then I see that those Teas are no longer "purchasable"

16. [ ] done >>  Teas can only have one approved application on them at any time

As a visitor
When a Tea has an "Approved" application on them
And when the Tea has a "Pending" application on them
And I visit the admin application show page for the pending application
Then next to the Tea I do not see a button to approve them
And instead I see a message that this Tea has been approved for Purchase
And I do see a button to reject them
```
```
## Admin Teahouse Views

These stories build out admin views for Teahouses. They will emphasize SQL and ActiveRecord concepts.
### SQL Only

For the following stories, you should write your queries in raw sql. 
You can use the [ActiveRecord find_by_sql](https://guides.rubyonrails.org/active_record_querying.html#finding-by-sql) method to execute raw sql queries.

```
```
17. [ ] done >>  Admin Teahouses Index

As a visitor
When I visit the admin Teahouse index ('/admin/Teahouses')
Then I see all Teahouses in the system listed in reverse alphabetical order by name

18. [ ] done >> Admin Teahouses Show Page

As a visitor
When I visit an admin Teahouse show page
Then I see that Teahouse's name and full address

NOTE: Your query should only return the necessary data to complete the story
```
```
### ActiveRecord

For the following stories, you should fully leverage ActiveRecord methods in your queries.
```
```
19. [ ] done >> Teahouses with Pending Applications

As a visitor
When I visit the admin Teahouse index ('/admin/Teahouses')
Then I see a section for "Teahouse's with Pending Applications"
And in this section I see the name of every Teahouse that has a pending application

20. [ ] done >>  Teahouses with Pending Applications Listed Alphabetically

As a visitor
When I visit the admin Teahouse index ('/admin/Teahouses')
And I look in the section for Teahouses with pending applications
Then I see all those Teahouses are listed alphabetically

21. [ ] done >> Admin Teahouses Show Page Links

As a visitor
When I visit the admin Teahouse index ('/admin/Teahouses')
Then I see that every Teahouse name is a link
When I click one of these links
Then I am taken to that Teahouse's admin show page

22. [ ] done >>  Average Tea Strength

As a visitor
When I visit an admin Teahouse show page
Then I see a section for statistics
And in that section I see the average strength of all purchasable Teas for that Teahouse

23. [ ] done >> Count of Purchasable Teas

As a visitor
When I visit an admin Teahouse show page
Then I see a section for statistics
And in that section I see the number of Teas at that Teahouse that are purchasable

24. [ ] done >>  Count of Teas that have been Adopted

As a visitor
When I visit an admin Teahouse show page
Then I see a section for statistics
And in that section I see the number of Teas that have been adopted from that Teahouse

Note: A Tea has been adopted from a Teahouse if they are part of an approved application
```

```
25. [ ] done >>  Action Required

As a visitor
When I visit an admin Teahouse show page
Then I see a section titled "Action Required"
In that section, I see a list of all Teas for this Teahouse that have a pending application and have not yet been marked "approved" or "rejected"

26. [ ] done >>  Action Required Links to Application Show Page

As a visitor
When I visit an admin Teahouse show page
And I look in the "Action Required" section
Then next to each Tea's name I see a link to the admin application show page where I can accept or reject the Tea.
```
```
## Extensions
### ActiveRecord Extensions

27. Refactor your code to make use of [ActiveRecord callbacks](https://guides.rubyonrails.org/active_record_callbacks.html)
28. Refactor your code to make use of [ActiveRecord Scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes)
### Styling

Implement a CSS Grid Framework to improve your styling, either [CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout) or [Bootstrap](https://getbootstrap.com/)
