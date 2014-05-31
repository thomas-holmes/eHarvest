eHarvest [![Build Status](https://travis-ci.org/thomas-holmes/eHarvest.svg?branch=master)](https://travis-ci.org/thomas-holmes/eHarvest) [![Code Climate](https://codeclimate.com/github/thomas-holmes/eHarvest.png)](https://codeclimate.com/github/thomas-holmes/eHarvest)
=======

# Setup

Copy config/database.example.yml to config/database.yml and configure with values for your system

album of [http://imgur.com/75NlcRS,jgESCKe,JFGtsmb,rgxYGMP#0](images)

# Relations

User
----

| relation | model |
-----------|--------
| belongs_to | agency |

Agency
-----

| relation | model |
-----------|--------
| has_many | users |
| has_many | orders |
| has_and_belongs_to_many | locations |
| has_and_belongs_to_many | agency_codes |

AgencyCode
----------

| relation | model |
-----------|--------
| has_and_belongs_to_many | agencies |
| has_and_belongs_to_many | item_codes |

Location
--------

| relation | model |
-----------|--------
| has_many | orders |
| has_and_belongs_to_many | agencies |

ItemCode
--------

| relation | model |
-----------|--------
| has_many | items |
| has_and_belongs_to_many | agency_codes |

Item
----
| relation | model |
-----------|--------
| belongs_to | item_code |
| has_many | order_items |

Order
-----

| relation | model |
-----------|--------
| belongs_to | agency |
| belongs_to | location |
| has_many | order_items |

OrderItem
---------

| relation | model |
-----------|--------
| belongs_to | order |
| belongs_to | item |

