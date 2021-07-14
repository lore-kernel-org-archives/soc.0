Return-Path: <SRS0=FRvj=MG=chromium.org=keescook@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B43FC12002
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 19:13:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E429D613BE; Wed, 14 Jul 2021 19:13:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B335A613BF
	for <soc@kernel.org>; Wed, 14 Jul 2021 19:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B335A613BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=keescook@chromium.org
Received: by mail-pl1-f171.google.com with SMTP id h1so1946831plf.6
        for <soc@kernel.org>; Wed, 14 Jul 2021 12:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tq5Rbv8bzwrDDVrwhgPg4WPczUOrV+tBerddQbsxWx0=;
        b=bPOVbGgrvLLMODNizeKM276JiM3m/EbAyoGYd5cSE3Pv6J4MCTsQVvXXnfRZxSAv4u
         Y6lFuUbaPvumFzMNZkb6jiug9Q24tKekLHXB5EZQqWlQyxZJdLGVR6QQMlqPstO8vvdX
         bXcNF1EC9+/tuMxdP6D9951/B9AdWkOw9DRmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tq5Rbv8bzwrDDVrwhgPg4WPczUOrV+tBerddQbsxWx0=;
        b=WSaZcas4mGl/BYNGXGyU2NAg3wOO2KvI0BddtbC6qjT76mEmwd+3vVuSabD7aLOudY
         PRwOUHUt5Lbsx7sEiJyjF9Wp/jbFFQtP4QtHP7em+584iS0pMFfi+cvrTzLbS15mY0w5
         e9Fdr2hOIinjJY5x6EMzaWvr7uUa1J0JvrtJ1LqO6TdEgXEvjBdO5UXDCT9tDZORye1l
         ceZD5rw+spsVaKmePaW7ra9attTv5ERQph8UBdu0tNFznusuInm1ReY3iuFphoqVJrfN
         AY9Pw6Bnap7thmn5BS3x8BiSIUnK0s4OV+nK8nU+AmhKNL8o7jGDCCskf5ECXnAiOsXI
         HK5A==
X-Gm-Message-State: AOAM530BT+wiwtt0n+AoZlc4hqSNdpP60iWaOdF9a+ISPP607wD1gkyl
	m/K0tpZYsCX4w1SB9erOTReBew==
X-Google-Smtp-Source: ABdhPJwq15ih5GXZEwbgl+i76yyWHxGb9zn8gsjUpX1l6FrJH1ZpIzH89Q2H0ccCDLkUwl5HzsX8Gg==
X-Received: by 2002:a17:903:2c3:b029:11b:cbb9:edfb with SMTP id s3-20020a17090302c3b029011bcbb9edfbmr8651889plk.12.1626289988382;
        Wed, 14 Jul 2021 12:13:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x30sm3655844pfh.126.2021.07.14.12.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:13:07 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:13:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Versatile defconfig
Message-ID: <202107141212.757559237F@keescook>
References: <20210714081819.139210-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714081819.139210-1-linus.walleij@linaro.org>

On Wed, Jul 14, 2021 at 10:18:19AM +0200, Linus Walleij wrote:
> This updates the Versatile defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - The Acorn fonts are removed, the default framebuffer font
>   works fine. I don't know why this was selected in the first
>   place or how the Kconfig was altered so it was removed.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Ah! Yes, thank you for catching these. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
