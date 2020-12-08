Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A341C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D894823AA8; Tue,  8 Dec 2020 23:32:25 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.11
Date: Wed,  9 Dec 2020 00:31:38 +0100
Message-Id: <160747024185.3766805.7396434572354620179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <7him9ljgtr.fsf@baylibre.com>
References: <7him9ljgtr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 01 Dec 2020 14:34:56 -0800, Kevin Hilman wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4879de98ca746abfb1a76f8755fb46a37fe42903

       Arnd
