Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD3C3DA4A
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F0D1C4AF0A; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37462C4AF0C;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449061;
	bh=5uCRld655HYiOZlLHoyUybcMRRq88679mafBJEISaN8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mu0UKz4iFQKzMK4NVQ9dUBBVNV4JYBUQFklVMGNATx8nIiZee10yM7rPMJxnqjHU2
	 htNp6WsVC3icGD2nbbu6af6vzJRL34GnR9E3x+0IhMMl64p2cBneCeyLZTTaCKW25a
	 vqeTPHGSpY+Hax6t4/pnI5Ofg63qOjbcqcTgrcZGtvQZNPHvBOEbCjm04ld8DKhgTx
	 Rm0n0fWCaLKR1WpfNYSwzBIqw9HJj5cvC1ra1bZlUMrw07q5EdpMH/zfvLmhUEVLll
	 xkh7iMVnGzJKVG3yEaUvsg1ZMU/olezv6ULXAip14ltypa20L/EG9repdsEJ3hEZhE
	 36tuNJGfUCNAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E1BCDF3714;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172044906111.22805.10588305928454047006.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 14:31:01 +0000
References: <20240702030913.340814-1-andersson@kernel.org>
In-Reply-To: <20240702030913.340814-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jul 2024 22:09:12 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.10
    https://git.kernel.org/soc/soc/c/bcec2919676d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


