Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA52EE021C
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A316C4CEC6; Wed, 11 Sep 2024 09:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A90C4CEC5;
	Wed, 11 Sep 2024 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046448;
	bh=1f6EnHH4v9bCSCWpS3D9CnjJp52a7O+4Kwj+ywipIBk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=p8S5xuZzZk6Bg3+3fWOneHuD1uHEbHa5Da4vBhlTWsMO0tA4TGo68UHO51/ch+oDa
	 oKc+l3jfDe/d2ehTDPTpYsPNvK1zLgeSSMc74hUjI1iRHYW1FKfVQSh3/YaQNMsqyM
	 ggKTemyVnNhKAHdw54jD/Mn09z3Det8IZJynLTaOm4bpNl+oGnVU+YG6vJP8hmICKx
	 kVxXiiAz8G3kPUUjQmuaVgpvlh27ZeY23HNey4/GlJIT4HjgS4dF71it2lCIo6hGjb
	 XCRqLTRO6QSC8HUP/YxLHfOUAlh9t9V7/BqKMd2gC9n3RQAe3YowlAb3VnRhVO0jq+
	 HEuZrGkrRM7gA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBD93822FA4;
	Wed, 11 Sep 2024 09:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek config updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604644949.555636.6520021594050671044.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:49 +0000
References: <ea168bd6-b54b-47d3-ba5d-e545a9b406c1@gmail.com>
In-Reply-To: <ea168bd6-b54b-47d3-ba5d-e545a9b406c1@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Sep 2024 21:05:24 +0200 you wrote:
> Hi Arnd,
> 
> Please find below the one and only update to the defconfig for MediaTek.
> Sorry for the delay.
> 
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek config updates for v6.12
    https://git.kernel.org/soc/soc/c/7eee0f8bbd1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


