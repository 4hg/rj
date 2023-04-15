require 'glimmer-dsl-libui'

include Glimmer

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

def input
  vertical_box {
    non_wrapping_multiline_entry
  }
end

def output
  vertical_box {
    multiline_entry {
      read_only true
    }
  }
end

window('rj', 1000, 1000) {
  margined true

  vertical_box {
    buttons

    horizontal_box {
      input

      output
    }
  }
}.show
