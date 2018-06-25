from django.shortcuts import render


def scan(request):
    """
    View function for scan page .
    """
    # Render the HTML template index.html with the data in the context variable
    return render(
        request,
        'scan/html/index.html',
    )
