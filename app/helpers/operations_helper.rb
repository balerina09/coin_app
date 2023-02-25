module OperationsHelper
    def operation_type
        Operation.otypes.keys.map do |type|
          [ type.titleize, type ]
        end
    end

end
