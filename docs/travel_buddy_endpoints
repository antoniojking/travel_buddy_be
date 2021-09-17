# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
GET       | `/api/v1/users/{user_id}`   | Get a single user. | [Link](#get-one-user)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)
GET       |          |  | [Link](#)

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
- The user_id should come from the session

## Example Request

```
GET https://travel-buddy-api.herokuapp.com/api/v1/user/2
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

# Find One Item

Get the first item matching the search, by case-sensitive alphabetical order.

```
GET /items/find
```

## Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`name`      | String  | Query | Required (see notes) | Pass a text query to search by an item's name.<br>Minimum Length: 1
`min_price` | Integer/Float | Query | Required (see notes) | Pass a number query to search by an item's minimum price.<br>Minimum Length: 1<br>Must be greater than `0`.
`max_price` | Integer/Float | Query | Required (see notes) | Pass a number query to search by an item's maximum price.<br>Minimum Length: 1<br>Must be greater than `0`.

Notes:
- At least one query parameter must be provided.
- The `name` must be queried on its own and cannot be queried with either `min_price` or `max_price`.
- `min_price` and `max_price` can be queried together to find by price range.

## Example Requests

```
Example 1 - Find by Name:
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/items/find?name=hArU

Example 2 - Find by Minimum Price:
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/items/find?min_price=5.50

Example 3 - Find by Maximum Price:
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/items/find?max_price=99.99

Example 4 - Find by Price Range:
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/items/find?min_price=5.50&max_price=99.99

```

## Example Response

```
Status: 200 OK
```

```
Example 1:
{
  "data": {
    "id": "1209",
    "type": "item",
    "attributes": {
      "name": "Item At Harum",
      "description": "Fuga et aut libero veniam tenetur. Ex eligendi modi libero aut numquam at. Velit dolores non ut cupiditate aut consequatur. Maiores quas vel qui aut et voluptatum. Qui consequatur illo.",
      "unit_price": 841.97,
      "merchant_id": 55
    }
  }
}
```

## Bad Request

```
Status: 400 Bad Request
```

## Resource Not Found

```
Status: 404 Not Found
```


## Validation Failed

```
Status: 422 Unprocessable Entity
```

---

# Find All Merchants

Get the list of merchants matching the search.  The results are sorted by case-sensitive alphabetical order.

```
GET /merchants/find_all
```

## Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`name`      | String  | Query | Required | Pass a text query to search by an merchant's name.<br>Minimum Length: 1

## Example Request

```
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/merchants/find_all?name=ILL
```

## Example Response

```
Status: 200 OK
```

```
{
  "data": [
    {
      "id": "28",
      "type": "merchant",
      "attributes": {
        "name": "Schiller, Barrows and Parker"
      }
    },
    {
      "id": "13",
      "type": "merchant",
      "attributes": {
        "name": "Tillman Group"
      }
    },
    {
      "id": "5",
      "type": "merchant",
      "attributes": {
        "name": "Williamson Group"
      }
    }
  ]
}
```

## Bad Request

```
Status: 400 Bad Request
```

## Resource Not Found

```
Status: 404 Not Found
```

## Validation Failed

```
Status: 422 Unprocessable Entity
```

---

# Find One Merchant

Get the first merchant matching the search, by case-sensitive alphabetical order.

```
GET /merchants/find
```

## Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`name`      | String  | Query | Required | Pass a text query to search by an merchant's name.<br>Minimum Length: 1

## Example Request

```
GET https://rails-engine-scott-borecki.herokuapp.com/api/v1/merchants/find?name=iLl
```

## Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": "28",
    "type": "merchant",
    "attributes": {
      "name": "Schiller, Barrows and Parker"
    }
  }
}
```

## Bad Request

```
Status: 400 Bad Request
```

## Resource Not Found

```
Status: 404 Not Found
```

## Validation Failed

```
Status: 422 Unprocessable Entity
```
