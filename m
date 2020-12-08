Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B335C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:10:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7098523AFB; Tue,  8 Dec 2020 23:10:30 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 4/5] Broadcom devicetree-arm64 changes for 5.11
Date: Wed,  9 Dec 2020 00:09:39 +0100
Message-Id: <160746884468.2839681.6281310737802168289.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128163410.1691529-4-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com> <20201128163410.1691529-4-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 08:34:09 -0800, Florian Fainelli wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1c202d0c5a67411b1d4a7af37d8bde8665972d34

       Arnd
