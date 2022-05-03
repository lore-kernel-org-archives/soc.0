Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB33C4332F
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A828C385B6; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DF80C385B4;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=EXxDiDosVF5wO9SrMF0LiS/AuWk09RPgPc8fbc4zo4w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gyd9LOaFkv7YyGzdV197okY6K/98qEiK08hy4WoxX+8vN2zBKC3b8Fp7VTfjxuH9l
	 +arShuLp8vly52Tq+Yf79R2Op/u7ycc+ISlHDYexPE9kauNwXRn3jIrmZaA4qNkkrs
	 EfmTXRvd0OEbhmf0XpLUTU9XZD64xfUBuFuayn9uGWOnqZvHUuIYJz2qgE8OCkyFco
	 jwZVedcBKvFRJgmzYaO34LyrNbEbOYZEV+pID4BychVu+ncSBULV+nMbWjCSf04Kaz
	 jkH2ncx+cNourfi4TZdKGKKXHl6jzBwN3lKS2gOxaABO3ugWRVt+1PZzZg9IpEmVB1
	 ZsSpGdU+5ofqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF51BF03870;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Binding changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942197.22061.12138098782436405153.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:21 +0000
References: <pull-1650961799-428630@atomide.com>
In-Reply-To: <pull-1650961799-428630@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Apr 2022 11:30:54 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Binding changes for omaps
    https://git.kernel.org/soc/soc/c/3908ca662416
  - [GIT,PULL,2/2] Devicetree changes for omaps
    https://git.kernel.org/soc/soc/c/cbc842c2f217

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


