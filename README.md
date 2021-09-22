# Dingo

Dingo is an image repository app a la google photos. Users can upload, view tag and manage images easily with bulk uploads and deletions also available.
<br>  
**features:**

- Password secured user accounts
- Access control: users may only access their own images
- Tagging and indexing of images by tags
- Bulk upload
- Bulk deletion

## Tech

- Authenticaion: []()
- Authorization: [varvet/pundit]()
- Image Storage: [ActiveStorage]()
- Views: [Action View Templates]()
- Style: [Bootstrap 5]()
- Testing: [RSpec]()

## How to install

1. clone repository

```
/code$ git clone https://github.com/SVRourke/dingo
```

2. install the dependencies

```
/code$ cd dingo
/dingo$ bundle install
```

3. set the session_secret

```
/dingo$ export SESSION_SECRET=sadlkfmjsdkfmk34o356oiym67oim3
```

4. Migrate the db.

```
/dingo$ rails db:migrate
```

5. Run the server!

```
rails s
```

## Tests

This project uses [RSpec]() for tests. Running the tests is easy:

```
# model tests
/dingo$ rspec spec/models

# model integration
/dingo$ rspec spec/requests

# All
/dingo$ rspec spec
```
