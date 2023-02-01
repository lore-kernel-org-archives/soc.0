Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A5C64EC3
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D64FC433A1; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F9BDC433D2;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=rlUTXUSjDejPQj7ckeUNmB860OIwUhm1kJ/gS+dPxcE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hu1UL//L0g6qDsquSPAV8mPJhKZG/fvsO95gXVRfV3di23KznsN/Faatl3gl9scWD
	 mknVgc3JKG+Cs1+GKj/tNbuUIpBnA0cdSvNmuDGTTSHsCEDqX5aukn8uZJngzi9I+f
	 HyvBCAKQkZBb84zqUVM5Acqym8lrEL0nR4U5g7CV6Mvt+5/YvCaW3Bj5WN8BIkt7LF
	 /YMotjfnodQ1asQcHZvqBPOU6r1IGxCOfY0RV+nkdnrdoXwAi/PUYNiH9B1/mWyuEe
	 6rHdgOSGhCfaWoqGjkniTBOyrMOagcBvqo212fpekD/dSw/Hoo+58Bhg6LFrsmkCgW
	 dmnH+x+3BAy6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B3E9E21ED4;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: soc: zynq: Xilinx SoC changes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902217.23236.1317216839999524754.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <5d7785ca-7fe0-1597-c56a-7a0f4d230db8@monstr.eu>
In-Reply-To: <5d7785ca-7fe0-1597-c56a-7a0f4d230db8@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Jan 2023 12:13:24 +0100 you wrote:
> Hi,
> 
> please pull this one small patch to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: soc: zynq: Xilinx SoC changes for v6.3
    https://git.kernel.org/soc/soc/c/27aaad0e7c72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


