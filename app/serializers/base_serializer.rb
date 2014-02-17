# This class helps to serialize objects to JSON.
# https://github.com/rails-api/active_model_serializers
class BaseSerializer < ActiveModel::Serializer
  self.root = false

  # usiversla method for attaching workflow statuses data to objects responses
  # def statuses
  #   object.class.workflow_spec.state_names
  # end

  # @override
  # Returns a hash representation of the object.
  # Adds an ability to use context for attributes.
  def serializable_hash
    return nil if @object.nil?
    @node = serializable_attributes
    include_associations! if _embed

    @node
  end

  def full_attributes
    serializable_hash
  end

  # Get attributes to be used in the serialization.
  #
  # To use a context you should define a specific method in the Serializer.
  # For context 'example' the method should be defined as 'example_attributes'.
  # The default attributes available via method 'attributes' in your Serializer.
  def serializable_attributes
    return attributes unless options[:context]
    public_send("#{options[:context]}_attributes")
  end

end
