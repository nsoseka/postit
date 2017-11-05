

=begin

	1. why do they call it a relational database?
		A relational database is named as such because it provides a means by which attributes (columns)
		in one table can be joined/related to attributes (columns) in another through the use of foreign keys.

	2. What is SQL
		Structured Query Language

	3. There are two predominant views into a relational database.
	 	 What are they, and how are they different?

	 	 Schema view, provides a structure of the database configuration,
	 	 including tables, views, stored procedures.

	 	 - Data view, displays the actual content in the schema,
	
	4. In a table, what do we call the column that serves as the main identifier for a row of data?
	   We're looking for the general database term, not the column name.

	   the primary key column.

	5. What is a foreign key, and how is it used?	
		Foreign keys are used to referene rows of data in another table.
		They usually contain the value of the referenced rows primary key.
		They provide the a relationship between two tables

	6. At a high level, describe the ActiveRecord pattern. This has nothing to do with Rails, 
		but the actual pattern that ActiveRecord uses to perform its ORM duties.

		An Object Relational Mapper, maps every row of data in table to an object where
		each column corresponds to an attribute in the object.
	
	7. If there's an ActiveRecord model called "CrazyMonkey", what should the table name be?
	 "CrazyMonkey".tableize => crazy_monkeys;

	8. If I'm building a 1:M association between Project and Issue, 
	what will the model associations and foreign key be?

		class Project < ActiveRecord::Base
			has_many: issues
		end

		class Issue < ActiveRecord::Base
			belongs_to :project, foreign_key: :project_id
		end

	9. Given this code
		class Zoo < ActiveRecord::Base
		 	  has_many :animals
		end

	- What do you expect the other model to be and what does database schema look like?

		class Animal < ActiveRecord::Base
			belongs_to :zoo, foreign_key: :zoo_id
		end

		DB Schema

		table animals
		id, Integer

		table zoos
		id, Integer
		animal_id, Integer, fk_key

	- What are the methods that are now available to a zoo to call related to animals?

		Zoo#animals.empty?, Zoo#animals.size, Zoo#animals, Zoo#animals<<(animal), 
		Zoo#animals.delete(animal), Zoo#animals.destroy(animal), 
		Zoo#animals.find(animal_id), Zoo#animals.build, Zoo#animals.create


	- How do I create an animal called "jumpster" in a zoo called "San Diego Zoo"?

		animal = Animal.create('jumpster')

		zoo = Zoo.all.where({ name: 'San Diego Zoo' }).

10. What is mass assignment? What's the non-mass assignment way of setting values?

	Mass assignment basically allows creation of a record from a hash;
	by setting many values all at once

	example
	user = {"name": 'Isaac', "number": 233, "code": "baddest"}
	inide the ActiveRecord Model User
	User.create(user)


	Non-mass assignment
	Here we set values, separately by providing them as arguments to the new method, or create method

	example
	User.create(name: "Isaac", number: 233, code: "baddest")



11. Suppose Animal is an ActiveRecord model. What does this code do? Animal.first

	it orders the table and then returns the first record in the Animal model

12. If I have a table called "animals" with a column called "name", and a model called Animal, 
how do I instantiate an animal object with name set to "Joe". Which methods makes sure it saves to the database?

	1. Method 1
		Animal.create(name: 'Joe');

	2. Method 2

		Animal.new(name: 'Joe')
		Animal.save()

13. How does a M:M association work at the database level?
	It creates a join table with two foreign keys from each of the tables in the M:M

	These two foreign keys allow each permutation of the primary keys in the tables to produce
	unique identifications when combined for each row of data. Most join tables rather
	prefer to use a unique id primary key column as their identifier

14. What are the two ways to support a M:M association at the ActiveRecord model level? 
Pros and cons of each approach?

	1. has_and_belongs_to_many

	Pros
		No need for a join model
	Cons
		Since we have no join model, we cannot add attributes to the join table

	2. has_many :through

	Pros
		We have a join model upon which we can add attributes
	Cons
		You have to create a join table

15. Suppose we have a User model and a Group model, 
and we have a M:M association all set up. How do we associate the two?
	
	Using the has_many :through association
	create table user_groups and join model UserGroup

	Class User < ActiveRecord::Base
		has_many :user_groups
		has_many :groups, through: :user_groups
	end

	Class Group < ActiveRecord::Base
		has_many :user_groups
		has_many :users, through: :user_groups
	end

	Class UserGroup < ActiveRecord::Base
		belongs_to :users, :groups
	end

=end

