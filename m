Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB20EC77B79
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A121DC433B4; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85C54C433AC;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=L4Io9A52MXTXqMxnwBg+yJIa7Qe6YpNTL+iz0ZEbS/U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UpGb2arCZfrXvC6m/Pt0/2GIPdmGojpYmCrt0l+i9HLjlHXmnraA5T/LCKh2cOQv5
	 zMtCPz1evFSc6+NVnOhJPqmHy7PhN3GgMz3USo0LrLqBxgYvmef5PpoQVp3mY6DcJG
	 r9m9bOq1lZJkRXF3Xx1VCIjlVJxQ+YssO4GoBWHWN1ffToPG0vhSKUg1rwojfnVGoy
	 Hmgkzz59CLIiWsuHg+3zrR8ktBTslvxNkB5a8UJW6Q1kICXWgowRfEZOsQ9BTFlWTh
	 5B5UsyXRhHPcVZCUizujMjRtC8rhjk9zMGaQOrRkOY/yv1tN842dIPryk4ZvleBBht
	 h+Vg/RBdYmIPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 677B1E4F0B5;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm ARM32 DeviceTree updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926342.30442.11190676514195755327.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230414023723.2411793-1-andersson@kernel.org>
In-Reply-To: <20230414023723.2411793-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Apr 2023 19:37:23 -0700 you wrote:
> The following changes since commit 26c56dbddc304cf7304346df4b25b3be0c086e36:
> 
>   dt-bindings: arm: qcom: Add Yiming LTE dongle uz801-v3.0 (yiming-uz801v3) (2023-04-04 12:23:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm ARM32 DeviceTree updates for v6.4
    https://git.kernel.org/soc/soc/c/8158597fd0ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


