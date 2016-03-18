<html>
<head>
    <title>filing</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div style="padding: 10px 0px 0px 0px;">

    <div class="container">

        <div class="row">
            <div class="col-sm-4"></div>

            <div class="col-sm-3">
                <h3>
                    <span class="label label-default" style="background-color: #eee; color: #557;">

                        <g:set var="liuService" bean="liuService"/>
                        <g:set var="filer" value="${liuService.isLawyerOnly() ? 'Lawyer' : 'Firm'}"/>

                        Levy Surcharge - ${filer} Filing
                    </span>
                </h3>
            </div>
        </div>

        <div style="height: 10px"></div>

        <div class="row">
            <div class="col-sm-6">
                <g:render template="amendment"/>
            </div>

            <div class="col-sm-6">
                <div class="row" style="padding-right: 15px">
                    <div id="divQrSummary" class="col-sm-10" style="font-size: 90%;">
                        <g:render template="qrSummary"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>