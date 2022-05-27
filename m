Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE35C433EF
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4835C385A9; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF5CFC34113;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653684012;
	bh=4yVf+S79QgmaQLvE9jAXr6geLTjJXIiP0fyEh+w005g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZSw9VQeZ9r71ffuRplmACtxurXdStPmfhErlDNFmhWuWWMPXgFNBBi0Jexbtosmj9
	 sFxXHZupZoMYraHvJXpbHAf2Gux69mFYJAHcSKYZFssb/y15R2PkNyRFnEutmIxtsZ
	 OFAruGWhbKNEGdexqDyHNtLBUv2cbVt8f+2gIVSQb2ryG6ToLetp2ekfjUkdYuoEve
	 ByBTg1oVqPDDx+sstzc0/TsuhfZwHhxGQqgPW9qL5MgotuH/CzQ60ONMiU98QOrFVp
	 wM4M+10SjLH8uoxV/YBpAx3LNA70jaTPtcdbue1lY5SraS4Xh51pAygw37KAHxPN95
	 KLUSVYXyj5DrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8A2A5EAC081;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Rockchip driver changes for 5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165368401255.3222.9804102771407997823.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 20:40:12 +0000
References: <4541398.Icojqenx9y@phil>
In-Reply-To: <4541398.Icojqenx9y@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 May 2022 20:24:15 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> as discussed with Arnd on IRC today, I was slightly too fast in removing
> the tags I deemed to not make it into 5.19-rc1 anymore.
> 
> So here again are re-created tags for the fixes-parts of the previous
> pull requests.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Rockchip driver changes for 5.19 #2
    https://git.kernel.org/soc/soc/c/4a4e81ddb8b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


