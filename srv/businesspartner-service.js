const cds = require('@sap/cds')

class BupaService extends cds.ApplicationService {
    async init() {
        const { BusinessPartners } = this.entities

        // Automatically update field fullname depending on business partner type.
        this.before ('CREATE', 'BusinessPartners', (req)=>{
            const bupa = req.data
            if (bupa.type_ID === '20221221-1948-2025-1605-202516e19000') {
                bupa.fullname = bupa.lastname + ', ' + bupa.firstname
            } else {
                bupa.fullname = bupa.companyname
            }
            
        })

        // Update fields after save.
        this.before ('UPDATE', 'BusinessPartners', (req)=>{
            const bupa = req.data
            if (bupa.companyname != null) {
                bupa.fullname = bupa.companyname
            } else {
                bupa.fullname = bupa.lastname + ', ' + bupa.firstname
            }
        })

        // Event handler for copy button.
        this.on ('doCopy', 'BusinessPartners', async req => {
            await cds.update(BusinessPartners, req.params[0].ID).set({companyname: 'COPY'})
        })

        await super.init()
    }
}

module.exports = BupaService