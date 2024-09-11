Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E32EE4982
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77AB2C4CECC; Wed, 11 Sep 2024 09:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E02C4CEC5;
	Wed, 11 Sep 2024 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046451;
	bh=n9wm6VL7cL6KQ/Q1x/lNROs48bBrbdot5bfiJaF/gUs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=W3g8HvSAnW1SODmmssGkHKKSL2TRCRRYb1p8KOqMEXpSaLImvS+Ls4MyZmqFPmu0C
	 DAkDXqsF+8216G3Ia5/atQdyHX2QWznIP4Omo5ykuJBryq0QmqFQ+kzF1dzJ6pYKpc
	 /Wn5RS+kaopD1DL+mgsn6+I4kZkDc9J8HiCVsVEYnoolSXlovIbv4EqXtIFHZTDvqd
	 0UBSQOJSIEgKmgxDRYsm0ioygP4uKENGlhjoHHcnanRfuniflZeHQh0yjHiU2bNciu
	 eDPowjV0p+Tl2U9xdw2Hl8Y++rGWEgGeKDvfb54FR9yCQxDzV1maAlSWSj+PpuJZ/R
	 Ghn1PfhJjKT3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBFF3822FA4;
	Wed, 11 Sep 2024 09:20:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek arm64 DTS updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604645225.555636.9700486458240987319.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:52 +0000
References: <059656ad-5365-4097-86a1-f4ba43edf5da@gmail.com>
In-Reply-To: <059656ad-5365-4097-86a1-f4ba43edf5da@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Sep 2024 21:05:32 +0200 you wrote:
> Hi Arnd,
> 
> Please find below the patches for the MediaTek device trees.
> As you can see it's quite a bit, but several of them are actually fixing
> problems that were encountered. Would be great if you could find the time to
> pull them. Sorry for the delay.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek arm64 DTS updates for v6.12
    https://git.kernel.org/soc/soc/c/d053652f386e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


