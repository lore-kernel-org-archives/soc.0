Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0222EC433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D67C32399C; Fri, 15 Jan 2021 17:24:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A33BB23877;
	Fri, 15 Jan 2021 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731491;
	bh=1b62CfmuOHWLq8meTgGv+ji63sjNsNopr3xpQCEBj5Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n4HGgspm72ZsliyG91UExiAbksjoZeCcpIAZ3WQv3rEnplSZAQMMcsRL9/n1WCwNk
	 noRe3xjQwDGhjf78H9QwFwwTxudbG9FGNVab4rxd0vTzPRKo9EUasp7g1EQBPrxJot
	 3HAwLyU53XRyvfuUDg7yem+iNAN51TitDZVyZyKOWUkUc0QXPzcUDkn2eVHzH4mQhW
	 vSK6vLhiHLK5IfLjpN0QLc+583HPD1FO1jZIHiWOh9WIYbiOUR46mgl9rRSNYhc/mg
	 qXplRRjw7qSz0F5sMBzQk92R0lYYpge9kkAiQ/ab3I5so5BOlwL8a5rCfgaSTLzoyc
	 lYd90qtlTzd/g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] berlin dts64 changes for 5.11
Date: Fri, 15 Jan 2021 18:24:40 +0100
Message-Id: <161073140360.707311.14001450832858422143.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100235.2b0b795b@xhacker.debian>
References: <20201211100235.2b0b795b@xhacker.debian>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 11 Dec 2020 10:02:35 +0800, Jisheng Zhang wrote:
> pull pull the following patches to your tree.
> 
> Thanks.
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

These two came a little late for the merge window and did not seem
urgent enough for the bugfix branch.

Merged into arm/dt, thanks!

merge commit: 35d09d1ad45160101733f116d1283907d8a28ee2

       Arnd
