# Search Endpoints

HTTP Verb | Endpoint              | Description                              | Link
----------|-----------------------|------------------------------------------|---------------------------
GET       | `/api/v1/users/{user_id}` | Get a single user. | [Link](#get-one-user)
POST      | `/api/v1/users`           | Find or create user. | [Link](#find-or-create-user)
GET       | `/api/v1/users/{user_id}/friendships` | Find all user friendships. | [Link](#)
POST      | `/api/v1/users/{user_id}/friendships` | Add a friend to user friendships. | [Link](#)
GET       | `/api/v1/users/{user_id}/trips` | Find all user trips. | [Link](#)
POST      | `/api/v1/users/{user_id}/trips` | Add a trip to user trips. | [Link](#)
GET       | `/api/v1/users/{user_id}/trips/{trip_id}/travel_buddies` | Find all trip travel buddies | [Link](#)
POST      | `/api/v1/users/{user_id}/trips/{trip_id}/travel_buddies` | Add a travel buddy to a trip | [Link](#)
GET       | `/api/v1/users/{user_id}/trips/{trip_id}/checklists` | Find all checklists for a trip | [Link](#)
POST      | `/api/v1/users/{user_id}/trips/{trip_id}/checklists` | Add a checklists to a trip | [Link](#)
GET       | `/api/v1/users/{user_id}/trips/{trip_id}/checklists/{checklist_id}/checklist_items` | Find all checklist items for a checklist | [Link](#)
POST      | `/api/v1/users/{user_id}/trips/{trip_id}/checklists/{checklist_id}/checklist_items` | Add a checklist item to a checklist | [Link](#)
GET       | `/api/v1/parks` |  | [Link](#)
GET       | `/api/v1/parks/{park_code}` |  | [Link](#)
GET       | `/api/v1/weather` |  | [Link](#)
GET       | `/api/v1/` |  | [Link](#)

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
