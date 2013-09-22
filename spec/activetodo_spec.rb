require 'spec_helper'

describe ActiveTodo::KernelMethods do

  context '.TODO' do
    subject { TODO 'stuff' }
    specify { expect { subject }.to_not raise_error }
  end

  context '.FIXME' do
    subject { FIXME 'stuff' }
    specify { expect { subject }.to_not raise_error }
  end

  context '.XXX' do
    subject { XXX 'stuff' }
    specify { expect { subject }.to_not raise_error }
  end

end
