module Doorkeeper
  module Orm
    module Sequel
      module AccessTokenMixin
        extend ActiveSupport::Concern

        include OAuth::Helpers
        include Models::Expirable
        include Models::Revocable
        include Models::Accessible
        include Models::Scopes
        # include ActiveModel::MassAssignmentSecurity if defined?(::ProtectedAttributes)

        included do
          plugin :validation_helpers
          plugin :timestamps

          many_to_one :application, class: 'Doorkeeper::Application' #, inverse_of: :access_tokens

          if respond_to?(:set_allowed_columns)
            set_allowed_columns :resource_owner_id, :application_id, :expires_in, :redirect_uri, :scopes
          end

          def before_validation
            generate_token
            super
          end

          def validate
            super
            validates_presence [:resource_owner_id, :application_id, :token, :expires_in, :redirect_uri]
            validates_unique [:token]
          end
        end

        module ClassMethods
          def by_token(token)
            find(token: token.to_s)
          end
        end

        private

        def generate_token
          self.token = UniqueToken.generate if new?
        end
      end
    end
  end
end
