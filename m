Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA37C3DA4C
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 144DDC4AF50; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F12C8C4AF17;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=EL45BJoFH+StQPJYbepmeMgG6NRd2dLN6M3Az5K1Aq8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jQEODNCNee6vTiRsg1l57WJGvxk1c8bCC97zeZOnJ34O9TFUoUUW2I+jYZ3gB611+
	 agu3aOXpXiJkIVOtvSCuShySWERbKw8B3AvT+g/HgabcCE4dmiDyHAVawzDoGRYeFI
	 AipVN8ZzftDCX3vISs1VHv01Ka0wgPt3QVx0ZLSH2edSsoZ+hpftCCtlADUyQfIdA2
	 KYGRo+vNESIX/YjaLl7YekwWJ7dqYH0ZewTPycNlx4PczR+rnCxiDMDqDt5B0OCxf3
	 G/1wRJvsxbhcmwVoVZ1Cx6PuF+2ezQeta/AjcWL7DS06qd2qeZ+2XOZb/GKdUsPm6o
	 sQfsjKNNtlAFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0C92DF3717;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150791.17395.10842774530143916013.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240705032926.13333-1-andersson@kernel.org>
In-Reply-To: <20240705032926.13333-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jul 2024 22:29:24 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.11
    https://git.kernel.org/soc/soc/c/a9fe0720f244

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


