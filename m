Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BC1C636CA
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 193B061374; Fri, 16 Jul 2021 21:25:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 551A5613E3;
	Fri, 16 Jul 2021 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470707;
	bh=qDVWi0rKR8obdtzuoYtx5h0eArB5K+BEGwcPu7gqtko=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+8BXsjTDbG+fK8b1NwZxabM/bUwd9ZditDM7Q6j2bSvsb2kxRXnGhkdFeO5fNWr3
	 fOJGuwpAMQbIBDuCpS9YSpkE7vc96C+fTSz0GEYlfUTaZbOsW1BIU3BVjCne5ZF7vT
	 tmTSouSVh1k90meASHh5GjPUmbRHXIMMkPMw4qICMLFj2ub/J01APeWIkaXIK7rMZu
	 RImKD9+sFoFwO2YMeBwtHBMAWYRuISR1AhheZKrCHy7ri3vKhxNVA9bdJ0wxR11igM
	 m+7mgDkEL86zKZzzrFmVeHSLrdV3t/BVzQEvZfjKBGmlwUbGAyd7J4QhJrVOgvKSF2
	 7d0SHq5gWv5+A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>,
	Zev Weiss <zweiss@equinix.com>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree fixes for 5.14
Date: Fri, 16 Jul 2021 23:24:44 +0200
Message-Id: <162647049998.3478428.1864031111660370458.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
References: <CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Jul 2021 04:31:59 +0000, Joel Stanley wrote:
> Here are some minor fixes for the aspeed device trees.
> 
> The following changes since commit dd87684c7c9b82ad450cf063c58b4131074ad8f2:
> 
>   ARM: dts: aspeed: everest: Add pcie cable card indicator leds
> (2021-06-07 13:38:55 +0930)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 8825f2744d944e5666c28bb04a84abdcef27a7e6

       Arnd
