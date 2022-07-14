Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB04C43334
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7318EC34115; Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56066C34114;
	Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657815030;
	bh=My59zynGfF04DHm31KCI/JWWlqqmnkuvRPE1U9MpF9w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PM4m/7nE5x++StAQ2AjWURUCyCSGUN911WCjN80XDbCK53eBhaxWextTeG61YQ0oI
	 BKXm0C0qxxKVPGxROUlSYvzWTLndae+NmhkHuIx00DpHHwCFLMNRX87czLDl5yGRXL
	 0oGLrvdsAVJiKfF5yvry1p5lfDUX+etf/DRi2GeoqwoMREmsp4IN2uPFRLBuGej6r4
	 0RIOb9yEr07TMPYXJJtYj/gDF2ewzKQtrXHKqrNLjY5+t/FKUNxb3Wi3+gXgef0qRC
	 3mTWEi9DU26RLA5jSCsmFqKW2V6oBbNSywSDyEu4jU8ztNIeOqa95GH4qL6eaWv+Cb
	 sb8itcb374mHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41AC2E45225;
	Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] Broadcom SoC updates for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165781503026.2313.16321610168750623234.git-patchwork-notify@kernel.org>
Date: Thu, 14 Jul 2022 16:10:30 +0000
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Jul 2022 09:44:44 -0700 you wrote:
> Hi Arnd, Olof,
> 
> The highlights of the pull requests are:
> 
> - William and Anand add support for a large number of Broadband Carrier
>   Access (BCA) DSL/PON/Wi-Fi router chips under the ARCH_BCMBCA umbrella
>   and we expect to see more activity in the future on these chips.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
    (no matching commit)
  - [GIT,PULL,2/7] Broadcom defconfig-arm64 changes for 5.20
    (no matching commit)
  - [GIT,PULL,3/7] Broadcom devicetree changes for 5.20
    (no matching commit)
  - [GIT,PULL,4/7] Broadcom devicetree-arm64 changes for 5.20
    https://git.kernel.org/soc/soc/c/3476ccbd0ae6
  - [GIT,PULL,5/7] Broadcom drivers changes for 5.20
    (no matching commit)
  - [GIT,PULL,6/7] Broadcom maintainers changes for 5.20
    (no matching commit)
  - [GIT,PULL,7/7] Broadcom soc changes for 5.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


