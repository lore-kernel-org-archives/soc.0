Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D84C433FE
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A94ECC340E9; Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85D19C340F3;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740034;
	bh=RtVhYLex2G5WetSD63uTht73oduw1PavR0e4c1+IWes=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OP0neDlZyOfcP0MPKYO9bX+nzZaC0H2598FLhTCpsl1UavXPlbCFa2MUgCSky2j4n
	 nZCP8lZ1CFXH3mZEgoyI966NQgHRzUG/NjXOoeDwwYO5rILyv2JUvY6GGi9gouptOH
	 mi/CL7pIy8fTAjsAxnx4qi+moUZ4DJeN2GgcARvdjNdz0+GnwKC/ib4AgE8qCpJ1WP
	 F8B5vVAacETV+Q1YVkn3tMVQEsoLbq9SoqNn+N9QNBGnV9MIxfP+KrZVc7WQ1T94hG
	 c8mfK6bU/9IO8KiElXVjp1cau4CCy5N4LGEIe+v9CTJFic3T0fEVpUHSo36HF/kIau
	 YnQ0su2OxiaiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 683DFEAC081;
	Thu, 24 Feb 2022 22:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: tegra: Fixes for v5.17-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574003442.25177.1561538865886947859.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 22:00:34 +0000
References: <20220223162209.293722-1-thierry.reding@gmail.com>
In-Reply-To: <20220223162209.293722-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Feb 2022 17:22:09 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit bd048487af68a9782ebccc3af6606e9e0d7d9f8b:
> 
>   ARM: tegra: Add host1x hotflush reset on Tegra124 (2021-12-17 14:55:32 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: tegra: Fixes for v5.17-rc6
    https://git.kernel.org/soc/soc/c/31c50bf184a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


