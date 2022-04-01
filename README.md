# Portal Experience Team - Software Engineer Quiz

Hello there potential teammate!  With this short quiz we hope to get a sense of how you approach problems and devise solutions.  To that end, we're hoping you'll find the following quiz interesting while not demanding a large time investment.

# Instructions

1. Read through the mock ticket below.
2. [Download][zip] or clone the [official repository][repo].
3. Complete the mock ticket.
4. Zip up your changes using the `./zip_solution.sh` script in the project root
5. Send an email with your zip attached to pe@americanfinancing.net letting us know you've completed the quiz.

**Please note**  In order to keep your local machine clutter free this quiz application has been Dockerized and will require [Docker Desktop][docker-desktop] (or similar) to be installed.

# Project Setup

1. Install [Docker Desktop][docker-desktop] (or similar)
2. `$ ./setup.sh`
3. `$ docker-compose up rails ionic backend-api`

# Mock Ticket

(Written by our Product Owner for maximum authenticity 😉)

## 📄 \[PE-042\] Software Engineer Quiz

### Background:

For the sake of argument and certainly with a need to stretch your
imagination, assume that we work for Open Table rather than the largest
privately held, independent, and best mortgage origination company in metro
Denver.

Here at Denver's Open Tables, we've decided to display a very basic website
built in the following stack:

1. Back-end: Ruby on Rails running in API-only mode, which queries a seperate API maintained by a different team.
2. Front-end: [ReactJS][react] wrapped in the [Ionic][ionic] hybrid framework.
3. Database: PostgreSQL, but it's not currently utilized.
4. Javascript: It's actually [Typescript][typescript]!

As far as users are concerned, this website has the following features:

1. When the page loads, the database is queried and returns the current restaurant data in a table of restaurant names and addresses.
2. Restaurants with currently open tables are displayed on the page; there is no pagination because this application is primarily intended for mobile use.

Unfortunately, the team member who was working on building out this application had to take a leave of absence and left a few things unfinished:

1. While the logic required to query the other team's API is in place at `api/app/services/restaurants_service.rb`, the controller action needed to serve that data to the client app is currently just returning an empty array.
2. In the client application, our missing team member wrote the request logic to get data from the Rails backend managed by our team as well as a `TODO` item to actually retrieve the data when the page loads, but they weren't quite able to finish that up before leaving; it also looks like they didn't quite finish up the Typescript interface needed for a Restaurant object.
3. Similarly, they did add the logic to display the retrieved restaurant data in a table with columns for name and address, but they left this a bit unfinished as well.

### Acceptance Criteria:

1. When the user loads the application, the restaurant data should populate the table and display the names and addresses of all restaurants in the response payload.
2. The data used by the frontend should be requested via a chain of 2 requests, React client -> Rails API -> ultimate backend API managed by another team.

### Additional Notes:

* Browser Support: Current versions of Chrome and Firefox (for simplicity's sake)

[repo]: https://github.com/americanfinancing/pe_engineer/tree/master
[ionic]: https://ionicframework.com/
[react]: https://reactjs.org/
[typescript]: https://www.typescriptlang.org/
[zip]: https://github.com/americanfinancing/pe_engineer/archive/master.zip
[docker-desktop]: https://www.docker.com/products/docker-desktop
