

This is a demo Live Discussions app.

Download the project file or clone it and then follow these steps to run this application: 
<ol>
<li>rake db:create</li>
<li>rake db:migrate </li>
<li>rails s -e production (for Rails 4) </li>
<li>rackup private_pub.ru -s thin -E production</li>
</ol>

It allows the user to create private discussion rooms and create a secret key for members to join in.
Its a demo app explaining the use of Faye with Rails.
