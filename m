Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5BC4332F
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8952C385A7; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAB75C385A0;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=STqbmKfc6f3ahOdIE/6FGiW64PqikiGfMPA/3nWW3Ts=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CzteVz+JH/rYjKczFHtFeJ4nLdHazwo+wD7jSDBTgiVhsA9x3c+S1ahJbzI6hFBUl
	 9DtYBmAbqWHf7/LTfzM/MKyqN882mYGMJa4Vc8XhLxecGhFOKbwIbP2dTnyhNhRrUb
	 uYSKcnlKNIDRMcMbyL+ezqbaF59vgSI/kjSZLk514hRGBVZKWi/BohngvwbBG6SISb
	 jAzQazkNTURFSRhZMfpVggRTCrpmyBUURXWdd2jQTAGupMGnq8Ni3fGcql/vvGhVNd
	 3M2Z92c80lWoHXqUQr2jDSuTjD+j53Sucn4RGT6hfJXrnYUO/Pixnx9jr4wy5Aw2f/
	 IVmtrrRlARZ6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C994E8DD64;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424763.10369.12448966278535744908.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <20220407110828.1436206-1-sudeep.holla@arm.com>
In-Reply-To: <20220407110828.1436206-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 12:08:28 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Fixes for v5.18
    https://git.kernel.org/soc/soc/c/bc22bb224b3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


