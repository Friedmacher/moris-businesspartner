const cds = require('@sap/cds')

class BupaService extends cds.ApplicationService {
    async init() {
        const { BusinessPartners } = this.entities

        this.before ('CREATE', 'BusinessPartners', (req)=>{
            const bupa = req.data
            bupa.fullname = bupa.lastname + ', ' + bupa.firstname
        })

        this.before ('UPDATE', 'BusinessPartners', (req)=>{
            const bupa = req.data
            if (bupa.companyname != null) {
                bupa.fullname = bupa.companyname
            } else {
                bupa.fullname = bupa.lastname + ', ' + bupa.firstname
            }
        })

        this.on ('doCopy', async(req)=>{
            const bupa = req.data
            bupa.companyname = 'COPY'
        })

        // this.after ('READ','BusinessPartners', (businesspartners)=>{
        //     for (let each of businesspartners) each.fullname = 'Full Name AUTO'
        // })

        await super.init()
    }
}

module.exports = BupaService