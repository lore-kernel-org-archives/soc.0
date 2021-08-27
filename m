Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAACC4320E
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 22:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DA69760FF2; Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C351C60F91;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630102208;
	bh=AIaNk+FFKtiACrImfUfFrZW7oyp6G0oycZso9h9iq6I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uiHkO4zKO1+CdfbmtGOQiE8uxyAFCaQDVoYqDMG7/K0yRxGTV8Ua2Jd/FGz+F3Yav
	 FqyXwheynt0qoEjp/omNyxuM1aJUsKc0Pg4LC6UEiwLfVcN180MiUW0uJhsmJDV+DW
	 dc+3r2N+9ZAC0HsbIKZmRiAQmHy0DOGYf/Rls1Y6K3C7POhCdnq1XagdKhEIpv6E0d
	 DKxW9d/W5E2ATYSh15pyfI7FDfz7fSk23GhR1yHhJagUjhHkfqpyBJlc6PMcHaFxc3
	 baw7VVKXstr1nJqxiO50fAWZdcTo7wHT8EIc+72qzF5FxZkKC9xC/7I8tAqvkXZ2vy
	 i2EzA05dmjeQg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B5A7A60972;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163010220873.19400.3396594122611634350.git-patchwork-notify@kernel.org>
Date: Fri, 27 Aug 2021 22:10:08 +0000
References: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu>
In-Reply-To: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 26 Aug 2021 16:36:21 +0200 you wrote:
> Hi,
> 
> please pull these patches to your tree. I have one more patch for adding
> new Xilinx Kria platform but that discussion about compatible nodes in
> overlay is not finished yes. That's why I am sending this pull request
> without it.
> A lot patches are coming from dtbs_check fixing and synchronization
> among boards to better see differences. But also couple of drivers were
> already merged that's why make sense to enable it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.15
    https://git.kernel.org/soc/soc/c/6f4f55bdc436

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


