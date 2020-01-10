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
  cart_with_coupons = []
  cart_i = 0
  while cart_i < cart.length do
    coupon_i = 0
    working_item = cart[cart_i][:item]
    while coupon_i < coupons.length do
      working_coupon = coupons[coupon_i][:item]
      if working_coupon == working_item
        cart_with_coupons << coupons[coupon_i]
      else
        cart_with_coupons << cart[cart_i]
      coupon_i += 1
    end
    cart_i += 1
  end
  pp cart_with_coupons
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
