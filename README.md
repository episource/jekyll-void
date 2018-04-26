# jekyll-void plugin

A jekyll plugin that adds a `void`-block to liquid: All text within this block is suppressed. This is useful to suppress unwanted newlines that can be caused by subsequent lines of liquid tags.

This plugin is proposed on the idea of user [reitzig](https://github.com/reitzig) on how-to solve [jekyll-ticket #4002](https://github.com/jekyll/jekyll/issues/4002). In contrast to his code, this plugin suppresses any output, not only newlines.
 
## Prerequisites
Install this plugin by cloning this repo to a submodule within `_plugins`. Nothing more.

## Primary Usecase
Cleaner template code:

Without `jekyll-void`:
```liquid
{% comment %} comments are used to prevent newlines from being written
{% endcomment %}{% for p in site.pages %}{%    comment %}
{% endcomment     %}{% assign x = p.y %}{%     comment %}
{% endcomment     %}{% if x == nil %}{%        comment %}
{% endcomment         %}{% assign x = p.z %}{% comment %}
{% endcomment     %}{% endif %}
...
{% endfor %}
```

With `jekyll-void`: See `Usage` below

## Usage
```liquid
{% void %}
{% for p in site.pages %}
    {% assign x = p.y %}
    {% if x == nil %}
        {% assign x = p.z %}
    {% endif %}
{% endvoid %}
...
{% endfor %}
```