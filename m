Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263B5C7112F
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 152E9C4CEC2; Wed, 28 Aug 2024 20:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E7C4CEC0;
	Wed, 28 Aug 2024 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877790;
	bh=EaJLe82TXN88G1v01KjVI/jEPNK54z+8fVFiVWRXOZg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DdVy1gOG/BHCsXmPj1qIAmOcBphII/JTylQZ1q35DPD1WIo8ANWNkXx6aIlC+6sVe
	 faniGTy1QWmAvLlB7DiG/G+2Xdvj92AOOene4fmf1lHwWn6Cjhc5bY4cS4iJxTkfHF
	 6JDxHfvez+XetrcvA/3c1xdu9ZginyGK4LLbkd9dnT6+YzESJz9raZRtt1RtVpOlHP
	 VpWKAAzSk0NfdGuCmSxOsFkS2Pp0jI0tYWbQRDGmXtMdc4OG7/AmeNphbNvqk9nWGl
	 BSaEotWEvhEV5qeVy12Xo/eBdaV9PFG8C3+8kUGqEiUsI2dCp0rJ4azwcnvtm6LMze
	 3jLMYceT3FANQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 719813809A80;
	Wed, 28 Aug 2024 20:43:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487779024.1420116.9386510999887393227.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:43:10 +0000
References: <20240826145209.1646159-1-andersson@kernel.org>
In-Reply-To: <20240826145209.1646159-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Aug 2024 09:52:08 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.11
    https://git.kernel.org/soc/soc/c/d8f2638b835c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


