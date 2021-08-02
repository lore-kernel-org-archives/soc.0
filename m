Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D856FC4320A
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:32:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AB18061057; Mon,  2 Aug 2021 13:32:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9333E60FF2;
	Mon,  2 Aug 2021 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911171;
	bh=ggIN/aD2j3157Mtr930iWnMMqRgd5R6xZUE1fassvjc=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=owKtXUzqpVl2LnK/3+KH+w1MrePR7oR6NAzzV6QAtPaVurGmkCyYtI+9kanZPXvaJ
	 0w0osYKvRAMPCZg6o2DsT9SSYvj/6vTM2xy/gw/I0hBj33mGP6B5saDDP/ok5scGEY
	 XQiPe77ozu15ls5uac8uOKeBmLgVQmvXcJASo/YnbpJlOBlkQAiJ16+BwrSnkGeK50
	 SerOm3yauQ4kQU5D0RWa69kgx/GnY+/FeF6FV5fgGKJcrNzfqHOwQ/i47+u3qZWSTy
	 pACPwH03BToISekWLo14MIY28xUODzuXBtJC8O9IoY677qbec/D2SSj4IqEJEZaQ09
	 tjal2/bkyo1Iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Halasa <khalasa@piap.pl>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Imre Kaloz <kaloz@openwrt.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: ixp4xx: goramo_mlr depends on old PCI driver
Date: Mon,  2 Aug 2021 15:32:38 +0200
Message-Id: <162791113519.1139989.4454280837316167458.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721151620.2373500-1-arnd@kernel.org>
References: <20210721151620.2373500-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 21 Jul 2021 17:16:04 +0200, Arnd Bergmann wrote:
> When this driver is disabled, the board file fails to build,
> so add a dependency:
> 
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_preinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:472:9: error: implicit declaration of function 'ixp4xx_pci_preinit'; did you mean 'iop3xx_pci_preinit'? [-Werror=implicit-function-declaration]
>   472 |         ixp4xx_pci_preinit();
>       |         ^~~~~~~~~~~~~~~~~~
>       |         iop3xx_pci_preinit
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_postinit':
> arch/arm/mach-ixp4xx/goramo_mlr.c:481:22: error: implicit declaration of function 'ixp4xx_pci_read' [-Werror=implicit-function-declaration]
>   481 |                 if (!ixp4xx_pci_read(addr, NP_CMD_CONFIGREAD, &value)) {
>       |                      ^~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c:231:35: error: 'IXP4XX_UART1_BASE_PHYS' undeclared here (not in a function)
>   231 |                 .start          = IXP4XX_UART1_BASE_PHYS,
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
> arch/arm/mach-ixp4xx/goramo_mlr.c:376:9: error: implicit declaration of function 'ixp4xx_sys_init' [-Werror=implicit-function-declaration]
>   376 |         ixp4xx_sys_init();
>       |         ^~~~~~~~~~~~~~~

Applied to arm/fixes, thanks!

[1/1] ARM: ixp4xx: goramo_mlr depends on old PCI driver
      commit: 796a8c85b1216618258e08b463d3bef0d7123760

       Arnd
