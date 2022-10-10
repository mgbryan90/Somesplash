# Models generator

Category Model

```ruby
rails g model Category name:string:uniq description:text photos_count:integer

```

Photo Model

```rb
rails g model Photo title:string:uniq description:text category:references comments_count:integer

```

Comment Model

```rb
rails generate model Comment body:text
```

## Some additional migrations

Migration to create the polymorphic association

```rb
rails generate migration AddCommentableToCritics commentable:references{polymorphic}
```

Migration Active Storage

```rb
rails active_storage:install
```

# Controllers and view

Generate Categories Controller and views

```rb
rails generate controller Categories index new create show edit update destroy --skip-routes
```

Generate Photos Controller and views

```
rails generate controller Photos index new create edit show update destroy --skip-routes
```
