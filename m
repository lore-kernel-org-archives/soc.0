Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06835C25B49
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0EE8C433B9; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8452C433A9;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=PXO9PC1wRTZX04m4aS8efHMZlDcSsGf0ZTlqome4pO8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CSSpPSqPrvj0RMdMBVXfnoNX6UPWUNTrkBYEiBzB7qEInUHzFAVMpBnQOaY0r5tbm
	 QdwkAHSoT7eWlhocvw8V9Cj8gooU4T96vGelfqc23nXm9Daeak3h4dPodLHCmIDyx2
	 ZZjinD0YoMPWTMaL0M5ZSCqZh+SbAQNOD7TqD5kHfTH+6tpspGpzbgoIz+YUxFDh7a
	 LwMhQFtA+3qsnYwj/yhAX/ypLDu6lcpOXDB/XNgaCA0VFG67fDW+4YlxkY//zsHO0O
	 dzpDRhePjEXYIjdA2Im844jscABj0Vs1/NR45JfNOOLLaiqFL0AEWvyFjn6LK1ZQ2D
	 17nfTmatAZVUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 929ABE4CC11;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v2] arm64: dts: Update cache properties for socionext
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943059.14534.16313559241704782106.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <20231020195022.4183862-2-robh@kernel.org>
In-Reply-To: <20231020195022.4183862-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Oct 2023 14:50:22 -0500 you wrote:
> From: Pierre Gondois <pierre.gondois@arm.com>
> 
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] arm64: dts: Update cache properties for socionext
    https://git.kernel.org/soc/soc/c/8d4f9145f52e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


