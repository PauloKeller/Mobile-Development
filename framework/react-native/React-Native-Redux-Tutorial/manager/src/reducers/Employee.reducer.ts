import {
  EMPLOYEES_FETCH_SUCCESS,
  EMPLOYEE_SAVE_SUCCESS,
} from '../actions/types';

const INITIAL_STATE = {};

export default (state = INITIAL_STATE, action) => {
  switch(action.type) {
    case EMPLOYEES_FETCH_SUCCESS:
      return action.payload;
    case EMPLOYEE_SAVE_SUCCESS:
      return INITIAL_STATE;
    default:
      return state;
  }
};

