import React, { Component} from 'react';
import { Text, TouchableWithoutFeedback, View, ActionSheetIOS } from 'react-native';
import { CardSection } from './common';
import NavigationService from '../NavigationService';

class ListItem extends Component {
  onRowPress() {
    NavigationService.navigate('EmployeeEdit', { employee: this.props.employee });
  }

  render() {
    const { name } = this.props.employee;

    return (
      <TouchableWithoutFeedback onPress={this.onRowPress.bind(this)}>
        <View>
          <CardSection>
            <Text style={styles.titleStyle}>
              {name}
            </Text>
          </CardSection>
        </View>
      </TouchableWithoutFeedback>
    );
  }
}

const styles = {
  titleStyle: {
    fontSize: 18,
    paddingLeft: 15
  }
};

export default ListItem;