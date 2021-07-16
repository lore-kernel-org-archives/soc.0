Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E34C636CA
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49496613EB; Fri, 16 Jul 2021 21:25:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1B36613F6;
	Fri, 16 Jul 2021 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470713;
	bh=cpO/LxM3zCHKVVkUgymvSlh80GUky+i1jcYfM8Il+Y0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c/LRQItv63qBXdk9l9tGZw5XISClzOf8GJm98Wv1DLnBSFGI4WmhC9qMlbqccA978
	 njL6XOvBUbEZFPe1qe35D2nFS7r1Mhc99YCt7zSnF7gr/CtmWfuur9xDbFW/gti9ZS
	 KcewFYGe0JFsYfowCoa9nT7pkJLfdsC0sLchAA7vgaJ8Ocjo+h+2uLbTNB6oOpD0sG
	 xDfypig/Yjx11eph2KyFaWSuzT7WJaO/VUASTkWtEPnmf1bjg18kluLebf7SE+yv8m
	 /KH+G7yzk70CkVIn0Xz3UgERzXl41aUjKrdzi0rvNpYyXWEV481ABNT6X0Jk7FZq91
	 P8ZVxOLeNA+Jg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update RealView defconfig
Date: Fri, 16 Jul 2021 23:24:47 +0200
Message-Id: <162647049954.3478428.6104016055388261794.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714090040.182381-1-linus.walleij@linaro.org>
References: <20210714090040.182381-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 11:00:40 +0200, Linus Walleij wrote:
> This updates the RealView defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - The CONFIG_FB_MODE_HELPERS are not needed when using DRM
>   framebuffer emulation as DRM does.
> - Drop two unused penguin logos.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update RealView defconfig
      commit: 56fa6e8a184489b47525488472e9bdcdcb59cd6f

       Arnd
