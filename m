Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E60FC77B74
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FEBDC433B3; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03440C433A8;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=2l5Np1wh/Kq8a6JXSmUsFIXK+VoIZndfVitXZLAfCk0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dAW33IjtVg/B8ye7W35AW5QIISaj9kExBRf5j0/jIbA9/5lSVlH/Ag/zV+6UyReFt
	 XiXAALYRAG9p1z4C0TzdujmJBjbGqtIV8cN0Fo+c4qvDZOsTte8WCccKl8PPiRJf57
	 iI2SWP3wdwmYHbDpQmFHp7KfSDg3Tfi5CxdeRLSZJbCio6Q4ptVnHzedOSRA1JfBop
	 tKQXKsp+xpuXwRMv5nxPmUwuH0S7ffvPluqweLJ0p8kV8KNRApCplBdk4BbxAfHJtS
	 U16Ozsqblj/h3AompZ39lkutmrgEf6p0TNQHVFSXpzMHbpaqvQOwoxLgl8teQX0enr
	 oucOO0BZ93TYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CECC2E4D02D;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928384.17322.11216393972751510018.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <1b955bb7-1a35-8d67-beb6-dd289533ff6f@linaro.org>
In-Reply-To: <1b955bb7-1a35-8d67-beb6-dd289533ff6f@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 4 Apr 2023 11:23:49 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changeset for v6.4.
> 
> New boards are added:
>   - BananaPi M2S, which can be mounted with pin2pin compatibles A311D or S922X SoCs
>   - BPI-CM4 module with BPI-CM4IO baseboard, a RPI CM4 compatible module & baseboard
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.4
    https://git.kernel.org/soc/soc/c/837be1cc222f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


