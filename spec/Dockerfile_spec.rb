describe 'Dockerfile' do
  describe package('make') do
    it { is_expected.to be_installed }
  end

  describe package('sudo') do
    it { is_expected.to be_installed }
  end

  describe user('fernando') do
    it { is_expected.to exist }
    it { is_expected.to belong_to_group('sudo') }
    it { is_expected.to have_home_directory('/home/fernando') }
    it { is_expected.to have_login_shell('/bin/bash') }
  end
end
