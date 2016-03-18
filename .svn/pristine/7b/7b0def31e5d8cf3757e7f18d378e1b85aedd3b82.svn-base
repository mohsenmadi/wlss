import com.lss.client.Firm
import com.lss.client.Role
import com.lss.client.User
import com.lss.client.UserRole
import com.lss.enums.LssRole

class BootStrap {

   def init = { servletContext ->
      if (Firm.count() == 0) {
         createEntries()
      }
   }

   def createEntries() {
      def firm = createFirms()
      def users = createUsers(firm)
   }

   def createFirms() {
      new Firm(
            referKey: "X123",
            name: "LawPRO").save(failOnError: true)
   }

   def createUsers(firm) {

      def userList = []

      def yasmeen = new User(
            username: 'yasmeen',
            firstName: 'Yasmeen',
            lastName: 'Baig',
            password: 'yblss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(yasmeen)

      def mohsen = new User(
            username: 'mohsen',
            firstName: 'Mohsen',
            lastName: 'Madi',
            password: 'mmlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(mohsen)

      def galina = new User(
            username: 'galina',
            firstName: 'Galina',
            lastName: 'Jarkich',
            password: 'gjlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(galina)

      def jagruti = new User(
            username: 'jagruti',
            firstName: 'Jagruti',
            lastName: 'Damania',
            password: 'jdlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(jagruti)

      def ioana = new User(
            username: 'ioana',
            firstName: 'ioana',
            lastName: 'Teodor',
            password: 'itlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(ioana)

      def david = new User(
            username: 'david',
            firstName: 'David',
            lastName: 'McCracken',
            password: 'dmlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(david)

      def hugo = new User(
            username: 'hugo',
            firstName: 'Hugo',
            lastName: 'Munoz',
            password: 'hmlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(hugo)

      def iveri = new User(
            username: 'iveri',
            firstName: 'Iveri',
            lastName: 'Boudville',
            password: 'iblss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(iveri)

      def nanette = new User(
            username: 'nanette',
            firstName: 'Nanette',
            lastName: "O'Conner",
            password: 'nolss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(nanette)

      def pmfin = new User(
            username: 'pmfin',
            firstName: 'Patricia',
            lastName: "McKenzie",
            password: 'pmlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(pmfin)

      def pmcsr = new User(
            username: 'pmcsr',
            firstName: 'Patricia',
            lastName: "McKenzie",
            password: 'pmlss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(pmcsr)

      def admin = new User(
            username: 'admin',
            firstName: 'Web-Master',
            lastName: 'Boss',
            password: 'admin4lss',
            lawyerRole: false,
            enabled: true,
            firm: firm).save(failOnError: true)
      userList.add(admin)

      def theFirm = new User(
            username: firm.referKey,
            firstName: 'Admin',
            lastName: firm.name,
            password: firm.referKey + 'lss',
            enabled: true,
            lawyerRole: false,
            firm: firm).save(failOnError: true)
      userList.add(theFirm)

      def roleAdmin = new Role(authority: LssRole.ROLE_ADMIN.toString()).save(failOnError: true)
      def roleFirm = new Role(authority: LssRole.ROLE_FIRM.toString()).save(failOnError: true)
      def roleLaw = new Role(authority: LssRole.ROLE_LAWYER.toString()).save(failOnError: true)
      def roleFin = new Role(authority: LssRole.ROLE_FINANCE.toString()).save(failOnError: true)
      def roleCsr = new Role(authority: LssRole.ROLE_CUSTSRV.toString()).save(failOnError: true)

      UserRole.create admin, roleAdmin, true

      UserRole.create theFirm, roleFirm, true
      UserRole.create theFirm, roleFirm, true

      UserRole.create yasmeen, roleFirm, true
      UserRole.create yasmeen, roleLaw, true
      UserRole.create yasmeen, roleAdmin, true

      UserRole.create galina, roleFirm, true
      UserRole.create galina, roleLaw, true

      UserRole.create mohsen, roleFirm, true
      UserRole.create mohsen, roleAdmin, true
      UserRole.create mohsen, roleFin, true
      UserRole.create mohsen, roleLaw, true

      UserRole.create pmcsr, roleCsr, true
      UserRole.create pmfin, roleFin, true

      UserRole.create iveri, roleFin, true
      UserRole.create jagruti, roleFin, true
      UserRole.create ioana, roleFin, true
      UserRole.create david, roleFin, true
      UserRole.create hugo, roleFin, true

      UserRole.create nanette, roleCsr, true

      return userList
   }

   def destroy = {
   }
}
