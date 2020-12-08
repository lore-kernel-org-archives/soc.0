Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE4BC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDE5323B19; Tue,  8 Dec 2020 23:10:45 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.11
Date: Wed,  9 Dec 2020 00:09:45 +0100
Message-Id: <160746884747.2839681.8297968608115515510.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7heek9jgox.fsf@baylibre.com>
References: <7heek9jgox.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 01 Dec 2020 14:37:50 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Note that this branch pulls in a tag from the clk-meson tree which has
> already been queued for clk-next.  This is for a couple new clock IDs.
> I also included my amlogic-fixes tag (which you've already pulled) to
> fix up potential conflicts.
> 
> Kevin
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b03455ae3c8a7e7999f9cc43ad87c63b44a89344

       Arnd
