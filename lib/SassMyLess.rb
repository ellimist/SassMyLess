require "SassMyLess/version"
require 'fileutils'

module SassMyLess
  class Base
    ConvertList = {
      # A bit dangerous, but it should work.
      '@(?!font-face|import|media|keyframes|-)' => '$',
      '\.([\w\-]*)\s*\((.*)\)\s*\{' => "@mixin \\1\(\\2\)\n{",
      '\.([\w\-]*\(.*\)\s*;)' => '@include \1',
      '~"(.*)"' => '#{"\1"}',
      'spin\(' => 'adjust-hue(',
    }
    # Copies the entire directory to the output
    def self.convert(input_dir, output_dir)
      input_path = File.expand_path("#{input_dir}")
      output_path = File.expand_path("#{output_dir}")
      FileUtils.mkdir_p(output_path) unless Dir.exists?(output_path)
      FileUtils.cp_r "#{input_path}/.", "#{output_path}"
      self.traverse_dir output_path
    end

    private

    # Traverses the output directory and converts every file.
    def self.traverse_dir directory
      Dir.glob("#{directory}/*").each_with_object({}) do |f, h|
        if File.file?(f)
          src = open(f).read.encode!('UTF-8')
          ConvertList.each do |regexp, with|
            src.gsub! /#{regexp}/, with
          end
          FileUtils.mv(f, f.gsub('.less', '.scss'))
        end
      end
    end
  end
end


