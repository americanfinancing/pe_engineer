import { useState, useEffect } from 'react';
import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import { Restaurant } from '../interfaces/RestaurantInterface';
import RestaurantRow from '../components/RestaurantRow';
import axios from 'axios';
import './Home.css';

const Home: React.FC = () => {
  const [restaurants, setRestaurants] = useState<[]>([]);

  const endpoint = 'http://localhost:3000/api/v1/restaurants'
  
  const getData = () => {
    return axios.get(endpoint)
      .then(response => {
        return response.data;
      })
  }

  useEffect(() => {
    /*TODO Retrieve data on page load */
  }, []);

  const renderRows = (restaurants: Array<Restaurant>) => {
		return restaurants.map((restaurantData) => 
	    <RestaurantRow restaurant={restaurantData}/>
    )
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Denver's Open Tables</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <table>
          <tr>
            <th>Name</th>
            <th>Address</th>
          </tr>
          {renderRows(restaurants)}
        </table>
      </IonContent>
    </IonPage>
  );
};

export default Home;
