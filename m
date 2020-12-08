Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C33C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A078B23B01; Tue,  8 Dec 2020 16:35:31 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>,
	arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	t-kristo@ti.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: TI K3 SoC configs changes for v5.11
Date: Tue,  8 Dec 2020 17:34:54 +0100
Message-Id: <160744514104.359082.4260960430144045092.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130174850.ni4sdyz3qp67j3sz@upstart>
References: <20201130174850.ni4sdyz3qp67j3sz@upstart>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 11:48:50 -0600, Nishanth Menon wrote:
> Here is a config changes for TI K3 SoCs. This is needed for booting
> the J721E board from an SD card.
> 
> I do have a follow up cleanup patch[1] once drivers/soc/ti merges are in,
> which I think I will need to request later on.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20201112215438.31432-1-nm@ti.com/
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2ede693874c90e41a63195d06408ff3a73fcca7a

       Arnd
