dmc-colorpicker.Colorpicker(class="{ Colorpicker--active: isCatcherActive }")
  .Colorpicker__label(if="{ !!opts.label }") { opts.label }
  form.Colorpicker__form(onSubmit="{ handleFormSubmit }")
    input.Colorpicker__dummyInput(onTap="handleInputTap" ref="touch" placeholder="{ opts.placeholder || '' }" readonly="readonly" value="{ generateDummyValue() }")
    .Colorpicker__container(show="{ opts.isshown }" hide="{ !opts.isshown }")
      .Colorpicker__picker
        .Colorpicker__canvasContainer(ref="canvasContainer" mouseDown="{ handleCanvasMouseDown }")
          canvas.Colorpicker__canvas(ref="canvas")
          .Colorpicker__canvasKnob(style="left: { updateSpectrumKnob('saturation') }%; top: { updateSpectrumKnob('brightness') }%;")
            .Colorpicker__canvasKnobInner(style="background-color: { generateColorStyle() }")
          .Colorpicker__catcher(mouseMove="{ handleCatcherMouseMove }" mouseUp="{ handleCatcherMouseUp }")
        .Colorpicker__sliderOperation
          .Colorpicker__circleContainer
            .Colorpicker__circle(style="background-color: { generateColorStyle() }")
          .Colorpicker__sliderContainer
            .Colorpicker__hueSlider
              dmc-slider(number="{ getHueValue() }" min="0" max="359" onChange="{ handleHueSliderChange }")
            .Colorpicker__alphaSlider
              dmc-slider(number="{ getAlphaValue() }" min="0" max="100" onChange="{ handleAlphaSliderChange }")
        .Colorpicker__colorcodeOperation
          virtual(if="{ color.format === 'HEX' }")
            .Colorpicker__inputContainer
              input.Colorpicker__inputHex(onInput="{ handleInputHexInput }" ref="inputHex" value="{ opts.color.value }")
              .Colorpicker__colorcodeHex {color.format}
          virtual(if="{ color.format === 'RGBA' }")
            .Colorpicker__inputContainer
              dmc-numberinput(number="{ generateRgbaValue('red') }" max="255" min="0" onChange="{ handleInputRgbaRedInput }")
              .Colorpicker__colorcodeRgba r
            .Colorpicker__inputContainer
              dmc-numberinput(number="{ generateRgbaValue('green') }" max="255" min="0" onChange="{ handleInputRgbaGreenInput }")
              .Colorpicker__colorcodeRgba g
            .Colorpicker__inputContainer
              dmc-numberinput(number="{ generateRgbaValue('blue') }" max="255" min="0" onChange="{ handleInputRgbaBlueInput }")
              .Colorpicker__colorcodeRgba b
            .Colorpicker__inputContainer
              dmc-numberinput(number="{ generateAlphaValue() }" max="100" min="0" onChange="{ handleInputAlphaInput }")
              .Colorpicker__colorcodeRgba a
          .Colorpicker__colorChangeContainer
            .Colorpicker__colorChangeButton(class="{ Colorpicker__colorChangeButton--hover: isColorChangeButtonActive }" onTap="handleColorChangeButtonTap" ref="touch" touchStart="{ handleColorChangeButtonTouchStart }" touchEnd="{ handleColorChangeButtonTouchEnd }" mouseOver="{ handleColorChangeButtonMouseOver }" mouseOut="{ handleColorChangeButtonMouseOut }")
              dmc-icon(type="caretUp")
              dmc-icon(type="caretDown")
      
  script.
    import '../dmc-icon/index.tag';
    import '../dmc-numberinput/index.tag';
    import '../dmc-slider/index.tag';
    import script from './index';
    this.external(script);