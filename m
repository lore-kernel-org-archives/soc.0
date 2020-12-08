Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E80C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CA7723B1A; Tue,  8 Dec 2020 23:10:09 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: at91: DT for 5.11 #2
Date: Wed,  9 Dec 2020 00:09:35 +0100
Message-Id: <160746884848.2839681.1016197720805064475.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206013840.GA627225@piout.net>
References: <20201206013840.GA627225@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 6 Dec 2020 02:38:40 +0100, Alexandre Belloni wrote:
> Arnd, Olof,
> 
> Here is a second round of DT updates, Some are following patches series
> that made it in other subsystems and it would be nice to have them in
> the same release. Other are fixes worth having in v5.11.
> 
> The following changes since commit e1062fa7292f1e3744db0a487c4ac0109e09b03d:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: f8ff2f057e745412204b5f42a439691310a6acc2

       Arnd
