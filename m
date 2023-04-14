Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7AFC77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 845B3C433A8; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A6C1C4339B;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=BOvcxrzD5x07SvVQVgFNeZDYIbiO2L2xKQt2CXSujJc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ohKlbV2aZJJFwNN2S/zibV0c7nxz+SiR3rCUPRA6lBB9TA3JKuqIRTskFtDfogxgk
	 eSdD5TdpV2xb17YCZQtMu/6hBECNIs/acZxSChHCFl+toDqxQIhomMgxM85+7eLAo6
	 lfBA2E29OXMmIDQzcvpSMXywpS4ikvL7XZJ/fI+qq6dc/XG7yWMXx0LMwhK3J2ZqfL
	 FWArIR2Lm9DsZOgm/T8uoXLR2Nkp9mWmTH+aasMMlKhh3IIvxxT1uuHBW22uYKa+T1
	 /JRiHedXUBK7OY12z3yZfI4Izp3qe1lqx7mhbZGRo5XVHgy4fxiXmSgwGmYzoJMnAW
	 2Fq1l8ZpsVMpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47326E4508F;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 Devicetree updated for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926328.30442.12543192802275916625.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230414031550.2412379-1-andersson@kernel.org>
In-Reply-To: <20230414031550.2412379-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Apr 2023 20:15:50 -0700 you wrote:
> The following changes since commit 105560b4fca4df0d42dba6656105b5e4131d8ad3:
> 
>   arm64: dts: qcom: sc8280xp-x13s: Add bluetooth (2023-04-04 20:51:38 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-for-6.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 Devicetree updated for v6.4
    https://git.kernel.org/soc/soc/c/718acce6f05d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


