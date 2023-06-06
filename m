Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD70FC7EE45
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DCB3C4339B; Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80AB3C433D2;
	Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084021;
	bh=fslSq5mBrv+lGB4QDP8Sp64jhizJO1fSaADxwSOFdpE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qtjiEMss7DuIBDX2DDx2DUo8/3+TfpYZRFH6cZRo2ZiGtkGBIJf1O4C91U+zBUMyJ
	 BIugsQk3x2+wMCrAuak95z5HM+IpHp6jnDh17hTvLAiVU3rI8dfCFybBQqUTEd1EwM
	 hcpzr3ZQgUIxLwQnzPlbMjfviJyneGh98Zkdodz5u7ZwgTGPan1xFqWll+qiYrjgMo
	 GLRqZOTKDRoVH5+pbNBBv+Bq15yXoB8/fLGKT6c4m2Hg1F6/iuD2DESx0lkE8UlI97
	 rVSu4m2TeUoKM7cDrSyM90emVELwoi7pNEw//6YBfeXYuvYAik92bNF1qlwsc9wx2u
	 9VonDGwekiR3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63FCEE87232;
	Tue,  6 Jun 2023 20:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v6.4(part 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402140.20407.6293645329315106908.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:21 +0000
References: <20230606125720.2816923-1-sudeep.holla@arm.com>
In-Reply-To: <20230606125720.2816923-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  6 Jun 2023 13:57:20 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v6.4(part 2)
    https://git.kernel.org/soc/soc/c/08425abbab99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


