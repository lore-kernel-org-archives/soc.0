Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C4C4332F
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D700C36AE2; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 766E0C340F2;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740034;
	bh=oUS54ajxsKucY26Ky1xQKxNBBDytvmAYWhtDCjrhgiM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SDlzaEd+F2c9DHdtKropki5oA8V0LYw6gOevr7opVPe8Eu2vvRasDuDQi5klWUH6N
	 ot+Y0m9I5u3zjd56XCGlAYXi2cvWU25eE19VZLgOdKpnHfH81kl6aq/WcQmSoiZdfj
	 2SxzXREBqDmoCc1qfpE8MIRTAYOkG6A532R5vw3ogrAUkrHPRQfwd7DQqGKhllZL4Z
	 t99DcHvtw7KrC2s3oJlNl3BP3JPa5AfonbgLcAuxbfOytCCUeEZeZARLvwbFJ20SHJ
	 VpTsSXuFw9omDjpCEH6JO3d+OR+6BdTJcJ3Xby68/DDQN31hnaGOo8ljO7RAdCXDDu
	 M2IuWUnq7Dm4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E92BEAC09C;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.17, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574003438.25177.11754405253960682080.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 22:00:34 +0000
References: <20220221062921.GO2249@dragon>
In-Reply-To: <20220221062921.GO2249@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Feb 2022 14:29:21 +0800 you wrote:
> The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:
> 
>   Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.17-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.17, round 2
    https://git.kernel.org/soc/soc/c/3f96885eb713

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


