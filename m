Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A527CDB487
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29295C4339A; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 132D9C433CD;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=ouWJJFFq9Wpd8L4rh1tsADfG3/1ABXcRpRyQociFVr8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Im58AJQr7Okqg23QO+UZhqKNNnVBaOdZGFBxZISoM3EV1L1Whf9sWkMxJxtdWX6d7
	 gGIa/MCz0UE9sCbG+DeNsTKP576UEv+BFL9NBBaf0HfkPyw43VYVK0P3zthQOSZK56
	 yHqmrPci/pQiA+0x5rZ2C7Ki9uSLI8UmYNKicaPFC04Q38x8aWXdlWkhF0mD/bct5A
	 KXJ2+/Yx7n5hQaJXQ7chOWBU4AhPY4gbQmYsRnBvUqyITluShhlCDiIFZG7vMjtjtu
	 mxyBjHDFi8MzAEK8mwO9dZkO2weTtq7yiX92fIUOZwIdWkAHsUBFXCKDJ70EnYCSQC
	 0U72D0y3475Zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F02ACE1F66B;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.7-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083798.14185.4259143969841223065.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:37 +0000
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 17:37:17 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
    (no matching commit)
  - [GIT,PULL,2/6] firmware: tegra: Changes for v6.7-rc1
    (no matching commit)
  - [GIT,PULL,3/6] dt-bindings: Changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/7f50d3f361f9
  - [GIT,PULL,4/6] memory: tegra: Changes for v6.7-rc1
    (no matching commit)
  - [GIT,PULL,5/6] ARM: tegra: Device tree changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/afec904ad758
  - [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.7-rc1
    https://git.kernel.org/soc/soc/c/d4f23fdfff30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


