import React from 'react'
import { View, StyleSheet } from 'react-native'

interface Props {
  children?: any
  style?: any
}

const CardSection: React.SFC<Props> = props => {
  return <View style={[style.containerStyle, props.style]}>{props.children}</View>
}

const style = StyleSheet.create({
  containerStyle: {
    borderBottomWidth: 1,
    padding: 5,
    backgroundColor: '#fff',
    justifyContent: 'flex-start',
    flexDirection: 'row',
    borderColor: '#ddd',
    position: 'relative',
  },
})

export { CardSection }
