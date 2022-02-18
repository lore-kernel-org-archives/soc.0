Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DAAC4321E
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F535C340EF; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27D7CC340ED;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=t/mh1sfrGL4ExkVKvxtOd+L6zXjReTE5uepmNjCMtYc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AeGQxSm/YRuGx/NMPTCQqJcyBwd755UQdXqp7Dgf4CAxVrTCiAz/HY2ixpu03BRq7
	 EN9pTIX3Su6coxHbeH2wCFvL4VEYhRTVY4zTo//VK5hoIKMI0Vkef2y0612/3LjI5t
	 4TxBrWkvmhS1AjMnNDEFH0lDpvnqcbMDw3CheDgIIB/ZahMj0EgiegkNVrgYathVSc
	 83BuAlhiuEuXaGgEp2+BXvEdgeRUb/SXJ4fZ6AP8P8Fer3o8t6lAM3VltQ3UHUxRQB
	 ibLwZEamuSdUFIcyXz4IZe8LJZm8r9tRKvnHx/1UR/C9RhgI0f+HFn5c6n3T6h53Nj
	 ocPNinbsnVzMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DE8AE6BBD2;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681105.10306.2611305338712284663.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 20:40:11 +0000
References: <20220214142615.2375269-1-sudeep.holla@arm.com>
In-Reply-To: <20220214142615.2375269-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Feb 2022 14:26:15 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Fix for v5.17
    https://git.kernel.org/soc/soc/c/f159f2941db9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


