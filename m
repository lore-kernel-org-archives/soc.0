Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB99C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:30:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4120A23CD1; Wed,  9 Dec 2020 20:30:49 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	arm <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.11
Date: Wed,  9 Dec 2020 21:30:38 +0100
Message-Id: <160754580117.2405127.13379631047169707253.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
References: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 06:30:44 +0000, Joel Stanley wrote:
> Here are some ASPEED changes for the 5.11 merge window.
> 
> The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:
> 
>   ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 419fd286274e32c2533f1305d76b04b32ae49853

       Arnd
