`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

class ApplicationRoute extends Ember.Route with ApplicationRouteMixin
  actions:
    sessionAuthenticationFailed: (error) ->
      @flash.pushFlash 'Invalid email or password.',
        type: 'error'
        isNagging: true

`export default ApplicationRoute`