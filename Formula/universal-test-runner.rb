class UniversalTestRunner < Formula
  include Language::Python::Virtualenv

  desc "Shiny new formula"
  homepage ""
  url "https://files.pythonhosted.org/packages/14/c7/fa363f0a5b13e41ca25ca3b153e34422e30f3cdf776e6dd3b7164d9b2d3f/universal_test_runner-0.4.0.tar.gz"
  sha256 "dab67ba08edf750658cb79cd47016097465a69136680c6a41888f567d3169d9c"

  depends_on "python3"

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
