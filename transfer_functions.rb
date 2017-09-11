module TransferFunctions
  def self.sigmoid(x)
    1.0 / (1 + Math::E ** -x)
  end

  def self.rectified_linear(x)
    [0, x].max
  end
end
