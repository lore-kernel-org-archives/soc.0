Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5743FC4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C21F23D1C; Wed,  9 Dec 2020 20:32:16 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] arm64: soc: ZynqMP changes for v5.11 v2
Date: Wed,  9 Dec 2020 21:32:09 +0100
Message-Id: <160754591574.2474728.16621718804622843197.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
References: <71d38756-4456-29fc-26a3-341e1d09aafe@monstr.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Dec 2020 19:41:52 +0100, Michal Simek wrote:
> based on chat with Arnd I am sending v2 pull request which is based on
> v5.10-rc2 with dropping one patch which will be queue later.
> Arnd wanted to target arm/drivers branch.
> 
> Thanks,
> Michal
> 
> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 629c96256de49257b72407ebd256343938234cfa

       Arnd
