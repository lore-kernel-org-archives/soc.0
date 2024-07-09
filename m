Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889EC3DA49
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A14C8C4AF0D; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB13C3277B;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720560633;
	bh=cp1IsBr2JWKAIZVdgIXe0CIpaDQ+CBd1VAfoeQ0uE+A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=C5d+hDJeVyQt+00oAttGAOxp67KgLpuNpODLmBgBqhNPK63+C2HefSWeszEiRpyRw
	 FXr/au0CrWq7XAo1ZssryNa/veMcFqikdZUOxfQ8m0ZrVCYMgerY/2c6sUNm5Erpg/
	 1Rwuh20r+XPJCKb6CL5Lu8ciKItiFudLLSCMbS67V1VTHvawnc1c82Rr0PP+ZI5nF7
	 4i6xWevKcC4sjVIjBojqcPo3jBu5U3ha/6bFOcKBo+tML/eZW8EVQ6R73h33jkmNJv
	 wY9M49+S7kIa5MGTEfDuded3aVkvjGoQU1ZrDRDGycDKUFxWSMFxre1WZZPHHkOAjj
	 q8hc9v3KPD/yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6CF61C4332D;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Arm32 DeviceTree update for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172056063344.16885.9450106613643937525.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 21:30:33 +0000
References: <20240709191506.3285-1-andersson@kernel.org>
In-Reply-To: <20240709191506.3285-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jul 2024 14:15:05 -0500 you wrote:
> The following changes since commit 2a5454d0fe5684855581f8ad958afbcdc476fd64:
> 
>   ARM: dts: qcom: qcom-msm8226-samsung-ms013g: Add initial device tree (2024-07-02 22:15:57 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.11-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Arm32 DeviceTree update for v6.11
    https://git.kernel.org/soc/soc/c/4b1a54b2696f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


