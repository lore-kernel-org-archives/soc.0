Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9329C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF1D623AFB; Tue,  8 Dec 2020 23:10:35 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.11 (#1)
Date: Wed,  9 Dec 2020 00:09:41 +0100
Message-Id: <160746884544.2839681.10004626327911340660.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <87h7p6j0m7.fsf@BL-laptop>
References: <87h7p6j0m7.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 17:00:32 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt for mvebu for v5.11.
> 
> Gregory
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9bc08aa60f56748a06814f4f1366522a483c57cf

       Arnd
