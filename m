Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEF8C43217
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C7A0C340F9; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB2A8C340E7;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646060418;
	bh=RkRjnvk39lcGw2HxQ8FB3B4r/4uhK2rQMuEGFdbd5co=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ajWEe2wYVyWqhl2HxHaXDtItCtOlqU7xSojMTsO7x2vFBTC8CxwiTMYqEzH1i2Mw8
	 /hPkNz/Rlzl12UslDa3OrvZwPMHeK6NqnXOew9r21Gwy4o1Du0eZOObN5srTnNMEs1
	 qOQ18j4zucB4oqeKfSl9edJL1jnaUU34N1Wz76N5/3fXK1PMUJ7IraA7gKKA2Cf1Vn
	 D3StIWH4Mz3EioMT1n7PGSB9U39aT/yIOUva/xg9/kRUT9cHFsoPNZWyJVK0V/BwM1
	 rygrgqcRZwMmG2pnhVB0f4+ybidpj0x+vJ2qe3nrtzaSHEJFPlF4M11C5YhagBy8Fd
	 3b8SIt6wWrdxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBBBBF0383B;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] TI SoC driver updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164606041783.949.6179430348837676610.git-patchwork-notify@kernel.org>
Date: Mon, 28 Feb 2022 15:00:17 +0000
References: <20220228120655.wobd72acngl2bz6k@ecard>
In-Reply-To: <20220228120655.wobd72acngl2bz6k@ecard>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Feb 2022 06:06:55 -0600 you wrote:
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
  - [GIT,PULL,1/3] TI SoC driver updates for v5.18
    https://git.kernel.org/soc/soc/c/254a1864e4d0
  - [GIT,PULL,2/3] TI K3 defconfig updates for v5.18
    https://git.kernel.org/soc/soc/c/98d4e4167e2a
  - [GIT,PULL,3/3] TI K3 device tree updates for v5.18
    https://git.kernel.org/soc/soc/c/d2717584521a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


