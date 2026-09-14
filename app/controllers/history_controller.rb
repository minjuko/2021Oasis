class HistoryController < ApplicationController
    before_action :authenticate_user!

    def collect
        @allRides = Ride.all
        @rides = @allRides.where(:end => false, :user_id => current_user.id)
        @k = current_user.comments.pluck(:ride_id)
        @ridesMember = @allRides.where(:end => false)
    end

    def full
        @allRides = Ride.all
        @rides = @allRides.where(:end => true, :user_id => current_user.id)
        @k = current_user.comments.pluck(:ride_id)
        @ridesMember = @allRides.where(:end => true)
    end

    def complete
        @allRides = Ride.all
        @rides = @allRides.where(:end => true, :user_id => current_user.id)
        @k = current_user.comments.pluck(:ride_id)
        @ridesMember = @allRides.where(:end => true)
    end
end
