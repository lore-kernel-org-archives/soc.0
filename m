Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D4AC77B7E
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90EF4C433A4; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 754E2C4339E;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681746620;
	bh=MphEfVeniRg6vmdwHncmhFBL/JDmwzOpVupsRnjMTbw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hde9ab65Q1Q1Yt6KK8VCR4cUAIcmM7c3gsgscE5emz9sh8Fgx8KEp2PD98rHTcJbG
	 ezGfEIWvBY/uiSRhYO/TcAQb4OmJfMzEKvUB7mKFuSir9hr8Qn5/Nycm6hC1R+UopL
	 FHNlFZ6BYZnpKHdZegcZ9m5sb0apHfShvVwrwpRlgq2rcS1D+ztj7FwC2D0oCkx3Zx
	 OfwEcnvA/NxsfBcPLGs9vvTNZXEW4kKmetvZIQ6Spv/U9tHVBInFR4RLOoT013awqk
	 cDxefpoSuSsSYBg+TB53Pc2Ju6onRmixQhrZ6Td1Pd6/4TnEa/MtkKRHg7vDImzpYn
	 IsjpQiRC/hvmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58364E29F3A;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168174662035.17676.17175462515200161381.git-patchwork-notify@kernel.org>
Date: Mon, 17 Apr 2023 15:50:20 +0000
References: <20230417145743.1904318-1-sudeep.holla@arm.com>
In-Reply-To: <20230417145743.1904318-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Apr 2023 15:57:43 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.4
    https://git.kernel.org/soc/soc/c/4c87f3ff78b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


