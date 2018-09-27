#! /bin/sh

ODOO_HOME="/opt/bitnami/apps/odoo"
SCHEDULER_START="$ODOO_HOME/bin/odoo-bin -c $ODOO_HOME/conf/odoo-server.conf --max-cron-thread 1"
SCHEDULER_PROGRAM="odoo-bin"
SCHEDULER_STATUS=""
SCHEDULER_PID=""
SCHEDULER_STATUS=""
ERROR=0

is_service_running() {
    SCHEDULER_PID=`ps ax | awk '/[o]doo-bin -c / {print $1}'`
    if [ "x$SCHEDULER_PID" != "x" ]; then
        RUNNING=1
    else
        RUNNING=0
    fi
    return $RUNNING
}

is_scheduler_running() {
    is_service_running "$SCHEDULER_PROGRAM"
    RUNNING=$?
    if [ $RUNNING -eq 0 ]; then
        SCHEDULER_STATUS="odoo_background_worker not running"
    else
        SCHEDULER_STATUS="odoo_background_worker already running"
    fi
    return $RUNNING
}

start_scheduler() {
    is_scheduler_running
    RUNNING=$?
    if [ $RUNNING -eq 1 ]; then
        echo "$0 $ARG: odoo_background_worker already running"
        exit
    fi
    if [ `id -u` != 0 ]; then
        ((cd $ODOO_HOME && $SCHEDULER_START 2>&1) >/dev/null) &
    else
        su - daemon -s /bin/sh -c "((cd $ODOO_HOME && $SCHEDULER_START 2>&1) >/dev/null) &"
    fi
    sleep 20
    is_scheduler_running
    RUNNING=$?
    if [ $RUNNING -eq 0 ]; then
        ERROR=1
    fi

    if [ $ERROR -eq 0 ]; then
        echo "$0 $ARG: odoo_background_worker started"
        sleep 2
    else
        echo "$0 $ARG: odoo_background_worker could not be started"
        ERROR=3
    fi
}

stop_scheduler() {
    NO_EXIT_ON_ERROR=$1
    is_scheduler_running
    RUNNING=$?
    if [ $RUNNING -eq 0 ]; then
        echo "$0 $ARG: $SCHEDULER_STATUS"
        if [ "x$NO_EXIT_ON_ERROR" != "xno_exit" ]; then
            exit
        else
            return
        fi
    fi

    kill $SCHEDULER_PID
    sleep 3

    is_scheduler_running
    RUNNING=$?
    if [ $RUNNING -eq 0 ]; then
            echo "$0 $ARG: odoo_background_worker stopped"
        else
            echo "$0 $ARG: odoo_background_worker could not be stopped"
            ERROR=4
    fi
}

if [ "x$1" = "xstart" ]; then
    start_scheduler
elif [ "x$1" = "xstop" ]; then
    stop_scheduler
elif [ "x$1" = "xstatus" ]; then
    is_scheduler_running
    echo "$SCHEDULER_STATUS"
fi

exit $ERROR
