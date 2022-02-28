Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEAC433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB45DC340F4; Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D605DC340F3;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646060417;
	bh=xze+597WLfjRQZJtpz2TcRnT6SwSGiRpJDoNs2UJgX4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FNr2mAYIV7GN5u4Vqn9zJOZmFPmZlsvv8fGT8oqpEwt57hQWCVTHHfjONKGmWo/m4
	 H2uooZkEoJbwyJdyBIgSOq+nfJQMxDuq4mn25ylZltdBU2aVDY3LtxJE8K9vmdRnpQ
	 TB5D4Dz2o21TgDPdV4XieKzAE6vAaVzjjRuOJvNg3i/kxLQRKN8Oiv53tSGPfq4Iga
	 KUbDq/35Bk8XMllvRgtjsWdefHZ9hUz/bITrDiBYxmyL2Bz4bDLTbQrDqEk6RbbQHO
	 M6NAE8EwkmvskOy+W8GVLBeUDCfY6A4qO9YDlN5TWXNKGDTJVUFzUMC+fhchJFWD3/
	 KEWfg8EZIXbrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9A4AEAC095;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc/tegra: Changes for v5.18-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164606041775.949.9853495317456290473.git-patchwork-notify@kernel.org>
Date: Mon, 28 Feb 2022 15:00:17 +0000
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 17:47:37 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc/tegra: Changes for v5.18-rc1
    https://git.kernel.org/soc/soc/c/345932db14e3
  - [GIT,PULL,2/5] dt-bindings: Changes for v5.18-rc1
    https://git.kernel.org/soc/soc/c/cba4cdeb35a2
  - [GIT,PULL,3/5] ARM: tegra: Device tree changes for v5.18-rc1
    https://git.kernel.org/soc/soc/c/f08a71d29d9d
  - [GIT,PULL,4/5] arm64: tegra: Device tree changes for v5.18-rc1
    https://git.kernel.org/soc/soc/c/664abe886602
  - [GIT,PULL,5/5] arm64: tegra: Default configuration updates for v5.18-rc1
    https://git.kernel.org/soc/soc/c/53238ebcfa56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


