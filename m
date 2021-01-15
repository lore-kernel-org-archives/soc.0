Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D78C43381
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:22:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30B3D2388B; Fri, 15 Jan 2021 17:22:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B9962339E;
	Fri, 15 Jan 2021 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731334;
	bh=rJS0doBJgN511kYDMEKPuXH/hTO65VVOcmWmFrt1O3A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQKdmqaUEXfVuQVOBgwIMWvceciZH/oi5DGvyy2z6hP/JQgXqN4Ze7qNUZ7o0+LE8
	 j8eF8m/nn+p3nWQ1esON0VtILDKSQF91blP61dZmjZAwYLOHxvAN6unt3KqbFNCrrA
	 Bmka1SG1oSb6jzsHX7P0fI+G1VnyBaBVWyfw7Ed0H3RmvL7Wh199H/oD1acAdGN6uG
	 SHmu7/IL0iCwNrYGWi2VPpEerQYvZPHr13ZQ5EtfgZMVYNqpt+7hTYFokCbsBb/pBk
	 q39OhR0gaptrPr6q/jbWWqIEKpC5VGT5BIs1zH8pyVpyVRh/ZLYINVuCAlrrlMMqsd
	 gybCMuOh7e1YA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
Date: Fri, 15 Jan 2021 18:22:06 +0100
Message-Id: <161073123818.625238.784153877114947970.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213225517.3838501-1-linus.walleij@linaro.org>
References: <20201213225517.3838501-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 13 Dec 2020 23:55:17 +0100, Linus Walleij wrote:
> The Ux500 platforms have some memory carveouts set aside for
> communicating with the modem and for the initial secure software
> (ISSW). These areas are protected by the memory controller
> and will result in an external abort if accessed like common
> read/write memory.
> 
> On the legacy boot loaders, these were set aside by using
> cmdline arguments such as this:
> 
> [...]

I had mistakenly not applied this last year before the merge
window, as I misread the description as being not very urgent.

On second look, this seems important enough for the v5.11
fixes branch, so I applied it now.

[1/1] ARM: dts: ux500: Reserve memory carveouts
      commit: 8a996b2d8a03beae3cb6adfc12673778c192085d

       Arnd
