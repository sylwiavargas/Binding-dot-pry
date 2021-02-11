# Binding.pry

Welcome to Quote Treasure.

```
   Person -----------< Quote
   :name (str)           :content(str)
   :occupation (str)
   :birth(DateTime)
   :death(DateTime)
```

## Get started
1. fork / clone
2. `rake db:migrate`
3. `rake db:seed`

## Functionality

- `Person.all_quotes` - `puts` a list of quotes with their authors, e.g.
"
✨ 'Some quote' - some person

✨ 'Another quote' - another person

"
- `Person#current_age` - `puts` "NAME is currently AGE" or, if the person passed away, "NAME passed away in YEAR, at the age of AGE"

---

