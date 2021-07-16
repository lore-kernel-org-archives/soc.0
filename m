Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E46C636CD
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D8CF7613C0; Fri, 16 Jul 2021 21:25:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56B3A613F5;
	Fri, 16 Jul 2021 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470717;
	bh=V6so0Ce82pybLPi5St9R8aT7QbChZQDUHRQyttwxitc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbucqlljEZY3cXIchAmyn5CPFhTuMMlP9gR1rS18joY4+z43HJBImzI/JmpYqXSdt
	 VduVhS/pd6wLKqxuTR+3tvLZYf5tmm1G+u/NcQQ14zPLhS+/0AXukMj3uOkWq5Zljx
	 RWgC3818SDo4ftlz6dqYEDedxkKdutGAYP8xOSePU25HbrIR/n9OcmFDWj2nk3PM/5
	 RWS4GnpXQG0YZFJkYXFHY4U1IVZdtlGWPUykIiI/DbEPvchvqlsqy5Xefz6FyEBMd9
	 dvNyAjSI7s44MqoO1PXqHrz9GlSo149dDZT0NzdtUVMii9nMO3hcy28kJWRZU+jBXm
	 twAgTO7SaiY5A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Versatile defconfig
Date: Fri, 16 Jul 2021 23:24:49 +0200
Message-Id: <162647049954.3478428.48874703187519246.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714081819.139210-1-linus.walleij@linaro.org>
References: <20210714081819.139210-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 10:18:19 +0200, Linus Walleij wrote:
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

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Versatile defconfig
      commit: 850d8ec92735b3d58b81363c4ae29932a2ebbabb

       Arnd
