require 'peep'

describe Peep do

  it { is_expected.to have_property :id   }
  it { is_expected.to have_property :message   }
  it { is_expected.to have_property :created_by   }
  it { is_expected.to have_property :created_at   }

end