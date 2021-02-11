Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2626FC433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:04:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E6CF364EE6; Thu, 11 Feb 2021 15:04:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 673FD64EEB;
	Thu, 11 Feb 2021 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055865;
	bh=+jRoaD3iDwRW6TssAdozKbV2lWhdbP0kdSOL+xK/aNc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFrz9l/D80OFyMamSVIO6KHbjBK+rSIk4//bXhMB1KEGOYbX1wu+fw2GB2ISOxxHD
	 ilJ4mgWKra18d6S237jEOOv8LvjN2piFN5f36W3ZNVysdgXqPpcM5Wk8F6W7TO2e8H
	 xykg7hbvS0/p9v4gGv61YOB9SOfBpqxcXS27vy55A0a8zCq56nGPfYXdbVqXcNDPJm
	 HtKTXkufcz/u6mWV//pKws1jI+qmU1Igm3AVM/HqkSOoEXFli+WPurMgqAehemdp/i
	 TzI8SuoUAFf55eaQoJBUW8Q9A9mrsPbgHXTZBGvCuXhOxUEUr6RbOO1izoJJcrJIJ+
	 CigTtHobl4XRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm <arm@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
Date: Thu, 11 Feb 2021 16:04:20 +0100
Message-Id: <161305573907.259289.4679154731626442010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
References: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:28:23 +0000, Joel Stanley wrote:
> Here's my late pull request. I've deferred some LPC device tree
> bindings rework that need a closer review, so the contents of this
> pull request should be straightforward.
> 
> The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:
> 
>   ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
> 21:21:36 +1030)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 52ded9eaa25a203e59142db252d0bc2aae80a2c2

       Arnd
