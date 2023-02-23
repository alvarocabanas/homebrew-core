class ApacheOpennlp < Formula
  desc "Machine learning toolkit for processing natural language text"
  homepage "https://opennlp.apache.org/"
  url "https://www.apache.org/dyn/closer.lua?path=opennlp/opennlp-2.1.1/apache-opennlp-2.1.1-bin.tar.gz"
  mirror "https://archive.apache.org/dist/opennlp/opennlp-2.1.1/apache-opennlp-2.1.1-bin.tar.gz"
  sha256 "b0f9e2a711e348f6a8cee402b0344c92e9edbdc267a23b43bcc02c679aba18bc"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "101a28973fa80ff025d0df1fd6a250a2342b842358e3919ea2e7f87fb01371b5"
  end

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    (bin/"opennlp").write_env_script libexec/"bin/opennlp", JAVA_HOME: Formula["openjdk"].opt_prefix
  end

  test do
    assert_equal "Hello , friends", pipe_output("#{bin}/opennlp SimpleTokenizer", "Hello, friends").lines.first.chomp
  end
end
