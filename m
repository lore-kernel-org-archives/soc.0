Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD979C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96EC223B1A; Tue,  8 Dec 2020 23:11:05 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	t-kristo@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64: TI K3 DT updates for v5.11
Date: Wed,  9 Dec 2020 00:09:52 +0100
Message-Id: <160746884594.2839681.8722391797476584584.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201130174258.ljsiokkyr7x7tsbd@covenant>
References: <20201130174258.ljsiokkyr7x7tsbd@covenant>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 30 Nov 2020 11:42:58 -0600, Nishanth Menon wrote:
> Please pull the following for TI K3 dts changes for v5.11 window.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e40917e4664e490d5f5b7a4cbd83ee9f46d27113

       Arnd
