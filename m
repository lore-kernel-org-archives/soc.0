Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482C3C3DA40
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20B2AC4AF12; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B24C4AF0B;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=bhWyn3B6Q6+cEhfNVFP1Y3It3+rXMpbt+yc+b3cdntw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N+ZR1mnnVacukYCWApK5SiWgTAnaj1KAKhaubXbHC8uJAWKH6GKouRRZBqw4UCSEc
	 joDbpdAaKcO2zn6+qIfW02TQXWZlpngXKi31x+qQ1MJX0CiwtYfKwUs81sNzgQJDIQ
	 nJSe7PNMY9mYEU4+6CiarGZd3E0m491WkFB0g40nQJhR+95boxSX5Vd4AQnJ2pmB6y
	 l2N8Q6cQ6qPAyTzjP9WmSNajPszT5eJc4jeo1HjU4kssw286mRNXlnqXAZFBxD7LUY
	 u5890H3RVqc96R/SiECigtzCbtckInYrBOutEwep18Rc20hh7KJlqml7Cnm9vnJMDl
	 QFZoRhOE57TCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E513BC43445;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046393.29698.15025329254469913915.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:03 +0000
References: <20240626210728.21295-1-dinguyen@kernel.org>
In-Reply-To: <20240626210728.21295-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Jun 2024 16:07:28 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: updates for v6.11
    https://git.kernel.org/soc/soc/c/4bd85abedac9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


