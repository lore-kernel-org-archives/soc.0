Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53133C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BB5623B02; Tue,  8 Dec 2020 16:35:19 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/5] Broadcom defconfig-arm64 changes for 5.11
Date: Tue,  8 Dec 2020 17:34:49 +0100
Message-Id: <160744514081.359082.7781137953136561582.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128163410.1691529-2-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com> <20201128163410.1691529-2-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 08:34:07 -0800, Florian Fainelli wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/defconfig-arm64
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 0f4b0b479b3566a2d61ede6e02c01a81454a0ddf

       Arnd
