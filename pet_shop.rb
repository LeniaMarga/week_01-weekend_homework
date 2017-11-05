def pet_shop_name(shop_name)
  return shop_name[:name]
end

def total_cash(shop_name)
  return shop_name[:admin][:total_cash]
end

def add_or_remove_cash(shop_name, cash)
  return shop_name[:admin][:total_cash] += cash.to_i
end

def add_or_remove_cash(shop_name, cash)
  return shop_name[:admin][:total_cash] += cash.to_i
end

def pets_sold(shop_name)
  return shop_name[:admin][:pets_sold]
end

def increase_pets_sold(shop_name, number_of_pets_sold)
  return shop_name[:admin][:pets_sold] += number_of_pets_sold.to_i
end

def stock_count(shop_name)
  return shop_name[:pets].length
end

def pets_by_breed(shop_name, breed)
  pets_by_breed = []
  for pet in shop_name[:pets]
    if pet[:breed] == breed
       pets_by_breed.push(pet)
    end
  end
  return pets_by_breed
end

def pets_by_breed(shop_name, breed)
  pets_by_breed = []
  for pet in shop_name[:pets]
    if pet[:breed] == breed
       pets_by_breed.push(pet)
    end
  end
  return pets_by_breed
end

def find_pet_by_name(shop_name, pet_name)
  for pet in shop_name[:pets]
    if pet[:name] == pet_name
    return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop_name, pet_name)
  for pet in shop_name[:pets]
    if pet[:name] == pet_name
       shop_name[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop_name, new_pet)
  shop_name[:pets] << new_pet
  return shop_name[:pets].length
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets]<< new_pet
  return customer[:pets].count
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(customer, shop_name, pet)
  if (customer_can_afford_pet(customer, pet) == true) && (find_pet_by_name(shop_name, pet_name)!= nil)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(shop_name, pet_name)
    stock_count(shop_name)
    customer_pet_count(customer)
    pets_sold(shop_name)
    shop_name[:admin][:pets_sold]+= 1
    shop_name[:admin][:total_cash]+= pet[:price]
  end
end
