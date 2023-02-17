import React from 'react'
import { TextInput, View, Text, StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  inputStyle: {
    color: '#000',
    paddingRight: 5,
    paddingLeft: 5,
    fontSize: 18,
    lineHeight: 23,
    flex: 2,
  },
  labelStyle: {
    fontSize: 18,
    paddingLeft: 20,
    flex: 1,
  },
  containerStyle: {
    height: 40,
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
})

const { containerStyle, inputStyle, labelStyle } = styles

interface Props {
  label?: string
  value?: any
  onChangeText?: any
  placeholder?: string
  secureTextEntry?: boolean
}

const Input: React.SFC<Props> = props => {
  return (
    <View style={containerStyle}>
      <Text style={labelStyle}>{props.label}</Text>
      <TextInput
        secureTextEntry={props.secureTextEntry}
        placeholder={props.placeholder}
        autoCorrect={false}
        value={props.value}
        onChangeText={props.onChangeText}
        style={inputStyle}
      />
    </View>
  )
}

export { Input }
