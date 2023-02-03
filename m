Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE6BC61DA4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13420C433AE; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1343C433AA;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=FN7akH+qEE1AV71KxKAFfyLhVs0Dl/926hoe3IY/aJ4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UJ8seV5IBkrVZlN3BVWGy+foBnVUMnKnrjJ4mVWhutZ9bdHKeO3D+TcOm5bvyaGDJ
	 Cdwh7HHY36sayCTa1ND6cLyt3E8R4a5YyzG5hJ9qQ+zUSv+VfZOQKrKrB0hrQfpgbF
	 Dpqkj6U/IE9oLYQDex3lw6tbuIVktNQ1J/rSanVSRIWBSFRUYyqSW8/HRMok4rY6bv
	 91hs4KoBPduVLg4sLob+IXC+WcNNSVoxXyKDhR+sqJLTUC0CZz4oCVZ72JSWmEgtRW
	 wO9gIaOggrBFBwN84NIj7cyOyefSs08dgnmoZqXK83gZt658DngfRdoE9vMpMUz7Lp
	 XGh76slTU/Tww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCC90E270C4;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.3 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464489.16250.14301105373893879163.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <87357oaxs0.fsf@BL-laptop>
In-Reply-To: <87357oaxs0.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 02 Feb 2023 16:32:15 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.3.
> 
> Gregory
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.3 (#1)
    https://git.kernel.org/soc/soc/c/df5bc88fa178

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


