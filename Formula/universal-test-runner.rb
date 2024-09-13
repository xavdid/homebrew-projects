class UniversalTestRunner < Formula
  include Language::Python::Virtualenv

  desc "The Universal Test Runner is a zero-configuration, language-aware way to run unit tests in any project."
  homepage "https://github.com/xavdid/universal-test-runner"
  # update this url on new versions
  url "https://files.pythonhosted.org/packages/1b/1b/d10a6b957d5d0a01d281226ca7562d86f5f1978d0eb9115819330251174c/universal_test_runner-0.6.2.tar.gz"
  # update this SHA on new versions
  sha256 "a379922df425eb11bc12893400dfc1a4683a44b1baf83178bd95742d23e95ad7"

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
