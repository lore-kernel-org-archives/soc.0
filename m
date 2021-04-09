Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2249C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:18:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD9C561106; Fri,  9 Apr 2021 07:18:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F88661107;
	Fri,  9 Apr 2021 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617952706;
	bh=2mWb3+F3h0vGmR85tMfMYETiFUZhbud9i7NI+IMO9pE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AbKSnn28w5EJo1scRp166/oa/7BV2oqBWO66yVtmAx/tWC28KtWWFKzvlkOjn2AU0
	 9jzbxKN8nj7sfyEvjhunUmzGj/Fb9l7QX72FfvNi//DcWuwKr41+ikR8oqviPBwoVb
	 h37E59y8nb/ZlJpQiFTo6nIvKs2H3t6QjPhmt/jlwmWtxepSSXJSIRK6nO/F/2op2N
	 xAIo7owvReEF57qJaGteeJSBkd1REnQF3UaQw0D3epNm2IHLF1L0ru7saqMT5O0OOM
	 HrG5ozgjsw06TP522ZwKDS4psU1K8j9eeDu2dwhYqXgn9J99VhaLOdL/e04+GGstkN
	 ycvivTGQZmw8Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: lpc changes for 5.13
Date: Fri,  9 Apr 2021 09:18:20 +0200
Message-Id: <161795267844.1750068.14862109207368145425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
References: <CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:29:52 +0000, Joel Stanley wrote:
> This is a pull request containing a slightly messy device tree and
> associated driver changes for the ASPEED systems. It corrects some
> design decisions made when first mainlining support for the BMC
> devices on the LPC bus that have stopped us from being able to write
> drivers for eg. KCS.
> 
> Andrew has worked with Chai-Wei from ASPEED on this process. These set
> of changes have acks from the maintainers, and allow Andrew to go
> ahead with fixing the KCS drivers in the future. The branch should
> apply with no conflicts no matter which order it is merged.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: d60f314b93b637e9721c406f5a61cf2157e59b48

       Arnd
