Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8C9C12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 57FDD613F5; Fri, 16 Jul 2021 21:25:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF116613F1;
	Fri, 16 Jul 2021 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470711;
	bh=Zjg21wHJqPHvmV4tFZ4gJ3tQUfYDKYXxlNWnHU9YtH4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D78NXYYWGLHrRzrUCP0RfpgYS/ThlRF5iY2tP8tD/zFxc6W+F9EQBQ1tsjlQ0YxQa
	 p0JjSRsiqpfTHx/7FYNDf2mb61PkyawYi2n87JQNlzIpLKpR4tzg2sLkYiKmNKcpmN
	 f4rmmKWsxM3imSwTAO9B8MHEyhG+CasSHYMpJ0QmQBKmLHO5GNJhjZCjuA69j5pxtg
	 NhjJgAnFzvrBtxVQXqdIGobKVc13TmNfIPSL+Wl6zQbXYpMlJLv7vk1wCtHOtPrH2f
	 ACdzUyzF0DKaYEl/aUxFxR2+UbtXKpm4PEkasNYmfr48rymTenU0enGkU+pwtC0nvm
	 qqerByig5SlhQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Update Integrator defconfig
Date: Fri, 16 Jul 2021 23:24:46 +0200
Message-Id: <162647049954.3478428.6417418910198939224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714122703.212609-1-linus.walleij@linaro.org>
References: <20210714122703.212609-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 14:27:03 +0200, Linus Walleij wrote:
> This updates the Integrator defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - Drop the unused Matrox FB drivers that are only used with
>   specific PCI cards.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update Integrator defconfig
      commit: 2096d6feec8359203de406c424242dcb977fe1d1

       Arnd
