import grails.util.BuildSettings
import grails.util.Environment

// See http://logback.qos.ch/manual/groovy.html for details on configuration
appender('STDOUT', ConsoleAppender) {
    encoder(PatternLayoutEncoder) {
        pattern = "%date{dd MMM yyyy HH:mm:ss.SSS} :: %level :: %logger{50} - %msg%n"
    }
}

def byMinute = timestamp("yyyyMMdd'T'HHmm")
appender('FILE', FileAppender) {
    file = "log-${byMinute}.log"
    append = false
    encoder(PatternLayoutEncoder) {
        pattern = "%date{dd MMM yyyy HH:mm:ss.SSS} :: %level :: %logger{50} - %msg%n"
    }
}

root(ERROR, ['STDOUT'])

def targetDir = BuildSettings.TARGET_DIR
if (Environment.isDevelopmentMode() && targetDir) {
    appender("FULL_STACKTRACE", FileAppender) {
        file = "${targetDir}/stacktrace.log"
        append = true
        encoder(PatternLayoutEncoder) {
            pattern = "%level %logger - %msg%n"
        }
    }
    logger "StackTrace", ERROR, ['FULL_STACKTRACE'], false
    logger 'grails.app', DEBUG, ['STDOUT'], false
    logger 'grails.app', DEBUG, ['FILE'], false
}
