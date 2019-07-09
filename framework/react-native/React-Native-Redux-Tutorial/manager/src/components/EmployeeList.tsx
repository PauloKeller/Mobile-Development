import React, { Component } from 'react';
import { connect } from 'react-redux';
import _ from 'lodash';
import { Text, TouchableOpacity, ListView } from 'react-native';
import { employeesFetch } from '../actions';
import ListItem from './ListItem';

class EmployeeList extends Component {
  static navigationOptions = ({navigation}) =>({
    title: 'Employee List',
    headerRight: <TouchableOpacity onPress={() => navigation.navigate('EmployeeCreate')}><Text>Add</Text></TouchableOpacity>	
  });

  componentWillMount() {
    this.props.employeesFetch();

    this.createDataSource(this.props);
  }

  componentWillReceiveProps(nextProps) {
    // nextProps are the next set of props that this component
    // will be rendered with
    // this.props is still the old set of props

    this.createDataSource(nextProps);
  }

  createDataSource({ employees }) {
    const ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2
    });

    this.dataSource = ds.cloneWithRows(employees);
  }

  renderRow(employee) {
    return <ListItem employee={employee} />;
  }

  render() {
    const { navigate } = this.props.navigation;

    return (
      <ListView 
        enableEmptySections
        dataSource={this.dataSource}
        renderRow={this.renderRow}
      />
    )
  }
}

const mapStateToProps = state => {
  const employees = _.map(state.employees, (val, uid) =>{
    return { ...val, uid };
  });

  return { employees };
};

export default connect(mapStateToProps, { employeesFetch })(EmployeeList);
