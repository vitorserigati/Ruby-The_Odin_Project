# frozen_string_literal: true

# module
module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end
