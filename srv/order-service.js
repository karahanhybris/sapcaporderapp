const cds = require("@sap/cds");

class OrderService extends cds.ApplicationService{
    init(){

        const { Orders } = this.entities;
        
        this.before("CREATE","Orders.drafts",async(req) =>{
            
            const activeResults = await SELECT`OrderCode`.from(Orders);
            const draftResults = await SELECT`OrderCode`.from(Orders.drafts);
            let maxOrderCode = 0;
            
            for(const result of [...activeResults, ...draftResults]){
                if(Number(result.OrderCode) > maxOrderCode){
                    maxOrderCode = Number(result.OrderCode);
                }
            }
            req.data.OrderCode = String(maxOrderCode + 1).padStart(12,0);

        });

        return super.init();
    }
}
module.exports={OrderService};