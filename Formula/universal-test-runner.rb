class UniversalTestRunner < Formula
  include Language::Python::Virtualenv

  desc "The Universal Test Runner is a zero-configuration, language-aware way to run unit tests in any project."
  homepage "https://github.com/xavdid/universal-test-runner"
  # update this url on new versions
  url "https://files.pythonhosted.org/packages/70/e3/48dd5fc0b5980cb87b9362f7894f05909104528d1059b22039c6cbac9b00/universal_test_runner-0.5.0.tar.gz"
  # update this SHA on new versions
  sha256 "a724062b12776c07b06afe83345f5fad8122f9754e9ff15d4b4d4d955e01d53b"

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
    assert_match "no matching test handler", shell_output("#{bin}/universal-test-runner debug")
  end
end
