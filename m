Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C70C3DA49
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA7AAC4AF14; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A49FCC4AF10;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=J23URLKvQAEmnuNl3MkSPvoE2fk+jWOocmNnPT1dLN4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=E1KeM14d6cvn4bqCPq7qBGuU1HI+yB+kWdvISew/npv1NemjWXtnAxgy7lqN5kQI8
	 0XvX4xhsAmSC5Q3Fzf9d0g0mqlyUYdOZC1wy/kwwk99yhOxEqt+Ic09k+u98237VI4
	 Y0EZfyn6OYkoyVQRnD0MFnZ67zaHYG6A0MYCq0goy4GylIk+idVr+NL4RqnP+HMJPu
	 HNw+U+ICAV0UTFrfRrUP404rkt9dzCfVVz/kASgmA2XeqWf/DqfQE4BgPD1MucnhzC
	 9wFzvu6HvaN7ef7H04qR3OojeNpwd4IiAWtPK82TA52D58jZ9qryrELS4afKMdbvCk
	 25dkIcNBbSa9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95808DF3715;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824560.24660.15487820665473186707.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
References: <20240706155347.16207-1-andersson@kernel.org>
In-Reply-To: <20240706155347.16207-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  6 Jul 2024 10:53:46 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.11
    https://git.kernel.org/soc/soc/c/fa38c957982f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


