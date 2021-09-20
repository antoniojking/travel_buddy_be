# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
GET       | `/api/v1/users/{user_id}` | Get a single user. | [Link](#get-one-user)
POST      | `/api/v1/users`           | Find or create user. | [Link](#find-or-create-user)
GET       | `/api/v1/users/{user_id}/friendships` | Find all user friendships. | [Link](#get-user-friendships)
POST      | `/api/v1/users/{user_id}/friendships` | Add a friend to user friendships. | [Link](#create-user-friendship)
GET       | `/api/v1/trips/{trip_id}` | Get a single trip. | [Link](#get-one-trip)
POST      | `/api/v1/trips` | Add a trip to user trips. | [Link](#create-user-trip)
PATCH      | `/api/v1/trips` | Add a trip to user trips. | [Link](#create-user-trip)
GET       | `/api/v1/trips/{trip_id}/accommodations` | Find all checklists with checklist items for a trip | [Link](#)
POST      | `/api/v1/trips/{trip_id}/accommodations` | Add a checklists to a trip | [Link](#)
GET       | `/api/v1/trips/{trip_id}/travel_buddies` | Find all trip travel buddies | [Link](#get-trip-travel-buddies)
POST      | `/api/v1/trips/{trip_id}/travel_buddies` | Add a travel buddy to a trip | [Link](#create-trip-travel-buddy)
GET       | `/api/v1/trips/{trip_id}/checklists` | Find all checklists with checklist items for a trip | [Link](#get-trip-checklists)
POST      | `/api/v1/trips/{trip_id}/checklists` | Add a checklists to a trip | [Link](#create-trip-checklist)
POST      | `/api/v1/trips/{trip_id}/checklists/{checklist_id}/checklist_items` | Add a checklist item to a checklist | [Link](#create-checklist-item)
GET       | `/api/v1/parks?state='WY'` | Find all NP's by state | [Link](#get-parks-by-state)
GET       | `/api/v1/parks?activity='Fishing'` | Find all NP's by activity | [Link](#get-parks-by-state)
GET       | `/api/v1/parks/{park_code}` | Get a NP by the park_code  | [Link](#get-park-by-parkcode)
GET       | `/api/v1/weather?location='Estes Park'&days=2` | Get current and forecast temps for specific location | [Link](#get-weather)

NEED ADDED
PATCH for all
DESTROY for some
---

# Get One User

Returns a user and their attributes.

```
GET /api/v1/users/{user_id}
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/users/2
```

## Example Response

```
Status: 200 OK
```

```
Example 1:

{
  "data":
    {
      "id": "2",
      "type": "user",
      "attributes": {
        "email": "email@email.com",
        "authorization_token": "alskjfhadlskjfh9823y489",
        "refresh_token": "2398rcbjwiuf834hf",
        "trips": [
          { "id": "17",
            "start_date": "2021-11-19T00:00:00.000Z",
            "end_date": "2021-11-22T00:00:00.000Z",
            "park_code": "grte",
            "name": "Graduation Trip 2021",
            "user_id": "2",
            "created_at": "2021-09-17T19:21:31.191Z",
            "updated_at": "2021-09-17T19:21:31.191Z",
          },
          { "id": "19",
            "start_date": "2021-12-19T00:00:00.000Z",
            "end_date": "2021-12-26T00:00:00.000Z",
            "park_code": "grte",
            "name": "Christmas 2021",
            "user_id": "12",
            "created_at": "2021-09-17T19:21:31.191Z",
            "updated_at": "2021-09-17T19:21:31.191Z",
          }]
        "friends": [
          { "id": "12",
            "authorization_token": "alskjfhadlskfesfjfh9823y489",
            "refresh_token": "2398rcbjwiuf8dsfe34hf",
            "email": "test@email.com",
            "created_at": "2021-09-17T19:21:31.191Z",
            "updated_at": "2021-09-17T19:21:31.191Z",
          },
          { "id": "13",
            "authorization_token": "alskjfhaddsfelskjfh9823y489",
            "refresh_token": "2398rcbjwiuf83dfe4hf",
            "email": "another@email.com",
            "created_at": "2021-09-17T19:21:31.191Z",
            "updated_at": "2021-09-17T19:21:31.191Z",
          }]
      }
    }
}
```

---
# Find Or Create User

Finds an existing user and updated tokens or creates a new user with the give attributes.

```
POST /api/v1/users
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`email` | String | The users email
`authorization_token` | String | The users authorization token
`refresh_token` | String | The users refresh token

Notes:
-

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/v1/users
```

With the following example request body:

```
{
  "email": "email@email.com",
  "authorization_token": "lkj429jspfa302f",
  "refresh_token": "2jlkfao3402as42",
  "merchant_id": 43
}
```

### Example Responses

If the user does not exist:

```
Status: 201 Created
```

```
{
  "data": {
    "id": "24",
    "type": "user",
    "attributes":
     {"email":"test@test.com",
      "authorization_token":"109283yyrbadso8734gr",
      "refresh_token":"qp398cbqwiobc983q4yfkajbsv",
      "trips":[],
      "friends":[]}
      }
    }
```

If the user already exists:

```
Status: 201 OK
```

```
{
  "data": {
    "id": "24",
    "type": "user",
    "attributes":
     {"email":"test@test.com",
      "authorization_token":"109283yyrbadso8734gr",
      "refresh_token":"qp398cbqwiobc983q4yfkajbsv",
      "trips":[],
      "friends":[]}
      }
    }
```
---
# Get User Friendships

Return a users friendships.

```
GET /api/v1/users/{user_id}/friendships
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`user_id`   | Integer | Path | Required | The ID of the user

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/users/2/friendships
```

## Example Response

```
Status: 200 OK
```

```
Example:
  {
    "data":
    [{"id":31,
    "type":"User Email",
    "attributes":
    {email:"desiree@marks-hackett.org"}
    },
    {"id":33,
    "type":"User Email",
    "attributes":
    {email:"sona@hills-kerluke.com"}
    }]
  }
```

---
# Create User Friendship

Creates a new user friendship with given attributes.

```
GET /api/v1/users/{user_id}/friendships
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`friend_id` | Integer | The friends user id

Notes:
- The friend_id but be an existing user_id

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/v1/users/2/friendships
```
With the following example request body:

```
{
  "friend_id": 12,
}
```

## Example Response

```
Status: 201 Created
```

```
Example:
  {
    "data":
    {"id":"11",
    "type":"friendship",
    "attributes":
    {"user_id":34,
    "friend_id":12}
    }
  }
```
---
# Get One Trip

Return a trip and all its attributes.

```
GET /api/v1/trips/{trip_id}
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`trip_id`   | Integer | Path | Required | The trip ID

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/trip/10
```

## Example Response

```
Status: 200 OK
```

```
Example:
{:data=>
  {:id=>"2",
   :type=>"trip",
   :attributes=>
    {:name=>"Teton National Park",
     :start_date=>"2021-11-18T00:00:00.000Z",
     :end_date=>"2021-11-22T00:00:00.000Z",
     :park_code=>"grte",
     :park_name=>"Rakaposhi-Haramosh Karakoram",
     :checklists=>
      [{:id=>1, :trip_id=>2, :category=>"Belly Pub", :created_at=>"2021-09-19T22:22:37.068Z", :updated_at=>"2021-09-19T22:22:37.068Z"},
       {:id=>2, :trip_id=>2, :category=>"Blue Burger", :created_at=>"2021-09-19T22:22:37.071Z", :updated_at=>"2021-09-19T22:22:37.071Z"}],
     :users=>
      [{:id=>1,
        :token=>"alskjfhadlskjfh9823y489",
        :refresh_token=>"2398rcbjwiuf834hf",
        :email=>"frederic_lehner@casper.info",
        :created_at=>"2021-09-19T22:22:37.029Z",
        :updated_at=>"2021-09-19T22:22:37.029Z",
        :spotify_id=>"asljkbadskjfba"},
       {:id=>2,
        :token=>"alskjfhadlskjfh9823y489",
        :refresh_token=>"2398rcbjwiuf834hf",
        :email=>"scottie_schultz@reichel.net",
        :created_at=>"2021-09-19T22:22:37.035Z",
        :updated_at=>"2021-09-19T22:22:37.035Z",
        :spotify_id=>"asljkbadskjfba"}]}}}```

---
# Create User Trip

Creates a new user trip with given attributes.

```
POST /api/v1/trips
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`start_date` | Integer | The friends user id
`end_date` | Integer | The friends user id
`park_code` | String | The friends user id
`name` | String | The friends user id

Notes:
-

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/trips
```
With the following example request body:

```
{
  start_date: DateTime.new(2021, 11, 18),
  end_date: DateTime.new(2021, 12, 18),
  park_code: 'grte',
  name: 'Graduation Teton Trip'
}
```

## Example Response

```
Status: 201 Created
```

```
Example:
  {"data":
    {"id":"36",
     "type":"trip",
     "attributes":
      {"name":"Graduation Teton Trip",
       "start_date":"2021-11-18T00:00:00.000Z",
       "end_date":"2021-12-18T00:00:00.000Z",
       "park_code":"grte"}
       }}
```
---
# Get Trip Travel Buddies

Returns a trips travel buddies.

```
GET /api/v1/trips/{trip_id}/travel_buddies
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`trip_id`   | Integer | Path | Required | The ID of the trip

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/trip/2/travel_buddies
```

## Example Response

```
Status: 200 OK
```

```
Example:
  {"data":
    [{"id":43,
      "type":"User Email",
      "attributes":
      {"email":"cathey.schulist@walter-reichel.net"}
      },
     {"id":44,
      "type":"User Email",
      "attributes":
      {"email":"markita.jacobi@welch.io"}
    }]
  }
```

---
# Create Trip Travel Buddy

Creates a travel buddy for a trip.

```
POST /api/v1/trips/{trip_id}/travel_buddies
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`user_id` | Integer | The new travel buddy user id

Notes:
-

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/trips/39/travel_buddies
```
With the following example request body:

```
{
  user_id: 47
}
```

## Example Response

```
Status: 201 Created
```

```
Example:
  {"data":
    {"id":"35",
    "type":"travel_buddy",
    "attributes":
      {"user_id":47,
      "trip_id":39}
    }
  }
```
---
# Get Trip Checklists

Returns a trips checklists and the checklist items .

```
GET /api/v1/trips/{trip_id}/checklists
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`trip_id`   | Integer | Path | Required | The ID of the trip

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/trip/2/checklists
```

## Example Response

```
Status: 200 OK
```

```
Example:
  {"data":
   [{"id":"16",
     "type":"checklist",
     "attributes":
       {"category":"Sugar House",
       "item_count":0,
       "items":[]}},
    {"id":"17",
    "type":"checklist",
    "attributes":
      {"category":"Big Dragon",
      "item_count":0,
      "items":[]}},
    {"id":"18",
      "type":"checklist",
      "attributes":
        {"category":"Belly Curry",
        "item_count":0,
        "items":[]}}
    ]
  }

```
---
# Create Trip Checklist

Creates a new checklist for a trip.

```
POST /api/v1/trips/{trip_id}/checklists
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`category` | String | New category name

Notes:
-

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/trips/39/checklists
```
With the following example request body:

```
{
  category: 'Camping Gear'
}
```

## Example Response

```
Status: 201 Created
```

```
Example:
  {"data":
    {"id":"35",
    "type":"checklist",
    "attributes":
      {"category":"Camping Gear"}
    }
  }
```
---

# Create Checklist Item

Creates a new checklist item for a checklist.

```
POST /api/v1/trips/{trip_id}/checklists/{checklist_id}/checklist_items
```

## Request Body

Attribute Name| Data Type | Description
--------------|-----------|------------
`name` | String | New checklist item name
`user_id` | Integer | User ID of who is in charge of the item

Notes:
-

## Example Request

```
POST https://travel-buddy-api.herokuapp.com/api/trips/39/checklists/16/checklist_items
```
With the following example request body:

```
{
  name: 'Sleeping Bag'
  user_id: 12
}
```

## Example Response

```
Status: 201 Created
```

```
Example:
  {"data":
    {"id":"35",
    "type":"checklist_item",
    "attributes":
      {"name":"Sleeping Bag",
      "user_id":12}
    }
  }
```
---
# Get Parks by State

Returns all National Parks by state.

```
GET /api/v1/parks?state='WY'
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`state`   | String | params | Required | The abbreviated state name

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/parks?state='WY'
```

## Example Response

```
Status: 200 OK
```

```
Example:
{data=>
  [{"id":"bica",
    "type":"park",
    "attributes":
     {"name":"Bighorn Canyon National Recreation Area",
      "description":
       "The vast, wild landscape of Bighorn Canyon National Recreation Area offers visitors unparalleled opportunities to immerse themselves in the natural world, and experience the wonders of this extraordinary place. With over 120,000 acres, one can find an astounding diversity in ecosystems, wildlife, and more than 10,000 years of human history to explore.",
      "activities":
       [{"id":"09DF0950-D319-4557-A57E-04CD2F63FF42",
          "name":"Arts and Culture"},
        {"id":"CE84DEFA-D692-4165-96DF-D5FF56002E2F",
          "name":"Theater"},
        {"id":"D37A0003-8317-4F04-8FB0-4CF0A272E195",
          "name":"Stargazing"},
        {"id":"7CE6E935-F839-4FEC-A63E-052B1DEF39D2",
          "name":"Biking"},
        {"id":"467DC8B8-0B7D-436D-A026-80A22358F615",
          "name":"Bookstore and Park Store"}],
      "contacts":
       {"phoneNumbers":
       [{"phoneNumber":"3075485406",
         "description":"",
         "extension":"",
         "type":"Voice"}],
        "emailAddresses":
        [{"description":"",
          "emailAddress":"BICA_media@nps.gov"}]},
      "directions":
       "Bighorn Canyon has two districts that are separated by a three hour drive. To get to the North District at Fort Smith, MT from Billings,take Interstate 90 south to Hardin, MT. Turn at exit 495 onto State Highway 313 to St. Xavier and then to Fort Smith, Montana. To get to the South District at Lovell, WY from Billings, MT, take Interstate 90 west. Turn at exit 434 at Laurel, MT. Turn onto US 310 East/US 212 South. Turn at US 310 East to Lovell. The visitor center is on the east side of Lovell.",
      "operating_hours":
       [{"exceptions":[],
         "description":
          "The park is open every day. \n\nThe Yellowtail Dam visitor center in Fort Smith, MT is only open in the summer from Memorial Day to Labor Day. \n\nThe Cal S. Taggart visitor center in Lovell, WY is open Tuesday - Saturday 8:30 - 4:30 and is closed Sundays and Mondays through the fall.",
         "standardHours":
          {"wednesday":"8:30AM - 4:30PM",
           "monday":"Closed",
           "thursday":"8:30AM - 4:30PM",
           "sunday":"Closed",
           "tuesday":"8:30AM - 4:30PM",
           "friday":"8:30AM - 4:30PM",
           "saturday":"8:30AM - 4:30PM"},
         "name":"Bighorn Canyon National Recreation Area Lovell, WY District"}],
      "images":
       [{"credit":"Sharron Genaux",
         "title":"Yellowtail Dam (Fort Smith, MT District)",
         "altText":"Summer view of the Yellowtail Dam from the Ok-A-Beh road.",
         "caption":"Summer view of the Yellowtail Dam from the Ok-A-Beh road. (Fort Smith, MT District)",
         "url":"https://www.nps.gov/common/uploads/structured_data/3C8210BC-1DD8-B71B-0B15EAD02A4BA4D2.jpg"},
        {"credit":"Pete Sawtell",
         "title":"Spring Cactus",
         "altText":"spring cactus with yellow flowers",
         "caption":"Spring Cactus",
         "url":"https://www.nps.gov/common/uploads/structured_data/3C821240-1DD8-B71B-0B082E247EB28DCB.jpg"},
        {"credit":"Jonathan Welde",
         "title":"Horseshoe Bend from the Sykes Mountain (Lovell, WY District)",
         "altText":"Red hills in the foreground with Bighorn Lake in the background with a brilliant blue sky.",
         "caption":"Horseshoe Bend from the Sykes Mountain (Lovell, WY District)",
         "url":"https://www.nps.gov/common/uploads/structured_data/3C82191F-1DD8-B71B-0B015D06F1310BA3.jpg"}]}},
       }
     ]
   }
```
---
# Get Parks by Activity

Returns all National Parks by activity.

```
GET /api/v1/parks?activity='Fishing'
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`activity`   | String | params | Required | The activity

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/parks?activity='Fishing'
```

## Example Response

```
Status: 200 OK
```

```
Example:
  {"data":
    [{"id":"acad",
      "type":"activity_park",
      "attributes":
        {"name":"Acadia National Park"}
      },
     {"id":"alag",
      "type":"activity_park",   
      "attributes":
        {"name":"Alagnak Wild River"}
      },
     {"id":"alka",
      "type":"activity_park", "attributes":
        {"name":"Ala Kahakai National Historic Trail"}
      },
     {"id":"yuch",
      "type":"activity_park",
      "attributes":
        {"name":"Yukon - Charley Rivers National Preserve"}
      }
    ]
  }
```
---
# Get National Park by parkcode

Returns National Park by parkcode.

```
GET /api/v1/parks/{park_code}
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`park_code`   | String | path | Required | The park's park_code

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/parks/grte
```

## Example Response

```
Status: 200 OK
```

```
Example:

```
---
# Get Weather

Returns current and forecated temps for a specific location and days.

```
GET /api/v1/weather
```

## Parameters

Name        | Data Type | In    | Required/Optional    | Description
------------|---------|-------|----------------------|------------
`location`   | String | params | Required | The location you want get weather
`days`   | Integer | params | Required | The number of days you want forecated weather

Notes:
-

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/weather?location="Estes Parks"&days=2
```

## Example Response

```
Status: 200 OK
```

```
Example:
  {"id":"Estes Park",
    "type":"weather",
    "attributes":
      {"current_temp":89.2,
       "forecast":
          [{"date":"2021-09-17",
          "min_temp":38.5,
          "max_temp":68.4,
          "condition":"Partly cloudy"},
          {"date":"2021-09-18",
          "min_temp":47.5,
          "max_temp":76.1,
          "condition":"Partly cloudy"}],
       "current_conditions":"Sunny"}
  }
```
---
