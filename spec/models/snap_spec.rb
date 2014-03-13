require 'spec_helper'

describe Snap do
  it 'uploads a snap' do
  	snap = Snap.new
  	params = { snap: { description: 'herro', tag_list: 'one, two', image: {}}}
  	expect(Snap).to receive(:new).with(description: 'herro', image: {}).and_return(snap)
  	expect(snap).to receive(:tag_list=).with('one, two')
  	expect(snap).to receive("cat")
  	Snap.upload_new_with(params)
  end
end