Return-Path: <SRS0=FRvj=MG=chromium.org=keescook@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE73DC12002
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 21:14:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C7A93613CC; Wed, 14 Jul 2021 21:14:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1964613D3
	for <soc@kernel.org>; Wed, 14 Jul 2021 21:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1964613D3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=keescook@chromium.org
Received: by mail-pj1-f43.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso2607576pjp.2
        for <soc@kernel.org>; Wed, 14 Jul 2021 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2L8P48B/qNZSFrdMjGPaBmF096bvTXbdUS5+LE7oK18=;
        b=cCkDHAVWt1k/ZvGs1SxWD1XLEmLBb2Dxa/wpS5sMZugJ744BBpKt0SAbWDKhR4Ew5V
         9dnWUOVnxTGAA4+QDXlkAYtSWWA7v8HtXoiJuRgj+g1JBnUc9fR5Ei0ev0eRnDBCV3wc
         qbXg/GXviBAtPLZ4JebCI3rAxNSQP3aKX6c9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2L8P48B/qNZSFrdMjGPaBmF096bvTXbdUS5+LE7oK18=;
        b=E3Mc0ynOKfaAgQ1sV74g7SFRa6A/1xulO+uwvv39dVr3laWoMiutmdocxTrYL+t3DW
         zUdfEkREp1UFes0SgeBQ9gTcxSfO53QFIai8PMVZOWEBiU/KrIokb3Lj8Ek1Hz1eOwQ9
         9Y/KLa5d7OOJ98lf0esJXOhx/mLPVBGe7jx+qczPQN6s1sR+RpAs8Yz6rV3lYdYR/w1v
         opG1YvYNhV40c7DHCyumR+JbcJBvYwmBkfFCUFBwcA4XYoEht6ztMPORUbk70UmWtU+q
         CVc3FGxk2a1orHnK3UDcJSJ3CF4aCgujb6MdcZAA7d87jXD2L1EM1iepFbJtb1Ih2a6d
         Xx6A==
X-Gm-Message-State: AOAM532sYRLMtiDQ3DfMNhLNfVOD9TtATHEfcQZ3F1IkPdPyiSr8Y7+d
	kA3W2B5/MpaVQUp14/s3nxVDqg==
X-Google-Smtp-Source: ABdhPJxpQFIW0tsz0QOxzj0Eb98yUmv7j3UaoTVis3BQdr0cVPAZaCCbo0BvuOnKslo/XNBl/b11PQ==
X-Received: by 2002:a17:90a:a008:: with SMTP id q8mr11506293pjp.217.1626297278344;
        Wed, 14 Jul 2021 14:14:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a22sm3803190pfv.113.2021.07.14.14.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:14:37 -0700 (PDT)
Date: Wed, 14 Jul 2021 14:14:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Integrator defconfig
Message-ID: <202107141414.C81186D437@keescook>
References: <20210714122703.212609-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714122703.212609-1-linus.walleij@linaro.org>

On Wed, Jul 14, 2021 at 02:27:03PM +0200, Linus Walleij wrote:
> This updates the Integrator defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - Drop the unused Matrox FB drivers that are only used with
>   specific PCI cards.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
