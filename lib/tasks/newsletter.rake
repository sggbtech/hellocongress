namespace :newsletter do  
  
  desc "sends the weekly newsletter"
  task :send_weekly => :environment do
    for s in Subscription.not_sent_this_week.all
      Blaster.deliver_weekly_newsletter(s)
      s.update_attribute(:sent_at, Time.now)
    end
  end
  
end