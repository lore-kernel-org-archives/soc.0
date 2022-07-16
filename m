Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD46C43334
	for <soc@archiver.kernel.org>; Sat, 16 Jul 2022 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4BD6C34115; Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C027AC34114;
	Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658006413;
	bh=D4/qt4vLFF1i0+0iQ0nMYqSrdTwGw/St9yrvPYMB5nA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tjunRrwjWGrfKnJBrsx0cBk/oVIcNBMEktBMF5GS+60cMxWG+BK/ZwevsHqpcWUOR
	 G6Svp8vmlf/DEfL63O0zd7rKBDYsOWpTKueEt9CuhFbalBwEKiax/XH9P4mLx4mUFe
	 CVQLtllXhkwNKGiolGzpagsRQGPwCPlO438blgsuWOpzPSJf+iafXMC6tiB8Oa2tmx
	 VdmJnklZyYbktGILv3kFPq/gDODb30qsdr7PyXO20RphtgXrioEmSURSI2GgS2oX8U
	 /Xs3hAIcLouvn5Uc5uAsnZhClc4/UYF1YkLZlr0ACM09HG/MEXdMVgJvkMwxUn5Ovj
	 M60OlMP4P532A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A60B0E4522E;
	Sat, 16 Jul 2022 21:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Broadcom ARM SoC changes for 5.20 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165800641367.26933.2216300317516220551.git-patchwork-notify@kernel.org>
Date: Sat, 16 Jul 2022 21:20:13 +0000
References: <20220715221642.297536-1-f.fainelli@gmail.com>
In-Reply-To: <20220715221642.297536-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Jul 2022 15:16:39 -0700 you wrote:
> Hi Arnd, Olof,
> 
> We had some late changes that are non functional except the addition of
> the Asus GT-AX6000 DTS file. Some clarification of the BCA acronym and a
> preparatory step to remove ARCH_BCM4908 in favor of ARCH_BCMBCA.
> 
> Thanks!

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree changes for 5.20 part 2
    https://git.kernel.org/soc/soc/c/5995e9232fc3
  - [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 5.20 part 2
    https://git.kernel.org/soc/soc/c/2c071ce53d56
  - [GIT,PULL,3/3] Broadcom soc changes for 5.20 part 2
    https://git.kernel.org/soc/soc/c/c5560db571d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


