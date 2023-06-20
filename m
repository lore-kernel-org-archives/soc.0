Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE338C001B3
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A054EC433BF; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89CF8C433C9;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=7e7jK6376qy3dZhVKSFXjGGaGN4QW42/hVrcokBErbQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CwkKJCU4PPKTHaHKheAI6EMnuZZc6xqEV37qPMYM3r92KD7ikmhhw1W/M8Fyrg2GB
	 5iwgxUyurmXboe16jaQd4Sf8cssl6RfcEKQhft0SM9ZDTgkD2yEC5Ek4vbbO/TqdJ7
	 0Gbf+9YJMHpGPZEpiJ/bx+1CfqC3wfu2Rm4MSTmuj8AxI6GzmWt9QyjI+RcA9b/xJg
	 mjhWzinknf80Nv/vdZXFjmcV+oKcZbgYXGex9m/7avPkuWLozkV1/Qp8Qp/3AnDrh/
	 yLMjqXrLh/LChPN3pSYNoIehwi/N/mruUmw9lCJ19j7G4GNhD01DqpBJJKr6RGVk9X
	 aFAGpgZ6gZLOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 754FDE21EDF;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: defconfig: TI K3 updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611247.12258.3956873659078567385.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
In-Reply-To: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 21:49:44 +0530 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5
    (no matching commit)
  - [GIT,PULL,2/2] arm64: dts: ti: K3 updates for v6.5
    https://git.kernel.org/soc/soc/c/af3c684721cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


