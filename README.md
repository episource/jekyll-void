# jekyll-void plugin

A jekyll plugin that adds a `void`-block to liquid: All output from within this block is suppressed. But as you all know, a void does not come alone. Thats why there's also a bang. If a `bang`-block is nested within `void`, the part enclosed by `bang` will be rendered anyhow and a little bit of something enters the void.

This plugin is useful to tidy up the rendering output if there are many tags neatly arranged into multiple lines. Without using `void`, all whitespace between the tags is rendered to the output. This can also be amplified when loops are involved. See [jekyll#4002](https://github.com/jekyll/jekyll/issues/4002) for further information.

## Prerequisites
Install this plugin by cloning this repo to a submodule within `_plugins`. Nothing more.

## Usage
Enclose the region not to be rendered within a `void`-block. Subsection to be rendered can be placed within specific `bang`-blocks.

```liquid
<ul>{% void %}
{% assign sorted_pages = site.pages | sort: "title"  %}
{% for p in sorted_pages %}
    {{% assign navtitle = p.navtitle | default: p.title %}
    {% if navtitle != nil %}{% bang %}
        <li>{{ navtitle | escape }}</li>{% endbang %}
    {% endif %}
{% endfor %}{% endvoid %}
</ul>
```
This effecively suppresses any unwanted whitespace:
```html
<ul>
        <li>Title 1</li>
        <li>Title 2</li>
        <li>Title 3</li>
</ul>
```

## Primary Usecase
Beautiful rendering output without unwanted whitespace.

Without `jekyll-void`:
```liquid
<ul>
{% assign sorted_pages = site.pages | sort: "title"  %}
{% for p in sorted_pages %}
    {% assign navtitle = p.navtitle | default: p.title %}
    {% if navtitle != nil %}
        <li>{{ navtitle | escape }}</li>
    {% endif %}
{% endfor %}
</ul>
```
maybe rendered as
```html
<ul>


    
    

    
    

    
    

    
    

    
    

    
    
        <li>Title 1</li>
    

    
    
        <li>Title 2</li>
    

    
    
        <li>Title 3</li>
    

</ul>
```

Using `jekyll-void`, the output becomes much cleaner. See `Usage` above.

