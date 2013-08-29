require 'test_helper'

class WorklogsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_REFERER'] = 'http://test.host/any'
    @worklog = worklogs(:requirement_on_ilove)
  end

  should "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worklogs)
  end

  should "get new" do
    get :new
    assert_response :success
  end

  should "show worklog" do
    get :show, id: @worklog
    assert_response :success
  end

  should "get edit" do
    get :edit, id: @worklog
    assert_response :success
  end

  should "create worklog" do
    assert_difference('Worklog.count') do
      post :create, worklog: {date: '2013/02/16', project_id: 1, type_id: 1, value: 1  }
    end

  end

  should "update worklog" do
     put :update, id: @worklog, worklog: { date: '2013/02/16', project_id: 1, type_id: 1, value:1  }
   end

  should "destroy worklog" do
    assert_difference('Worklog.count', -1) do
      delete :destroy, id: @worklog
    end
  end

  context "when from worklogs pages" do

    setup do
      @request.env['HTTP_REFERER'] = 'http://test.host/worklogs'
    end

    should "redirect to worklog when editing" do
      put :update, id: @worklog, worklog: { date: '2013/02/16', project_id: 1, type_id: 1, value:1  }

      assert_redirected_to :controller => "worklogs"
    end


    should "redirect to worklog when deleting" do
      assert_difference('Worklog.count', -1) do
        delete :destroy, id: @worklog
      end

      assert_redirected_to :controller => "worklogs", :action => "index"
    end
  end

  context "when from timesheet page" do

    setup do
      @request.env['HTTP_REFERER'] = 'http://test.host/timesheets/show'
    end

    should "redirect to timesheet when editing" do
      put :update, id: @worklog, worklog: { date: '2013/02/16', project_id: 1, type_id: 1, value:1  }

      assert_redirected_to :controller => "timesheets", :action => "show"
    end

    should "redirect to timesheet when deleting" do
          assert_difference('Worklog.count', -1) do
            delete :destroy, id: @worklog
          end

          assert_redirected_to :controller => "timesheets", :action => "show"
    end
  end

end
