package loja.com.br.boundary;

import java.io.Serializable;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import loja.com.br.entity.User;

/**
 *
 * @author tux
 */
@ManagedBean
@ViewScoped
public class WizardMasterDetailController implements Serializable {

    private static final long serialVersionUID = 20120209L;

    private User user = new User();
    private int currentLevel = 1;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getCurrentLevel() {
        return currentLevel;
    }

    public void setCurrentLevel(int currentLevel) {
        this.currentLevel = currentLevel;
    }

    public void save(ActionEvent actionEvent) {
        FacesMessage msg = new FacesMessage("Saved successful", "Welcome :" + user.getFirstname());
        FacesContext.getCurrentInstance().addMessage(null, msg);

        // create new empty user
        user = new User();
        currentLevel = 1;
    }
}
