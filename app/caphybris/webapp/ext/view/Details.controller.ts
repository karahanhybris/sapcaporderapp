import Controller from "sap/fe/core/PageController";
import Table from "sap/fe/macros/table/TableAPI";
import Wizard from "sap/m/Wizard";
import WizardStep from "sap/m/WizardStep";
import Core from "sap/ui/core/Core";
import JSONModel from "sap/ui/model/json/JSONModel";
import Context from "sap/ui/model/odata/v4/Context";

/**
 * @namespace caphybris.ext.view.Details.controller
 */
export default class Details extends Controller {

    /**
     * Called when a controller is instantiated and its View controls (if available) are already created.
     * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
     * @memberOf caphybris.ext.view.Details
     */
    // public onInit(): void {
    //
    //}

    /**
     * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
     * (NOT before the first rendering! onInit() is used for that one!).
     * @memberOf caphybris.ext.view.Details
     */
    // public  onBeforeRendering(): void {
    //
    //  }

    /**
     * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
     * This hook is the same one that SAPUI5 controls get after being rendered.
     * @memberOf caphybris.ext.view.Details
     */
    // public  onAfterRendering(): void {
    //
    //  }

    /**
     * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
     * @memberOf caphybris.ext.view.Details
     */
    // public onExit(): void {
    //
    //  }

    async onModelContextChange():Promise<void> {
        const context = this.getView()?.getBindingContext() as Context;
        const isActiveEntity = await context.requestProperty("IsActiveEntity");
        //console.log(isActiveEntity);
        if(isActiveEntity !== undefined){
            const uiModel = this.getView()?.getModel("ui") as JSONModel;
            uiModel.setProperty("/isEditable",!isActiveEntity);
        }
    }

    private resetOrderDetailWizard():void{
        const wizard = this.byId("orderDetailWizard") as Wizard
        const firstWizardStep = this.byId("orderWizardStep1") as WizardStep
        wizard.setCurrentStep(firstWizardStep);
    }

    private refreshTable():void{
        const table = Core.byId("caphybris::OrdersMain--orderLineItemTable") as Table
        table.refresh();
    }

    async onSaveOrder():Promise<void>{
        const context = this.getView()?.getBindingContext() as Context;
        await this.getExtensionAPI().getEditFlow().saveDocument(context);
        
        this.resetOrderDetailWizard();
        this.refreshTable();
    }

    async onEditPress(): Promise<void> {
        const context = this.getView()?.getBindingContext() as Context;
    
        await this.getExtensionAPI().getEditFlow().editDocument(context);
    
        this.resetOrderDetailWizard();
        this.refreshTable();
      }
    
      async onCancelPress(event: Event): Promise<void> {
        const context = this.getView()?.getBindingContext() as Context;
        const hasActiveEntity = await context.requestProperty("HasActiveEntity");
    
        await this.getExtensionAPI()
          .getEditFlow()
          .cancelDocument(context, { control: event.getSource() });
    
        this.resetOrderDetailWizard();
        this.refreshTable();
    
        if (!hasActiveEntity) {
          await this.getExtensionAPI().getRouting().navigateToRoute("/");
        }
      }
}