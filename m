Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607CFC43217
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 536D6C385C0; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38DB1C385BE;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=nxjbgjW4SgxMDLf4WEaDgYj2+3umoFtPpw98wanAiyM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=q7KX0G2A4BRpIwN/npUbt+7Ll4x7wRTuEDsMbjBSa2WGFH7yqF94Fa1Cz10vS9HYo
	 Qbi07DtvstSw/wPU51s14a4zsWR+8ya+cRQVZkG2ge6GbZYGdg2cOT4HXb6eRgahhy
	 XhQY2SHXMeHTpK3u7WUtPwY7KAKakoXc7uFnF4q1i/62blsnDdoBghAPe+IeyCu01B
	 UsIjLIf8C/CnSp7e3CYsoFTOyPAF979CtmFHeIZQGhTz1c8qPOAkJSq3ol8GWT8zgR
	 f/j3QVnKhEhSSdcy1TYVGKt+t2ZpG1tPf2DCRt8Jp7x/Ufnps6hk+WxWViDsVxMsgN
	 FckL05SJY16sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21BEFE8DBDA;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910813.9627.12420674558239130066.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:48 +0000
References: <20220503160057.46625-1-p.zabel@pengutronix.de>
In-Reply-To: <20220503160057.46625-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  3 May 2022 18:00:57 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v5.19
    https://git.kernel.org/soc/soc/c/89c500b1fa6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


