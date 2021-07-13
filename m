Return-Path: <SRS0=WaVp=MF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9862FC07E95
	for <soc@archiver.kernel.org>; Tue, 13 Jul 2021 14:01:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 77D8B61249; Tue, 13 Jul 2021 14:01:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 1906C608FE;
	Tue, 13 Jul 2021 14:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1906C608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9292F6D;
	Tue, 13 Jul 2021 07:01:04 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9645C3F694;
	Tue, 13 Jul 2021 07:01:03 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:00:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update Vexpress defconfig
Message-ID: <20210713140005.h2hsxirhduaho6fm@bogus>
References: <20210713133708.94397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713133708.94397-1-linus.walleij@linaro.org>

On Tue, Jul 13, 2021 at 03:37:08PM +0200, Linus Walleij wrote:
> This updates the Versatile Express defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - CONFIG_CMA options were moved around.
> - CONFIG_MODULES options were moved around.
> - CONFIG_CRYPTO_HW was moved around.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please apply this directly for v5.14 if Sudeep is
> OK with the patch.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
