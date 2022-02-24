Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6596C433F5
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A2F3C340F4; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D01C340F1;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740034;
	bh=AFjY4K4br/AfJOl5+uD5e8AVI05RrR+El3jgiIGJcok=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EQa4i/qdCH9W1fNgU/oFhrsfF30xJvfANvzzua5NHn2xNt/2Bwdf5RI/tGhf9WjkU
	 v9kcYWoVmgWRVV7lRBmnqO02exGXQ1k3Hvc2b0cEzO0e+k9DtqjmZKMLLc3O3bWaVS
	 VVV63/KE4A42k745omx0OOBBdde05nh/x9j2xgRSFoJAzYEbmWR++FWMweM8yg3h0x
	 n5/IRoE+H7wbOMRtyKZvLooGRJ8GHJXxyoDbsoGaRbddFLxJZLrKEvZ8NRwiY3ghg8
	 8CqGuNLNKLKDFFBdatvdSdfMyEkVGGVodnO/DHxH1zxEWUv4ufrtq9lsJ9D5+r5I6G
	 hc+EfDdLsPChQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 545AEE6D3DE;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574003433.25177.9431925353279409862.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 22:00:34 +0000
References: <1973741.CViHJPHrxy@phil>
In-Reply-To: <1973741.CViHJPHrxy@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Feb 2022 12:46:06 +0100 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.17-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.17
    https://git.kernel.org/soc/soc/c/795a2ab1da7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


