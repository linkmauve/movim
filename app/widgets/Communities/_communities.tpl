{if="!$communities->isEmpty()"}
<ul class="list middle flex third active all">
    <li class="subheader block large">
        <p>{$c->__('communities.interesting')}</p>
    </li>
    {loop="$communities"}
        <li
            class="block"
            onclick="MovimUtils.redirect('{$c->route('community', [$value->server, $value->node])}')"
            title="{$value->server} - {$value->node}"
        >
            {$url = $value->getPhoto('m')}

            {if="$url"}
                <span class="primary icon bubble">
                    <img src="{$url}"/>
                </span>
            {else}
                <span class="primary icon bubble color {$value->node|stringToColor}">
                    {$value->node|firstLetterCapitalize}
                </span>
            {/if}
            <span class="control icon gray">
                <i class="material-icons">chevron_right</i>
            </span>
            <p class="line normal">
                {if="$value->name"}
                    {$value->name}
                {else}
                    {$value->node}
                {/if}
                {if="$value->description"}
                    <span class="second">
                        {$value->description|strip_tags}
                    </span>
                {/if}
            </p>
            <p class="line">
                {$value->server} / {$value->node}
            </p>
        </li>
    {/loop}
</ul>
<br />
{/if}

<ul class="list flex third middle active card">
    {loop="$posts"}
        {autoescape="off"}
            {$c->prepareTicket($value)}
        {/autoescape}
    {/loop}
</ul>
