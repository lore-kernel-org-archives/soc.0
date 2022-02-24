Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E8C433EF
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B8A7C340E9; Thu, 24 Feb 2022 22:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFA3BC340F3;
	Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740024;
	bh=x8nfKm/wkisyEHq+Dp6IUtgbnHw6i3PCRFEIceqlCro=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=inmnfGWYmVruQR8E4YcVKu3YVHUmCxt2kGmp5wNS7tDcuCQHRgDmJQfUbxNBPMLHt
	 VMPa3dCUoFG2UVuGeJ8Ogx4P2az93gxz4Hb0jXRjZOtZa5FN/oDDUYDg76hARlAby3
	 iCL9vizn1sEE9HN29UfA96OPcxvYTRrywewV33IGKFBOXOdcbOs0332HIyBUOUiCvG
	 ErQWM84s1ItLaa9PUoI2mkKgK+Tu5eK5ryJcQ6Eimv8a8nN8fejYYVDRBEK5La11a3
	 Tex81bGDyP4Wku4BXjnMXYALdyYJ1Y2CKYkgok8n9kJaut/ION887rRS1peCkZ7U5H
	 CXhUoM2YZz3rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1C1CEAC081;
	Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: tegra: Fixes for v5.17-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574002479.25177.5346869877463490007.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 22:00:24 +0000
References: <20220223162209.293722-1-thierry.reding@gmail.com>
In-Reply-To: <20220223162209.293722-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Feb 2022 17:22:09 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit bd048487af68a9782ebccc3af6606e9e0d7d9f8b:
> 
>   ARM: tegra: Add host1x hotflush reset on Tegra124 (2021-12-17 14:55:32 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: tegra: Fixes for v5.17-rc6
    https://git.kernel.org/soc/soc/c/31c50bf184a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


