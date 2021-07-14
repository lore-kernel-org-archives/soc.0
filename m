Return-Path: <SRS0=FRvj=MG=chromium.org=keescook@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC0AC12002
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 19:13:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 017EA613BE; Wed, 14 Jul 2021 19:13:18 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE01F613BF
	for <soc@kernel.org>; Wed, 14 Jul 2021 19:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE01F613BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=keescook@chromium.org
Received: by mail-pg1-f169.google.com with SMTP id y4so3477428pgl.10
        for <soc@kernel.org>; Wed, 14 Jul 2021 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+/banigT8xwzvpxkKLxwlDYN4IV5XsGacUdYBQgT9U0=;
        b=diM5ZyN+GFC6bQxwpa6L5su/wU9F5NOhrQsyBHTo48LsHWaXB3Us8TvXKBffk4pzCu
         oMGeg2nCZOBrWvs3fUbuopYlYGOVTYQGZqDBn5obMrurFTqg3vcAI76iIFQcHpyK019R
         BDOcv8WeWzMh1TPAwJfz9Ggq5xKNt+FXraaGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+/banigT8xwzvpxkKLxwlDYN4IV5XsGacUdYBQgT9U0=;
        b=QXvMK58zOoD3DB1INTChUuyu4Kym/yYecgPeDrq3wnX2qQpTDUTeYJMBqe9DvssIcN
         pwTmYtgjJ1rnFFVW9Btpl7/6dYQM8g8Y8rD3Zl9MxEXix6z1FyQR3VxKFkARqIIdt4de
         yB97EGlW/u+JsCZHx9MXV+sn4Lg5Z6SwSt2m9oX56za5ZsKEcbnKe46nrceD6E0ecubX
         5n5bhHlE65Pbt7lJ7B8AViaTbVOVlScrBC+PnarkPCZcKUhVHXOtL1IEAS9bFV+ReXCA
         8pRpEfZMvE9Zf3kNH+5ClXPHC6GJs1AOJ4l2VmTduKKo3hVXC9qOxUvtF5Ze7MAIWEEV
         NKeQ==
X-Gm-Message-State: AOAM531K9yLrgeHUiOWrY+Brncil0XoIEHY/6ghUB32czPhBRf1M7OnT
	+6JbxHky6otpIFJqN3QiqrIBtg==
X-Google-Smtp-Source: ABdhPJxc/zJXr7P3oa6w3B9/04zCMfiSpX9rkNPBLeFAfwHbasNyZk/owTSD8VytUuqZcFVG2edqaA==
X-Received: by 2002:a63:e350:: with SMTP id o16mr9415540pgj.98.1626289997501;
        Wed, 14 Jul 2021 12:13:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z12sm2820786pjd.39.2021.07.14.12.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:13:16 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:13:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update RealView defconfig
Message-ID: <202107141213.BC463E00@keescook>
References: <20210714090040.182381-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714090040.182381-1-linus.walleij@linaro.org>

On Wed, Jul 14, 2021 at 11:00:40AM +0200, Linus Walleij wrote:
> This updates the RealView defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - Drop two unused penguin logos.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
