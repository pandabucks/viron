dmc-input(ref="form" class="Input { opts.isfocused ? 'Input--focused' : '' } { opts.isdisabled ? 'Input--disabled' : '' }" click="{ handleClick }")
  form.Input__content(submit="{ handleFormSubmit }")
    .Input__icon(if="{ !!opts.icon }")
      dmc-icon(type="{ opts.icon }")
    input.Input__input(type="{ opts.type || 'text' }" value="{ opts.text }" placeholder="{ opts.placeholder || '' }" disabled="{ opts.isdisabled }" pattern="{ opts.pattern }" input="{ handleInputChange }" focus="{ handleInputFocus }" blur="{ handleInputBlur }")
    .Input__resetButton(if="{ opts.isresetable }" click="{ handleResetButtonClick }")
      dmc-icon(type="close")

  script.
    import '../atoms/dmc-icon.tag';

    const initialText = opts.text || '';

    handleClick() {
      this.refs.form.focus();
    }

    handleFormSubmit(e) {
      e.preventDefault();
      this.opts.onenter && this.opts.onenter(this.opts.text, this.opts.id);
    }

    handleInputChange(e) {
      const newText = e.target.value.replace(/　/g, ' ');
      this.opts.ontextchange && this.opts.ontextchange(newText, this.opts.id);
    }

    handleInputFocus() {
      this.opts.onfocustoggle && this.opts.onfocustoggle(true, this.opts.id);
    }

    handleInputBlur() {
      this.opts.onfocustoggle && this.opts.onfocustoggle(false, this.opts.id);
    }

    handleResetButtonClick(e) {
      e.stopPropagation();
      this.opts.onreset && this.opts.onreset(initialText, this.opts.id);
    }