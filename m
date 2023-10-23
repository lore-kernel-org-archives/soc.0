Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF45CC25B46
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8C99C43391; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E118C433C9;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=m6aCRTNqlwMYBjFeDJbvXHmRxewLHJ+R9eBo6h4/DqY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q25mRnjY93MwQ5z7sYGoi2hAc+q8IM6fbiWGHqQKt2xHgZQkpAY+KL1HkrYUPItdd
	 k9Zfa0XVsfY80Z3epr5o3xIWi5Laz3kGKyMH9nxWbBxh9oXBjpoqyekiAY1G0N/uHm
	 GKz3o2Hl/HZsm0YveeioADjRzUf0xgKG4Y18+YaY3AlAsHa49NvfAnu9RwE2j9WOjF
	 AnJlK4H2HCX2uDt60cwf/E8CkEmbGp93lLAABt0BaaJc1EQWgEcjrhJICFAX16VELr
	 K3vgPdibbr53TzeDXH1YJBQHAPyuAMeyYXn3Q6Agd+jP9VEhX9jLzNBIkkhMfR105y
	 3uvJu+9Jig2dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6632EE4CC1C;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Rockchip driver changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943041.14534.892693531189978442.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <2171043.Icojqenx9y@phil>
In-Reply-To: <2171043.Icojqenx9y@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Oct 2023 13:30:00 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> I still see the driver pull request pending in the soc patchwork,
> so opted to replace the tag with this one.
> 
> The only difference is the addition of one new compatible for the
> rk3588's pmugrf.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Rockchip driver changes for 6.7
    https://git.kernel.org/soc/soc/c/f1243fcea5a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


