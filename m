Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E52C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:34:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4818860F4C; Wed, 18 Aug 2021 13:34:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE62D610CB;
	Wed, 18 Aug 2021 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629293689;
	bh=kI41ksHBqXluVmOKZ8LHnyVCAsk2ZgY/vW3TXgfci+M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X82ElnmVF/m3fC2HjFn/bmo1SkPibem9icTqXdoyXjwITcdYNJDE9cYhDaq6KFOx9
	 CWq4iQkvJp9Z1yX3nywAXTpmYwwyQUSn+wCXXCDCUI45DklKclOUIRhBb3k2OeGZ87
	 g3tB3hXl2l4UHrJ2qLpwtuH9CGJGALEFXw4XMU0ASLvqcQ7/63wvKRU1G146tTL4NG
	 CbLa3pS6nXQddQFyzpZRLNecOPcJ9598F4fokUmHbhg/g7y5xMQete0rrenMGZxq1z
	 P1EUxO5S9nmylnTLTzbUm0imz+JZ/BX86kUItiFCASpZLo1QBiacjtBvW2C90KDkAc
	 aNofRkYU5GMPA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 2/6] firmware: tegra: Changes for v5.15-rc1
Date: Wed, 18 Aug 2021 15:34:38 +0200
Message-Id: <162929367306.377646.6251992787945452705.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-2-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com> <20210813162157.2820913-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:53 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-firmware
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 8745d0e9155f0ef13656ab3447f71a8b53556842

       Arnd
