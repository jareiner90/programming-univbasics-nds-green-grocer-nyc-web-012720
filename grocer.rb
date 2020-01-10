def find_item_by_name_in_collection(name, collection)

  i = 0
  while i < collection.length do
    item = collection[i][:item]
    if name != item
      nil
    else
      return collection[i]
    end
    i += 1
  end
end

def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.length do
    name = cart[i][:item]
    working_item = find_item_by_name_in_collection(name, new_cart)

    if working_item
      working_item[:count] += 1
    else
      new_item = {
        :item => name,
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      new_cart << new_item
    end
    i += 1
  end
  new_cart
end

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.length
    name = coupons[i][:item]
    cart_item = find_item_by_name_in_collection(name, cart)
    
    coupon_item_name = "#{name} W/COUPON"
    
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
    
    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[i] -= coupons[i][:num]
      else 
        cart_item_with_coupon = {
          :item => coupon_item_name
          :price => coupons[i][:cost]
        }
    end
    i += 1
  end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
