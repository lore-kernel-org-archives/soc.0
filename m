Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BBC41513
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DC69C4AF12; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B96AC4AF0F;
	Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718919259;
	bh=CWvMv9HAjCqtnue1btut57zRhDQjNjiJnoYYD4c8xvM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=svyWkof3CSvf9oca721gb8ME0hH2DqJuAGgbpojLek7USeKoQx1fB2wTpuyzk75Wf
	 YavMkFFuR+q7KMsxDYNCUPV56W7GJF3dImA/jkjNLP5qbSUvr//WWDmgv0H5LuRQzg
	 j+MGj1sxdZvh/9/S8cCRCHHbZ/QfRtP8UBwNQQg/DuffPeEoDWOhrFuO/yf44LAnzt
	 d2E3C728i96Xiu/2XWcnloxfZBRtxsF7ZNERYPzSLY+Age45IK7oS8x+p/gjKOUCGH
	 2gMwiCMaSemfGvtGW5APKZkOkLsWyg2bz72M+ohJaQyzMyMV0BQUZRnDPatxbZcpAN
	 mx79NzUUqiGzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF208CF3B99;
	Thu, 20 Jun 2024 21:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom defconfig-arm64 changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171891925897.21354.3197865392732673794.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 21:34:18 +0000
References: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
In-Reply-To: <20240429213703.2327834-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Apr 2024 14:37:00 -0700 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.10/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree changes for 6.10
    https://git.kernel.org/soc/soc/c/07b8c4bbff46
  - [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.10
    (no matching commit)
  - [GIT,PULL,4/4] Broadcom drivers changes for 6.10
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


