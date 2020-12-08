Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD44C4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:11:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1848F23B04; Tue,  8 Dec 2020 23:11:08 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	olof@lixom.net,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] ARM: dts: Keystone DTS update for v5.11
Date: Wed,  9 Dec 2020 00:09:53 +0100
Message-Id: <160746884670.2839681.8332418226618302281.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1606851472-26593-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1606851472-26593-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 11:37:52 -0800, Santosh Shilimkar wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 30912c3ce6b1d453836d102152403b3aca5dd5f5

       Arnd
