## Model

This is my design for the seller problem. In my schema I have sellers, products, and purchases. I relate sellers to purchases through products, like so: 

```
class Seller < ActiveRecord::Base
  has_many :products
  has_many :purchases, through: :products
end
```

That way, the `Seller` class can easily access the purchases, by calling `Seller.purchases.all`. `Purchase` belongs to `Product` and `User`. I didn't make a migration for `User` (just the user buying the product), as that is out of the scope of this problem.

The `Purchase` model does not have a price, instead relating that off the `Product` it's attached to. 

As for doing balance increases/decreases, I would have a `Balance` class that belongs to the seller. It would have a class within itself called `Payout` that would be an archive of the payouts. That way you easily keep track of payouts, and also keep track of total amount sold (which Gumroad already does). Every purchase made would be added to the current Payout. 

A refund that has been confirmed would remove the purchase from the Payout, which would trigger a refund for the user. 

The payout could be its own class, detatched from the database (using something like Resque). You could set an interval of payment for the seller and then it would automatically pay each seller out from the Payout class. 

