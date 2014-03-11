class ChallengeApi < Grape::API

  resource :checkin do
    desc 'Handle checkin messages'
    get do
      Checkin.all  
    end

    params do
      requires :user_id
      requires :business_id
      requires :checkin_date
    end
    post do
      begin
        Checkin.create!(
          :user_id => params[:user_id],
          :business_id => params[:business_id],
          :checkin_date => params[:checkin_date]
        )  
      rescue ActiveRecord::RecordNotUnique
        error!("User has checked in at this business on #{params[:checkin_date]}")
      end
    end
  end

end
