from django.conf.urls import patterns, include, url

from django.contrib import admin

from wiki.urls import get_pattern as get_wiki_pattern
from django_nyt.urls import get_pattern as get_nyt_pattern

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'test2.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    
)

urlpatterns += patterns('',
    (r'^notifications/', get_nyt_pattern()),
    (r'', get_wiki_pattern())
)
