require 'fiddle'

class JFI
  def initialize(bin)
    ffi = Fiddle.dlopen(bin)
    @J = Fiddle::Function.new(ffi['JInit'], [], Fiddle::TYPE_VOIDP).call
    @JDo = Fiddle::Function.new(
      ffi['JDo'],
      [Fiddle::TYPE_VOIDP, Fiddle::TYPE_CONST_STRING],
      Fiddle::TYPE_INT
    )
    @JGetR = Fiddle::Function.new(
      ffi['JGetR'],
      [Fiddle::TYPE_VOIDP],
      Fiddle::TYPE_CONST_STRING
    )
  end

  def run(sentence)
    @JDo.call(@J, sentence)
    @JGetR.call(@J)
  end
end
