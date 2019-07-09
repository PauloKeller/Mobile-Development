import {
  EMAIL_CHANGED,
  LOGIN_SUCCESS,
  PASSWORD_CHANGED,
  LOGIN_FAIL,
  LOGIN_LOADING,
} from './types'
import firebase from '@firebase/app'
import '@firebase/auth'
import NavigationService from '../NavigationService';


export const emailChanged = (email: string) => {
  return {
    type: EMAIL_CHANGED,
    payload: email,
  }
}

export const passwordChanged = (password: string) => {
  return {
    type: PASSWORD_CHANGED,
    payload: password,
  }
}

export const login = (email: string, password: string) => {
  return (dispatch: any) => {
    dispatch({ type: LOGIN_LOADING })
    
    firebase
      .auth()
      .signInWithEmailAndPassword(email, password)
      .then(user => loginSuccess(dispatch, user))
      .catch(() => {
        firebase
          .auth()
          .createUserWithEmailAndPassword(email, password)
          .then(user => loginSuccess(dispatch, user))
          .catch(() => loginFail(dispatch))
      })
  }
}

const loginFail = (dispatch: any) => {
  dispatch({ type: LOGIN_FAIL })
}

const loginSuccess = (dispatch: any, user: object) => {
  dispatch({
    type: LOGIN_SUCCESS,
    payload: user,
  })

  NavigationService.navigate('EmployeeList');
}
