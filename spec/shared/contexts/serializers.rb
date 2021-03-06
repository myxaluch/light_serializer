# frozen_string_literal: true

RSpec.shared_context 'with base and nested serializers' do
  class BaseSerializer
    include ::LightSerializer::Serialization

    attributes(
      id: LightSerializer::Types::Strict::Integer
    )
  end

  class NestedSerializer
    include ::LightSerializer::Serialization

    attributes(
      id: LightSerializer::Types::Strict::Integer,
      name: LightSerializer::Types::Strict::String
    )
  end

  class ChildSerializer < BaseSerializer
    attributes(
      name: LightSerializer::Types::Strict::String,
      nicknames: LightSerializer::Types::Strict::Array.of(LightSerializer::Types::Strict::String),
      active: LightSerializer::Types::Strict::Bool,
      options: LightSerializer::Types::Strict::Hash,
      rating: LightSerializer::Types::Strict::Float,
      created_at: LightSerializer::Types::Strict::Time,
      nested_resource: LightSerializer::Types::NestedObject.serialize_by(NestedSerializer),
      nested_resources: LightSerializer::Types::NestedObjects.each_serialize_by(::NestedSerializer)
    )
  end
end
