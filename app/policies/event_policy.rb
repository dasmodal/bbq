class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    @user.present?
  end

  def update?
    is_user_event_author?
  end

  def destroy?
    is_user_event_author?
  end

  def show?
    pin_in_cookies = @cookies["events_#{@record.id}_pincode"]

    return true if @record.pincode.blank?
    return true if is_user_event_author?
    return true if @record.pincode_valid?(pin_in_cookies)
  end

  def delete_bg_image?
    is_user_event_author?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def is_user_event_author?
    @user == @record.user
  end
end
