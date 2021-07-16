Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2211EC636CE
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0505F613EB; Fri, 16 Jul 2021 21:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E905613F1;
	Fri, 16 Jul 2021 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470719;
	bh=TE8O2TmOc+xTJGZBBVaggLBG3KUpoN3259hHM/XwCbI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pkC+hGWrTGX9fm14KgmaAeMcisjCuXBS0KveuKMRdOn1DYbGlZ9/17+WV6WEFhgN9
	 38IFbsEFT8e4ZvksgcmVAcr0cZ2q1XNddbZ2jRh+QmTzvFd5Hyos2Sw3d2gtQAWYix
	 4hymnrWJeuBpA9kNziYi76v5YP6DV25A0jXPZY3rc9Tkslg4teAdjB0RHZvdvSAiLU
	 CPTw7mbw5btedR/aF594BwATgGXLa7cb09Xn3+gaUiDE0F7praWhKMIOJQq4LJ5Fpb
	 iVIphbTfJIti33E19MW9owHJj+cfQXxTfYQKJZRFYSrggWHsGrgVwfShf38nQc4R2L
	 18FoD/MI3YyOA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update Vexpress defconfig
Date: Fri, 16 Jul 2021 23:24:50 +0200
Message-Id: <162647049954.3478428.6613741918159695075.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210713133708.94397-1-linus.walleij@linaro.org>
References: <20210713133708.94397-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 13 Jul 2021 15:37:08 +0200, Linus Walleij wrote:
> This updates the Versatile Express defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - CONFIG_CMA options were moved around.
> - CONFIG_MODULES options were moved around.
> - CONFIG_CRYPTO_HW was moved around.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Vexpress defconfig
      commit: 49e7757a73d181b35851cb01b5d285888014f8b2

       Arnd
