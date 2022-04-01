import React, { useState, useEffect } from 'react';
import { Restaurant } from '../interfaces/RestaurantInterface';

interface RestaurantRowProps {
  restaurant: Restaurant;
}

const RestaurantRow: React.FC<RestaurantRowProps> = (props: RestaurantRowProps) => {
  return (
    <tr>
      <td>{props.restaurant.name}</td>
    </tr>
  );
};

export default RestaurantRow;
