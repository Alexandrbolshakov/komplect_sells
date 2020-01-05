<#import "parts/common.ftlh" as c>

<@c.page>
    <div xmlns="http://www.w3.org/1999/html" xmlns:form="http://www.w3.org/1999/html">
        <form method="post">
            <div class="col-md-3 mb-3">
                <label>
                    <input type="text" name="partNumber" placeholder="Part number">
                </label>
            </div>
            <div class="col-md-3 mb-3">
                <label>
                    <input type="text" name="name" placeholder="Наименование">
                </label>
            </div>
            <div class="col-md-3 mb-3">
                <label>
                    <input type="number" name="quantityStr" placeholder="Колличество">
                </label>
            </div>
            <div class="col-md-3 mb-3">
                <label>
                    <input type="text" name="priceStr" placeholder="Цена">
                </label>
            </div>
            <div class="col-md-3 mb-3">
                <label>
                    <select class="custom-select" name="supplier">
                        <option selected>Поставщик</option>
                        <#list suppliers as supplier>
                            <option selected>${supplier.name}</option>
                        </#list>
                    </select>
                </label>



            </div>
             <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Добавить</button>
        </form>
    </div>
    ${message!}

</@c.page>