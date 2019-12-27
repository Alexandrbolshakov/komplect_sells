<#include "parts/security.ftlh">
<#import "parts/common.ftlh" as c>
    <#import "parts/pager.ftlh" as p>

<@c.page>

    <h4>Список запчастей</h4>
    <div class="form-row">
       <#if isAdmin> <div>
            <button class="my-1"><a href="/supplier" class="form-control">Добавить поставщика</a></button>

            <button><a href="/addPart" class="form-control">Добавить запчасть</a></button>
        </div>
       </#if>
    </div>
    <div>
        <form method="get" action="/start">
            <input class="my-1" type="text" name="filter"value="${filter!}">
            <button type="submit">Найти</button>
        </form>
        </div>
    <@p.pager url page/>
    <div>
        <table border="1">
            <thead>
            <tr>
                <th>Каталожный номер</th>
                <th>Наименование</th>
                <th>Колличество</th>
               <#if isAdmin> <th>цена закупки</th></#if>
                <th>цена, в руб. с НДС</th>
                <#if isAdmin><th>Поставщик</th></#if>
                <#if isAdmin><th>Дата изменения</th></#if>
                <#if isAdmin><th>Действие</th></#if>
            </tr>
            </thead>
            <tbody>
            <#list page.content as part>
                <tr>
                    <td>${part.partNumber}</td>
                    <td>${part.name}</td>
                    <td>${part.quantity}</td>
                    <#if isAdmin><td>${part.price}</td></#if>
                    <td>${part.priceOut()}</td>
                    <#if isAdmin><td><button><a href="/supplier">${part.supplierName}</a></button></td></#if>
                    <#if isAdmin><td>${part.dateTime!}</td></#if>
                    <#if isAdmin><td>
                        <button><a href="/edit/${part.id}">edit</a></button>
                        <button><a href="/delete/${part.id}">delete</a></button>
                    </td></#if>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <@p.pager url page/>
    ${message!}
</@c.page>