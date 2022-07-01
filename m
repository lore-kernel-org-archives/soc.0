Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9060ACCA48C
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A46AC36AE2; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55112C341DE;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=lbZQxzZEx5+ZXSjYIcukjG1lnLMsweqj8UkgJy2fmgs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CEecp/y5OiTq1LoLbBbOouwqz/BeCQHDIhmsqerPu0ifMtrQzIoxonj0iZQq57kNP
	 GvF8sYvS3PL6zRi2yTgdVwaEa2h5wLqIRHeinTHWkL95sdfqfqzhpdfjH9cFdCg+IK
	 QVgl+Z4u3xyuFrXaa+cGHJJNgYBPR0t02PVCZsBsIqyd0Y3pLJpAIDZSDEbpWqVbLk
	 ImEz7G8S7S8aORHZYC1Ytwl+FMrtEEKAFcqOHCrta8z/WXb31lqAqP593lyCJukpLq
	 ki5THYlgvbvd+1U8rhW5/QGkvG6yyiW9f19s6zWjr0G+sETSSW/79QX5ldOO9B7HoS
	 eIU8rhIQ9GtQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3ED28E49FA0;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809725.26141.2450452591851357361.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <cover.1656069631.git.geert+renesas@glider.be>
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jun 2022 14:01:28 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.20.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.20
    https://git.kernel.org/soc/soc/c/89a24d7d85bd
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.20
    https://git.kernel.org/soc/soc/c/4505bb959ad2
  - [GIT,PULL,3/4] Renesas driver updates for v5.20
    https://git.kernel.org/soc/soc/c/92a1691b9db8
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.20
    https://git.kernel.org/soc/soc/c/6c0534397d87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


