# -*- coding: utf-8 -*-
module Mediasilo
  class Api
    class User < Base

      get :login,  "/" do |session|
        session.required :username, :password, :apikey, :hostname
        session.defaults method: 'User.Login', returnformat: FORMAT
      end



      # User.GetPreference
      # Property Type Description Required
      # session String The current session key	 X
      # id	String	The ID of the user to get preferences for, default is the logged in user	 -
      # key	String (List)	The preference key or keys you want the value returned from, if blank all are returned
      # GET ?method=User.GetPreference&returnformat=json&session=864A104B03F2F3F6C249022173FB66F8878
      get :get_preference, '/' do |r|
        r.required :session
        r.optional :id, :key
        r.defaults method: 'User.GetPreference', returnformat: FORMAT
      end

      # User.GetAll
      # Property	Type	Description	Required
      # session	String		 X
      # adminbool	Boolean	If the user is a "super user" (su) and this is TRUE this call will return all users instead of the users this user has access to
      # GET ?method=User.GetAll&returnformat=json&session=864A104B03F2F3F6C249022173FB66F8878
      get :get_all, '/' do |r|
        r.required :session
        r.optional :adminbool
        r.defaults method: 'User.GetAll', returnformat: FORMAT
      end

      # User.GetByProjectID
      # Property	Type	Description	Required
      # projectid	Integer	The ID of the project you want the users from	 X
      # session	String	The current session key	 X
      # GET ?method=User.GetByProjectID&projectid=771&returnformat=json&session=864A104B03F2F3F6C24902
      get :get_by_project_id, '/' do |r|
        r.required :session, :projectid
        r.defaults method: 'User.GetByProjectID', returnformat: FORMAT
      end


      # User.ResetPassword
      # Property	Type	Description	Required
      # username	String	The username you want to reset the password for	 X
      # hostname	String	The MediaSilo hostname of the user	 X
      # session	String	The current session key	 X
      # GET ?method=User.ResetPassword&username=tester1&hostname=cloudcompanion&returnformat=json&session=85C625FCD5D0816826C7DE5F93D89D59551
      get :reset_password, '/' do |r|
        r.required :username, :hostname, :session
        r.defaults method: 'User.ResetPassword', returnformat: FORMAT
      end


      # User.SetPreference
      # Property	Type	Description	Required
      # session	String	The current session key	 X
      # id	Integer	The ID of the user to get preferences for, default is the logged in user	 -
      # value	String	The value to set the preference to	 -
      # key	String	The preference key you want to set	 -
      # preferences	String	A JSON object that contains more than one key,value pairs, format: [{"value":"valuetest1","key":"keytest1"},{"value":"valuetest1","key":"keytest1"}]	 -
      # GET ?method=User.SetPreference&key=newcomment&value=true&session=864A104B03F2F3F6C249022173FB66F8878
      get :set_preference, '/' do |r|
        r.required :session
        r.optional :id, :value, :key, :preferences
        r.defaults method: 'User.SetPreference', returnformat: FORMAT
      end


      # User.DeletePreference
      # Property	Type	Description	Required
      # key	String	The key value of the preference you want to delete	 X
      # session	String	The current session key	 X
      # id	Integer	The ID of the user to get preferences for, default is the logged in user
      # GET ?method=User.DeletePreference&key=newcomment&returnformat=json&session=864A104B03F2F3F6C249022173FB66F8878
      get :delete_preference, '/' do |r|
        r.required :key, :session
        r.optional :id
        r.defaults method: 'User.DeletePreference', returnformat: FORMAT
      end

      # User.Create
      # Property	Type	Description	Required
      # password	String	Must be at least 6 characters in length and not contain any spaces, must have one lower case letter, one upper letter, and one number	 X
      # username	String	Must be alphanumeric and can not contain spaces	 X
      # email	String		 X
      # session	String	The current session key	 X
      # permissions	String (List)	One or more permission codes that define what this user has access to, codes can be obtained from Permission.GetAll	 X
      # roleid	Integer	The ID of the role for this user, ID's can be obtained from Role.GetAll, default is none	 -
      # projectid	Integer (List)	One or more Project ID's you want this user to have access to	 -
      # company	String		 -
      # mobile	String		 -
      # phone	String		 -
      # country	String		 -
      # zip	String		 -
      # state	String		 -
      # city	String		 -
      # address2	String		 -
      # address1	String		 -
      # lastname	String		 -
      # firstname	String		 -
      # notify	Boolean	True if you want an email notification to be sent, default is false	 -
      # GET &method=proxycall¶meters=User.Create&session=12234223434433&projectid=17766,4836,20467,permissions=projectview,projectcreate,projectedit,projectdelete,userviewall,foldercreate,folderedit,folderdelete,assetcreate,assetedit,assetdelete,assetview,assetsource,usercreate,useredit,userdelete,usereditself,rolecreate,roleedit,roledelete,metadatacreate,metadataedit,metadatadelete,metadataview,metadatalock,tagcreate,tagedit,tagdelete,tagview,commentcreate,commentview,commentdelete,presentationcreate,presentationedit,presentationdelete,presentati
      get :create, '/' do |r|
        r.required :password, :username, :email, :session, :permissions
        r.optional :roleid, :projectid, :company, :mobile, :phone,
        :country, :zip, :state, :city, :address1, :address2,
        :lastname, :firstname, :notify
        r.defaults method: 'User.Create', returnformat: FORMAT
      end

      # User.Edit
      #
      # Property	Type	Description	Required
      # id	Integer	The ID of the user you want to edit	 X
      # session	String	The current session key	 X
      # roleid	Integer	The ID of the role for this user, ID's can be obtained from Role.GetAll, default is none	 -
      # projectid	Integer (List)	One or more Project ID's you want this user to have access to	 -
      # company	String		 -
      # mobile	String		 -
      # phone	String		 -
      # country	String		 -
      # zip	String		 -
      # state	String		 -
      # city	String		 -
      # address2	String		 -
      # address1	String		 -
      # password	String		 -
      # username	String	Must be alphanumeric and can not contain spaces	 -
      # lastname	String		 -
      # firstname	String		 -
      # email	String		 -
      # permissions	String (List)	One or more permission codes that define what this user has access to, codes can be obtained from Permission.GetAll
      # GET &method=method=User.Edit&id=31634&session=&roleid=&projectid=8855&permissions=&email=tester@mediasilo.com&sso=false&password=¬ify=false
      get :edit, '/' do |r|
        r.required :id, :session
        r.optional :roleid, :projectid, :company, :mobile, :phone,
        :country, :zip, :state, :city, :address1, :address2,
        :lastname, :firstname, :notify, :email, :permissions
        r.defaults method: 'User.Edit', returnformat: FORMAT
      end

      # User.Delete
      # Property	Type	Description	Required
      # id	Integer	The ID of the user to delete	 X
      # session	String	The current session key	 X
      # GET ?method=User.Delete&id=25853&returnformat=json&session=86C47E47F7B96BB39679F19D22E47FED989

      get :delete, '/' do |r|
        r.required :id, :session
        r.defaults method: 'User.Delete', returnformat: FORMAT
      end

      # User.GetByID
      # Property	Type	Description	Required
      # id	Integer	The ID of the user you want details of	 X
      get :get_by_id, '/' do |r|
        r.required :id, :session
        r.defaults method: 'User.GetByID', returnformat: FORMAT
      end

      # User.GetByAssetUUID
      # Property	Type	Description	Required
      # session	String	The current session key	 X
      # assetuuid	String (List)	The UUID of the asset you want users for	 X
      get :get_by_asset_uuid, '/' do |r|
        r.required :session, :assetuuid
        r.defaults method: 'User.GetByAssetUUID', returnformat: FORMAT
      end

      # User.Get
      # session	String	The current session key	 X
      get :get, '/' do |r|
        r.required :session
        r.defaults method: 'User.Get', returnformat: FORMAT
      end

    end
  end
end
