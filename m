Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03425C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:41:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA1F223BDF; Wed,  9 Dec 2020 16:41:45 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.11 (#1)
Date: Wed,  9 Dec 2020 17:41:35 +0100
Message-Id: <160753194681.3961338.9506933250014235951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87k0u2j0n7.fsf@BL-laptop>
References: <87k0u2j0n7.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 16:59:56 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for arm for mvebu for v5.11.
> 
> Gregory
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 4bdfafd6ff2938057df1fbc586db9a9c61541beb

       Arnd
