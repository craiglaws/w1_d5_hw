def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(user)
  return user[:admin][:total_cash]
end


def add_or_remove_cash(user, amount_of_cash)
  user[:admin][:total_cash] += amount_of_cash
end


def pets_sold(user)
  user[:admin][:pets_sold]
end

def increase_pets_sold(user, amount_of_pets)
  user[:admin][:pets_sold] += amount_of_pets
end

def stock_count(user)
  return user[:pets].length
end

def pets_by_breed(user, breed)
  found_pet_breed = []
  for pet in user[:pets]
    if pet[:breed] == breed
      found_pet_breed.push(breed)
    end
  end
  return found_pet_breed
end


def find_pet_by_name(user, name)
  found_pet_name = nil
  for pet in user[:pets]
    if pet[:name] == name
      found_pet_name = pet
    end
  end
  return found_pet_name
end


def remove_pet_by_name(user, name)
  for pet in user[:pets]
    if pet[:name] == name
      user[:pets].delete(pet)
    end
  end
end


def add_pet_to_stock(user, new_pet)
  user[:pets].push(new_pet)
end


def customer_cash(customer_name)
  return customer_name[:cash]
end


def remove_customer_cash(customer_name, amount)
  customer_name[:cash] -= amount
end


def customer_pet_count(customer_name)
  return customer_name[:pets].length
end

def add_pet_to_customer(customer_name, new_pet)
  customer_name[:pets].push(new_pet)
end


def customer_can_afford_pet(customer_name, new_pet)
  if customer_name[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(user, pet, customer)

  if pet != nil
    if pet[:price] <= customer[:cash]

      add_pet_to_customer(customer, pet)

      increase_pets_sold(user, 1)

      remove_customer_cash(customer, pet[:price])

      add_or_remove_cash(user, pet[:price])

    end
    
  end

end
