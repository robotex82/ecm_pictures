ActiveAdmin.register Ecm::Pictures::AttachedPicture do
  menu false

  actions :destroy

  controller do
    def destroy
      destroy! do |format|
         format.html { redirect_to :back }
      end
    end
  end
end

