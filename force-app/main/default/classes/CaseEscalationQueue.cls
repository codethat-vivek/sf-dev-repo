public with sharing class CaseEscalationQueue implements Queueable {
    private List<Case>cases;
    public CaseEscalationQueue(List<Case> cases) {
        this.cases = cases;
    }

    public void execute(System.QueueableContext ctx){
        for(Case c : cases){
            if(c.slaviolation__C == 'Yes')c.IsEscalated = true;
        }
        if(cases.size() > 0)update cases;
    }
}
