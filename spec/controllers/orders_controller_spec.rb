require 'rails_helper'
RSpec.describe Api::Robot::OrdersController do
    let(:robot) {Robot.create}
    let(:params) {{id: robot.id}}
    let(:commands) {{id: robot.id, commands:["PLACE 1,2,EAST","MOVE","MOVE","RIGHT","MOVE","MOVE","LEFT","MOVE","LEFT","MOVE","RIGHT","MOVE","RIGHT","MOVE","REPORT"]}}
    describe 'Orders' do
        it 'Api Success Response' do
            post :create, params: commands
            expect(response.status).to eq(200)
        end
        it 'is expected to check for the position' do
            post :create,params: commands
            body = JSON.parse(response.body)
            expect(body["location"]).to eq(["5,1,SOUTH"])
        end
        end
end