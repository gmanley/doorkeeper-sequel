module Doorkeeper
  module Orm
    module Sequel
      module SequelCompat
        extend ActiveSupport::Concern

        # ActiveRecord methods used by Doorkeeper outside the ORM.
        # Should be extracted at the architectural level.
        included do
          plugin :active_model

          self.raise_on_save_failure = false

          def update_attribute(column, value)
            self[column] = value
            save(columns: [column.to_sym], validate: false)
          end

          def update_attributes(*args)
            update(*args)
          end

          def save!(*)
            save(raise_on_failure: true)
          end

          def transaction(opts = {}, &block)
            db.transaction(opts, &block)
          end
        end

        module ClassMethods
          def create!(values = {}, &block)
            new(values, &block).save(raise_on_failure: true)
          end
        end
      end
    end
  end
end
