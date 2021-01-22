Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921EBC433E6
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5398423AC8; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B03323ACA;
	Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356411;
	bh=57AOLyYqOFfh5eJ1t32dMtcm3zl0qZMGTSpbg9oOm3A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=t7YgO18xu3nEH+yfgkvu11M9K7S0+1Ngo6zCTyicl3KcwwiVib5JjC6+/MkGGBHyK
	 ZifWkwwhK8I+y6mRrl0vn2nWinjuK22fy9M/n6N8OHFZ/0SRZBMp/lTpwVd1zqwBHA
	 U+yOTqWrWj1M2U/o9gjISz11GuyezIyjtHkFCnQZa7jbfItqIHE/es4nXRSvmjxtXF
	 RaC83t6MeDjfehkRIXNVMXtIcqeECHMLkaP6kSzlgAN2wk7rQ+pk0kT0NNSd4vGjW9
	 HMKR81XJu1Pi83/XoUv8eVvP6syGy/QwS5+q2sOC4asDiN4pXNEUPj6Mf7s/fF8OVi
	 OgCVuN3ol1yZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2B9FE652D9;
	Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Include bcm2835 subsequents into search
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641117.29035.3096662708388246009.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:11 +0000
References: <20210121203302.3639841-3-f.fainelli@gmail.com>
In-Reply-To: <20210121203302.3639841-3-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 21 Jan 2021 12:33:02 -0800 you wrote:
> From: Stefan Wahren <stefan.wahren@i2se.com>
> 
> Change the bcm2835 maintainer info in order to handle subsequent SoCs.
> After this get_maintainers.pl provides the proper maintainers for
> irqchip-bcm2836.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Include bcm2835 subsequents into search
    https://git.kernel.org/soc/soc/c/68e89bc868e1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


