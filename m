Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3A3C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 24CD523B16; Tue,  8 Dec 2020 23:10:33 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.11 (#1)
Date: Wed,  9 Dec 2020 00:09:40 +0100
Message-Id: <160746884569.2839681.4641297073633961685.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <87eekaj0i4.fsf@BL-laptop>
References: <87eekaj0i4.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 17:02:59 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.11.
> 
> It is based on v5.10-rc2 because some fixes on the device tree has been
> merged after v5.10-rc1.
> 
> Gregory
> 
> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a2f9886a9ea55c3ea973048eb5cf3d972dfecb90

       Arnd
