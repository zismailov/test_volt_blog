# Usage

### Login:

```
$ curl -X POST -d email="email@example.com" -d password="password" http://localhost:3000/auth_user
```

Gets:

```
{"auth_token":"...","user":{"id":1,"email":"email@example.com"}}
```

### Create new post:

```
$ curl -X POST -d "title=titlevalue&body=bodyvalue&published_at=2019-10-20 11:11:11" --header "Authorization: Bearer ..." http://localhost:3000/api/v1/posts.json
```

### Get post by id:

```
$ curl -X GET --header "Authorization: Bearer ..." http://localhost:3000/api/v1/posts/21.json
```

### Show posts:

```
$ curl -X GET --header "Authorization: Bearer ..." http://localhost:3000/api/v1/posts.json -d page=2 -d per_page=5
```

### Generate report:

```
$ curl -X POST -d email="email@example.com" -d start_date="2019-11-11" -d end_date="2020-11-11" --header "Authorization: Bearer ..." http://localhost:3000/api/v1/reports/by_author.json
```
