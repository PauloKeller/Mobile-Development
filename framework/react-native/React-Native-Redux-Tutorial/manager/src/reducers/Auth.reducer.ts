import {
  EMAIL_CHANGED,
  PASSWORD_CHANGED,
  LOGIN_SUCCESS,
  LOGIN_FAIL,
  LOGIN_LOADING,
} from '../actions/types'

const INITIAL_STATE = {
  email: '',
  password: '',
  user: null,
  error: '',
  loading: false,
}

export default (state = INITIAL_STATE, action: any) => {
  switch (action.type) {
    case EMAIL_CHANGED:
      return { ...state, email: action.payload }
    case PASSWORD_CHANGED:
      return { ...state, password: action.payload }
    case LOGIN_SUCCESS:
      return {
        ...state,
        ...INITIAL_STATE,
        user: action.payload,
      }
    case LOGIN_FAIL:
      return { ...state, error: 'Authentication Failed.', loading: false }
    case LOGIN_LOADING:
      return { ...state, loading: true, error: '' }
    default:
      return state
  }
}
