Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F39EED60D
	for <soc@archiver.kernel.org>; Thu, 12 Sep 2024 14:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6670C4CEC4; Thu, 12 Sep 2024 14:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08F5C4CEC3;
	Thu, 12 Sep 2024 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726151431;
	bh=n54clzfxT+LSQ7Jq0YyrRwl3MWd1HtfHiTfHOAH2Moo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aSPeObyfJBUhO/f3lHISfJq4QAnK22iwbXCwRDJ6cMOdc+Crlg5T75od9rpXKrQC2
	 eD9FFGLlm6Nr4l+myPh4dmVvobIU7t+/dsYys1AT34A42GTDDO19ew0Gq2Xt++istL
	 4jwRrl5ACWG6tI5wCTtYHjYitYWfyjqMrwWQllkY9odapLgk8ut/M8clLi8ZipgYJ4
	 KdGAAcPdBw67HK8wBiOn+N6xuf6IUnbEnmjAeSqCQ0b2IbfVctk4tF0dGpYNVzYtb0
	 nTxxlKK0lKDwp0qZYYUhuiRhAOkKi4uY5PfqNF4jp4DPOPTFFOzbuPRLrJLIm4tbbX
	 UbLUnCjkoiLcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE93822D1B;
	Thu, 12 Sep 2024 14:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner SoC device tree changes for 6.12 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172615143303.1611582.7417169338132899776.git-patchwork-notify@kernel.org>
Date: Thu, 12 Sep 2024 14:30:33 +0000
References: <ZuKmwD8VQrvNx8ir@wens.tw>
In-Reply-To: <ZuKmwD8VQrvNx8ir@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 12 Sep 2024 16:30:56 +0800 you wrote:
> Hi,
> 
> Here are a couple more Allwinner device tree changes for 6.12.
> Please consider pulling them.
> 
> 
> Thanks
> ChenYu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner SoC device tree changes for 6.12 part 2
    https://git.kernel.org/soc/soc/c/168c3e0d4435

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


