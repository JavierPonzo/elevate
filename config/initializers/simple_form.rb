SimpleForm.setup do |config|
  # ✅ DEFAULT WRAPPER
  config.wrappers :default, class: :input,
                            hint_class: :field_with_hint,
                            error_class: :field_with_errors,
                            valid_class: :field_without_errors do |b|
    b.use :html5
    b.use :placeholder
    b.use :label_input
    b.use :hint, wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }
  end

  # ✅ YOUR CUSTOM WRAPPER (NO form-control)
  config.wrappers :no_form_control, tag: 'div', class: 'mb-4' do |b|
    b.use :html5
    b.use :label, class: 'form-label fw-bold'
    b.use :input, class: nil # ← disables 'form-control'
    b.use :full_error, wrap_with: { tag: 'span', class: 'text-danger' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # ✅ Global config options (leave these as-is)
  config.default_wrapper = :default
  config.boolean_style = :nested
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'error_notification'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end
