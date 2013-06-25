module Mediasilo
  class Api
    class Account < Base

      # Account.GetPreference
      # GET ?method=Account.GetPreference&session=8A5BBCEFE753CDC3485735DAAB88FA3D458
      # Property Type Description Required
      # session Integer The current session key	 X
      # key	String (List)	One or more preference keys that you want returned, default is all
      get :get_preference,  "/" do |r|
        r.required :session
        r.optional :key
        r.defaults method: 'Account.GetPreference', returnformat: FORMAT
      end


      # Account.SetPreference
      # GET ?method=Account.SetPreference&key=email_sender&value=accounts%40myco.com&session=8A5BBCEFE753CDC348573
      # Property	Type	Description	Required
      # key	String	The KEY of the account preference you want to set	 X
      # session	String	The current session key	 X
      # value	String	The VALUE you want to set the account preference to	 -
      # preferences	String	A JSON object that contains more then one key,value pairs, format: [{"value":"valuetest1","key":"keytest1"},{"value":"valuetest1","key":"keytest1"}]	 -
      get :set_preference,  "/" do |r|
        r.required :session, :key
        r.optional :value, :preferences
        r.defaults method: 'Account.SetPreference', returnformat: FORMAT
      end

    end
  end
end
