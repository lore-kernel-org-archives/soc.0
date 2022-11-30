Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED44C433FE
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 228F9C433D6; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06872C433B5;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=6qwnLH2cG83bL339cru84/b2TawHxOQMA9s11rC5Kaw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P6Og8vRNaTL7Ftmqsszao/0xcxgpYNK5pU6Rk3X+/KYmCIM89b+4shqqIz6rQfHN3
	 /k8J72/M5WAzVR15S26KH3cT4NX/nOfYxy0O0TtNXPL3NCurdBZw+8q2s4fUukqD4Y
	 vFKWpZdVMSEmNhoF4Ng7QryLiHdJtXohhLL3X/M11LYgLn2RgEkmtpPllzac6J/Q0H
	 PeaS6hBUXqNb0zbkfCRQyMEF4io9qul91NiI8S0Zlpyt+k9iWfW/nZLCjK9JcvOI9Q
	 25PmSkURWjSQA3YFXxkoPwD4DNysrIZCs4PkXdApKBL3hW+65fb8H3/N2QYcTp8mGW
	 R6nU7IsEVpqEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D96EDE52546;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DTS updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826188.9936.13560339656784847204.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <20221124100650.1982448-1-andersson@kernel.org>
In-Reply-To: <20221124100650.1982448-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 24 Nov 2022 04:06:50 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DTS updates for 6.2
    https://git.kernel.org/soc/soc/c/bcbc46852835

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


