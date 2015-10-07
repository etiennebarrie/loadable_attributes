require 'spec_helper'

describe LoadableAttributes do
  it 'has a version number' do
    expect(LoadableAttributes::VERSION).not_to be nil
  end

  class Test
    def load
      @foo = 42
    end
    extend LoadableAttributes
    attr_loadable :foo
  end

  it 'does something useful' do
    instance = Test.new
    expect(instance.instance_variable_get(:@foo)).to be_nil
    expect(instance.foo).to eq 42
    expect(instance.instance_variable_get(:@foo)).to eq 42
  end

  it 'is not loaded by default' do
    instance = Test.new
    expect(instance).not_to be_loaded
    expect(instance.loaded?).to be false
  end

  it 'is loaded when an attribute is accessed' do
    instance = Test.new
    instance.foo
    expect(instance).to be_loaded
  end

  it 'is loaded when load! is called' do
    instance = Test.new
    instance.load!
    expect(instance).to be_loaded
  end

  it 'is not loaded twice when using load!' do
    instance = Test.new
    expect(instance).to receive(:load).once
    expect(instance.load!).to be true
    expect(instance.load!).to be false
  end
end
