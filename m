Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B11C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CA2A0C34119; Fri, 13 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B140FC34116;
	Fri, 13 May 2022 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652452814;
	bh=MMuWahUzYlaxKHuS5OTrU1g9Dvx/w3+fGNiEzWUKzsM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rXxu+bBO60+SN/0e0HDXl+vef4d0/8rDR2303dclFKI27ZpbbgCXRDFLaUlSR+3eZ
	 uoImlWySuKV/iP8dp14xfC1DjXeayCfPsid01VqiAlXwUzxdQl9Nd0Y5yVhm9cSeQq
	 I/d07OAW7Ayn5ntQiNbq5C+zc2H8+dsGeE54Hhh7ri33LhmnDn80lt+5ndeN1jlsiT
	 kv9MWYrdfaUu+LPh3bh7A8vizwpOBklLadJ0cfiI4R9N12MwcNmNxyuKlpuRu/oRnH
	 OE/b1rpcvLuBdllvausG64C2ni1RQVHde89EM/aiXfZWPVA06olQLx4etZL2Tu1Vn4
	 bJIoN/d2+L3ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 800AAE8DBDA;
	Fri, 13 May 2022 14:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165245281451.18991.12448741967342342286.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 14:40:14 +0000
References: <20220513121701.77683-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220513121701.77683-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 14:17:01 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the at91 and Polarfire soc changes for 5.19.
> Thanks to Claudiu who did most of the work collecting the patches for this
> pull-request!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.19
    https://git.kernel.org/soc/soc/c/dc5d8bfa3a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


