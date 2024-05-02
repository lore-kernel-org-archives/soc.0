Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FAEC4345F
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13820C4AF14; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECE7DC4AF19;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714659038;
	bh=ISB+8rP55ChLfdANSS4L6s6eraC4vggIIDeaJOiC3SY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mJdKy6xQp+L/CaKGQqZrPHxaqiXA/GfbAq8oUYiJcjGSetLBWODdpyghs1iNt7ofG
	 2yjzD4XS9Y8J/R95sODhMzHYXy7EaNLPqx/yH4HQLc8cKUV/QD5vF8sh5re60pcwUB
	 airhx+3zkIZx+nXJYt7b29w0mu3AT5iv8In9/aCB9XII/JZ4BHLkcQlK9FD89bV1rz
	 WsrErBZ24TvO5VT9iQBxRy6OvsypuSM4gkDmg9iB1df9fm/iqgva6jBshWXJHEECmk
	 +q0pCe5hXrfJXmjS6IGmBOaJWNKdCUf9NW2LcLF8kDKajwGKZFB0nuuf4wXTl7zySM
	 9F0NWRilzzlHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D77B3C4333B;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Driver updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171465903787.21409.7149574219028477898.git-patchwork-notify@kernel.org>
Date: Thu, 02 May 2024 14:10:37 +0000
References: <20240501124300.i5jzeugdlrlnfg22@undrafted>
In-Reply-To: <20240501124300.i5jzeugdlrlnfg22@undrafted>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 May 2024 07:43:00 -0500 you wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Driver updates for v6.7
    https://git.kernel.org/soc/soc/c/e0678631328b
  - [GIT,PULL,2/3] ARM: dts: ti: keystone: Updates for v6.9
    https://git.kernel.org/soc/soc/c/832cf6e17643
  - [GIT,PULL,3/3] arm64: dts: TI K3 updates for v6.10
    https://git.kernel.org/soc/soc/c/d10ee71072e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


