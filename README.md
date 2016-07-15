# Hair Salon :haircut:

This app allows a user to set up a database of hairstylists and clients using Ruby and PostgreSQL.

## User Stories
* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

## Creating a database for this app in PostgreSQL

    CREATE DATABASE hair_salon;
    CREATE TABLE stylists (id serial PRIMARY KEY, name varchar)
    CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int)

## Installation

Clone this repository from https://github.com/stok0102/hair_salon


## Contributing

1. Fork
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Credits

By Caleb Stokka

## License

MIT License. Copyright &copy; 2016 "Caleb Stokka
