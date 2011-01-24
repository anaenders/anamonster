module EditableHelper

  def editable(tag, object, field_name, opts = {})
    klass = object.class.name
    column = object.column_for_attribute(field_name)
    is_bool = column && column.type == :boolean
    id = [ object.id, field_name.to_s ].join('_')
    tag_class = ([ is_bool ? 'editable_boolean' : 'editable' ] + [ opts.delete(:class) ]).compact.join(' ')
    content_tag tag, { :id => id, 'data-type' => klass, :class => tag_class }.merge(opts) do
      is_bool ? (object.send(field_name) ? 'Yes' : 'No') : h(object.send(field_name))
    end
  end
  
end