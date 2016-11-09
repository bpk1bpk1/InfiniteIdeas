package com.infiniteideas;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    protected void handle(HttpServletRequest request,
                          HttpServletResponse response, Authentication authentication) throws IOException {
        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    private String determineTargetUrl(Authentication authentication) {
        String url;

        Collection<? extends GrantedAuthority> authorities =  authentication.getAuthorities();

        List<String> roles = authorities.stream()
                .map((Function<GrantedAuthority, String>) GrantedAuthority::getAuthority)
                .collect(Collectors.toList());

        if (isEntrepreneur(roles)) {
            url = "/entrepreneur";
        } else if (isAdmin(roles)) {
            url = "/admin";
        } else if (isInvestor(roles)) {
            url = "/investor";
        } else {
            url="/accessDenied";
        }

        return url;
    }

    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }

    private boolean isInvestor(List<String> roles) {
        return roles.contains("INVESTOR");
    }

    private boolean isAdmin(List<String> roles) {
        return roles.contains("ADMIN");
    }

    private boolean isEntrepreneur(List<String> roles) {
        return roles.contains("ENTREPRENEUR");
    }
}
