class HistoryController < ApplicationController
    def collect
        @allRides = Ride.all
        @rides = @allRides.where(:end => false, :user_id => current_user.id)
        @comments = Comment.all
        @member = @comments.where(:user_id => current_user.id)
        @k = []
        @member.each do |mem|
            @k.push(mem.ride_id)
        end
        @ridesMember = @allRides.where(:end => false)
    end

    def full
        @allRides = Ride.all
        @rides = @allRides.where(:end => true, :user_id => current_user.id)
        @comments = Comment.all
        @member = @comments.where(:user_id => current_user.id)
        @k = []
        @member.each do |mem|
            @k.push(mem.ride_id)
        end
        @ridesMember = @allRides.where(:end => true)
    end

    def complete
        @allRides = Ride.all
        @rides = @allRides.where(:end => true, :user_id => current_user.id)
        @comments = Comment.all
        @member = @comments.where(:user_id => current_user.id)
        @k = []
        @member.each do |mem|
            @k.push(mem.ride_id)
        end
        @ridesMember = @allRides.where(:end => true)
    end
end
