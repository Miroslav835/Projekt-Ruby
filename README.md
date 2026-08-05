# Rezervacni system kina

CRUD aplikace pro správu filmů, promítání, kinosálů a rezervací.

Uživatel může zobrazit seznam filmů, vybrat konkrétní promítání
a vytvořit rezervaci na e-mail. Administrátor může spravovat filmy,
promítání, sály a rezervace.

## Models

- Movie
- Screening
- ScreenRoom
- Reservation

## Technologie

- Ruby 4.0.5
- Ruby on Rails 8.1.3
- MySQL
- HTML/ERB
- CSS

## Instalace

```bash
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails server