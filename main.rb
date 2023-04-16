require 'glimmer-dsl-libui'
require_relative 'jfi.rb'

class RJ
  include Glimmer

  def initialize
    @@J = JFI.new(find_bin)
    create_gui
  end

  def buttons
    horizontal_box {
      stretchy false

      button('eval') {
        stretchy false

        on_clicked do
        end
      }

      # this is somehow more convenient to me than the close button
      button('quit') {
        stretchy false

        on_clicked do
          exit(0)
        end
      }
    }
  end

  def find_bin
    if OS.windows?
      'j.dll'
    elsif OS.linux?
      'libj.so'
    elsif OS.mac?
      'libj.dylib'
    else
      raise 'Make sure J is installed and set in PATH.'
    end
  end

  def create_gui
    window('rj', 1000, 1000) {
      margined true

      vertical_box {
        buttons

        horizontal_box {
          vertical_box {
            non_wrapping_multiline_entry
          }

          vertical_box {
            multiline_entry {
              read_only true
            }
          }
        }
      }
    }.show
  end
end

RJ.new
