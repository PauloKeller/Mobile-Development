import React, { Component } from 'react'
import { View, StyleSheet, Text } from 'react-native'
import { Card, CardSection, Input, Button, Spinner } from './common'
import { connect } from 'react-redux'
import { emailChanged, passwordChanged, login } from '../actions'

export interface OwnProps {
  email: string
  password: string
  error: string
  loading: false
  user: object
}

interface DispatchProps {
  emailChanged: (text: string) => any
  passwordChanged: (text: string) => any
  login: (email: string, password: string) => any
}

type Props = DispatchProps & OwnProps

const styles = StyleSheet.create({
  viewStyle: {
    backgroundColor: 'white',
  },
  errorTextStyle: {
    fontSize: 20,
    color: 'red',
    alignSelf: 'center',
  },
})

export class LoginForm extends Component<Props> {
  onEmailChange(text: string) {
    this.props.emailChanged(text)
  }

  onPasswordChange(text: string) {
    this.props.passwordChanged(text)
  }

  onButtonPress() {
    const { email, password } = this.props

    this.props.login(email, password)
  }

  renderError() {
    if (this.props.error) {
      return (
        <View style={styles.viewStyle}>
          <Text style={styles.errorTextStyle}>{this.props.error}</Text>
        </View>
      )
    }
  }

  renderButton() {
    if (this.props.loading) {
      return <Spinner size="large" />
    }
    return <Button onPress={this.onButtonPress.bind(this)}>Login</Button>
  }

  render() {
    return (
      <Card>
        <CardSection>
          <Input
            label="Email"
            placeholder="email@gmail.com"
            onChangeText={this.onEmailChange.bind(this)}
            value={this.props.email}
          />
        </CardSection>

        <CardSection>
          <Input
            secureTextEntry
            label="Password"
            placeholder="password"
            onChangeText={this.onPasswordChange.bind(this)}
            value={this.props.password}
          />
        </CardSection>

        {this.renderError()}

        <CardSection>{this.renderButton()}</CardSection>
      </Card>
    )
  }
}

const mapStateToProps = (state: any) => {
  const { email, password, error, loading, user } = state.auth

  return {
    email: email,
    password: password,
    error: error,
    loading: loading,
    user,
  }
}

export default connect(
  mapStateToProps,
  { emailChanged, passwordChanged, login }
)(LoginForm)
