import { combineReducers } from 'redux'
import Auth from './Auth.reducer'
import EmployeeFormReducer from './EmployeeForm.reducer'
import EmployeeReducer from './Employee.reducer'

export default combineReducers({
  auth: Auth,
  employeeForm: EmployeeFormReducer,
  employees: EmployeeReducer,
})
