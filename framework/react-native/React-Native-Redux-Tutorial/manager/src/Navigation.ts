import { createSwitchNavigator, createStackNavigator } from 'react-navigation';
import LoginForm from './components/LoginForm';
import EmployeeList from './components/EmployeeList'
import EmployeeCreate from './components/EmployeeCreate'
import EmployeeEdit from './components/EmployeeEdit'

const StackNavigator = createStackNavigator({
  EmployeeList: {
    screen: EmployeeList,
  },
  EmployeeCreate: {
    screen: EmployeeCreate,
  },
  EmployeeEdit: {
    screen: EmployeeEdit,
  }
});

const Navigation = createSwitchNavigator({
  Login: {
    screen: LoginForm,
  },
  EmployeeList: {
    screen: StackNavigator
  }
})


export default Navigation;