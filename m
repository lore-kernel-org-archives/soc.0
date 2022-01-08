Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93694C4167B
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8784FC36AFE; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71AFDC36AFA;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=+w80bqVkA1PX+gYROWIHYNbH32l98vrYybD8nu8WqzY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=K2rVoulpE+ZEygkniTnlTCjVe26Hkyh76GqjirJtkCAnJY5rRuveaBnTK7rFwWcaa
	 Qzu6EiLseV1U0LZnfMk67kj9dzeCGpEwUsHSAseO7rF1G4HJakwnfmmnp+vueV48Rz
	 2IOJWZwZX/791jmsObzIdeYCfkBMtl1ILH6RUFkW25jIY8HuPYlkfTTH4m/nGzd5MQ
	 VmkXyiri641OtKD48gKczRhxoji5qteBr7QBBc2Ml9/ggDj2kKMzt4lcHkBu07Egtd
	 S1yPMdqA+Pv+yvH2x/fnRMYZ+yaho2+YwlzD2ffJYTqaL533cJvgb3d5NTcsYEF7lt
	 SYqWlUXKtzOHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DE90F79410;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates vor v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921437.24856.16206183626304570987.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20220105172618.302522-1-p.zabel@pengutronix.de>
In-Reply-To: <20220105172618.302522-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Wed,  5 Jan 2022 18:26:18 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates vor v5.17
    https://git.kernel.org/soc/soc/c/90352609bdef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


