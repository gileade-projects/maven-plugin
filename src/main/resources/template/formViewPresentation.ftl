<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="panel gmd">
            <div class="panel-body">
                <form name="${entityName}Form" gumga-form novalidate>
                    <#include "generateFields.ftl">
                    <gumga-errors label="Lista de erros" title="Lista de erros"></gumga-errors>
                    <gumga-form-buttons
                            class="gmd raised"
                            back="${entityNameLowerCase}.list"
                            submit="${entityNameLowerCase}.methods.put(${entityNameLowerCase}.data)"
                            position="right"
                            should-continue="shouldContinue"
                            valid="${entityName}Form.$valid"
                            confirm-dirty="true"
                            continue="continue">
                    </gumga-form-buttons>
                </form>
            </div>
        </div>
    </div>
</div>