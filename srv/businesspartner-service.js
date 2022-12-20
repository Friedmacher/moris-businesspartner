const cds = require('@sap/cds')

class BupaService extends cds.ApplicationService {
    async init() {
        const { BusinessPartners } = this.entities

        // this.after ('READ','BusinessPartners', (businesspartners)=>{
        //     for (let each of businesspartners) each.fullname = 'Full Name AUTO'
        // })

        await super.init()
    }
}

module.exports = BupaService