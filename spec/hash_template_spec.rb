require 'spec_helper'

describe HashTemplate do
  let(:data) do
    {
      address: 'milton.waddams@initech.com',
      password: 'No salt',
      first_name: 'Milton',
      last_name: 'Waddams',
      department: 'Reporting',
      title: 'Collator',
      privacy: true,
      org_unit_path: '/BasementDwellers'
    }
  end

  let(:mapping) do
    {
      primaryEmail: :address,
      password: :password,
      name: {
        givenName: :first_name,
        familyName: :last_name
      },
      organizations: [
        {
          department: :department,
          title: :title
        }
      ],
      includeInGlobalAddressList: '!privacy',
      orgUnitPath: 'org_unit_path' # just to check plain strings
    }
  end

  let(:output) do
    {
      primaryEmail: 'milton.waddams@initech.com',
      password: 'No salt',
      name: {
        givenName: 'Milton',
        familyName: 'Waddams'
      },
      organizations: [
        {
          department: 'Reporting',
          title: 'Collator'
        }
      ],
      includeInGlobalAddressList: false,
      orgUnitPath: '/BasementDwellers'
    }
  end

  describe '#map' do
    subject { described_class.new mapping }

    specify do
      expect(subject.map data).to eq(output)
    end
  end
end
