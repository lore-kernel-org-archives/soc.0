Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF68C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 310D2C385B7; Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BF2EC385A0;
	Thu,  7 Apr 2022 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649335811;
	bh=i39tq/87neAjAYpUoude+4Rq0BXVwXzuIkpxrY4u+a4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u9t5oRIzWEj7kgKO3pane19aGTLsJfn+l/RZv4vIAuGp0EuxGGupuXvoFnaTTqGBx
	 pC3AyqtTxg459Vj+kMxUJ+JVuky//GRJcfvSk64GMXIAYBsmp/TEw6f/mJV2z2Fvzx
	 noMUqiudeb/SQgweEBuDm7Lr3e6owYXp14t/bAuh4FCvEhx2kBq2lPnVuxh4cHPJWy
	 idPzq94hWe7kPRrZDqzrPmGlJwQtEg06duFLxboxfGRj2k00xyhiOo8qu7WKpcFQIz
	 FY5cwtr1scOjFnoauZmTsYDcHEUbsXjzVR8SDmgmND1ELOIFgJnOJHNvQ5HXYDSSsK
	 BTSdks1fiWfzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0BE9E8DBD1;
	Thu,  7 Apr 2022 12:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933581098.7761.16806169330205157736.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:50:10 +0000
References: <20220406153337.1265414-1-p.zabel@pengutronix.de>
In-Reply-To: <20220406153337.1265414-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  6 Apr 2022 17:33:37 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v5.18
    https://git.kernel.org/soc/soc/c/475acef9ed48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


