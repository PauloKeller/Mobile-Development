import React from 'react'
import { View, ActivityIndicator, StyleSheet } from 'react-native'

const styles = StyleSheet.create({
  spinnerStyle: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
})

interface Props {
  size?: any
}

const Spinner: React.SFC<Props> = props => {
  return (
    <View style={styles.spinnerStyle}>
      <ActivityIndicator size={props.size} />
    </View>
  )
}

Spinner.defaultProps = {
  size: 'large',
}

export { Spinner }
