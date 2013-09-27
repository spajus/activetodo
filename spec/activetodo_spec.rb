require 'spec_helper'
require 'timecop'
require 'pry-nav'

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

  context 'options' do

    let(:now) { Time.local(2013, 12, 31, 12, 0, 0) }
    let(:future) { Time.local(2014, 1, 1, 12, 0, 0) }

    before { Timecop.freeze(now) }

    context 'deadline' do

      subject { FIXME 'Refactor shit', deadline: '2014-01-01' }

      context 'no error before it is reached' do
        specify { expect { subject }.to_not raise_error }
      end

      context 'raises error after it was reached' do
        let(:now) { future }
        specify { expect { subject }.to raise_error }
      end
    end

    context 'warn_only' do

      let(:now) { future }

      subject { FIXME 'Refactor shit', deadline: '2014-01-01', warn_only: true }

      context 'outside Rails' do
        before { ActiveTodo::PrivateMethods.should_receive(:log_message) }
        specify { expect { subject }.not_to raise_error }
      end

      context 'within Rails' do

        let(:rails) { double(:rails) }
        let(:logger) { double(:logger) }

        before do
          stub_const('Rails', rails)
          Rails.should_receive(:logger).twice.and_return(logger)
          logger.should_receive(:warn)
        end

        specify { expect { subject }.not_to raise_error }
      end
    end
  end
end
