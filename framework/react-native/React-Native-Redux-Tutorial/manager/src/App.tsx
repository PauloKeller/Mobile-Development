import React, { Component } from 'react'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import firebase from '@firebase/app'
import reducers from './reducers'
import ReduxThunk from 'redux-thunk'
import keys from '../.keys/keys'
import Navigation from './Navigation';
import NavigationService from './NavigationService';

export default class App extends Component {
  componentWillMount() {
    firebase.initializeApp(keys.firebase)
  }

  render() {
    const store = createStore(reducers, {}, applyMiddleware(ReduxThunk))

    return (
      <Provider store={store}>
        <Navigation 
          ref={navigatorRef => {
            NavigationService.setTopLevelNavigator(navigatorRef);
          }}
        />
      </Provider>
    )
  }
}
