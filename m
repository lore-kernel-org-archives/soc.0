Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB7EE49A6
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A005C43397; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EA84C433CC;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=UTMXBTth9O0dK38cMVjptbxJA53JCZE+cdbAXxnIMU4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kIpQmAF0D8Mz0CZlKE7MwXrfFEe7znbjEf5NTOdTlyyM7am7iSlfHWGsSyLQK8cnv
	 +FGeW82wjKKT+UpJZk9QWQ6kFxcarxXcwiXII9/pZzFUisaYnxGFnr0JYLR+dsEbPE
	 tnfVJ0wQ8w0nY8U7mIaX624oRxmOMkW2ICGgIDx83Xkl97ym5JcrDuAx2Y4OBhvaUR
	 ULvNiHS488/v9p2mvH4ILWBcqTITypMQdSW/iZC4K8/G31gF9qjzGr8w7WW7ew2d5s
	 Q7hK4/3cv9xYGfLq3fd7FA1q1kGJ4owVrv8uwdTcx6ITQxeGBFZUxK2LxTVbjn+d8b
	 M5GzPykCkbt2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E53E6E22B04;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.6 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147593.32531.5955163436516769250.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
References: <40318909.XM6RcZxFsP@phil>
In-Reply-To: <40318909.XM6RcZxFsP@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:04:12 +0200 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-drivers1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.6 #1
    https://git.kernel.org/soc/soc/c/d4692f6c2732

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


