package kpi.lab3;

import java.util.List;

public class ActionContext {
    private Action action;

    void setAction(Action action) {
        this.action = action;
    }

    List<Integer> executeAction() {
        return this.action.execute();
    }
}
