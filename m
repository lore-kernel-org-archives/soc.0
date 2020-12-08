Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC78DC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE88A23AC4; Tue,  8 Dec 2020 16:08:52 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee.jones@linaro.org>,
	khilman@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net
Subject: Re: [GIT PULL 5/5] Broadcom drivers changes for 5.11
Date: Tue,  8 Dec 2020 17:08:40 +0100
Message-Id: <160675365619.2641537.11030203290965940491.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128163410.1691529-5-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com> <20201128163410.1691529-5-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 08:34:10 -0800, Florian Fainelli wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e9ab9c337beecd41f4cc98d536cd6299264d818f

       Arnd
