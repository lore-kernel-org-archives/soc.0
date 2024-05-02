Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320D0C25B5C
	for <soc@archiver.kernel.org>; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 106AAC4AF1B; Thu,  2 May 2024 14:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA5B5C32789;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714659038;
	bh=XV7kZIneRDZnF8ESAP695Y2GMshAFP4S5AFFac8Vko0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h07xJu0KmoYlV+uyugNlQDdeLqLTGprxmuNx4qMKP+pkIbBvX2LIoIbEgKOrlxpUs
	 F1mZHuK4+DYQ8Lt2/XMV4qyNtFvR9gQYUqg9veNHWyR66/g7LbGQO0e8e/qJEKBCTx
	 u0Nws5sT94YZd5CHGN6UGCjdXVI6D5MIXJqpVmb8Qyj/zP0jPKw42Z9mfXENJLHKPk
	 mTRd/4Ri3Ds0b1WEF97GSnxlwN0CN5xdoFGc4i+7E+tTXd8ristGMrhI3+c65x7HqE
	 nNxhsGB7XOaqKjklabZ77PtsDC64uZqbHx9DhNd6QGmCr18k2TRQRhg2syBJ4PNKQ5
	 jtDuTCr7DoGlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFC33C4333C;
	Thu,  2 May 2024 14:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171465903784.21409.13167005644840992471.git-patchwork-notify@kernel.org>
Date: Thu, 02 May 2024 14:10:37 +0000
References: <20240430191856.874600-2-robh@kernel.org>
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 Apr 2024 14:18:54 -0500 you wrote:
> '/memory' nodes always have a 'reg' property, and therefore should have
> a unit-address with just plain hex (i.e. no commas). Fix all the arm64
> '/memory' nodes.
> 
> It's possible that some bootloader depends on /memory (arm32 ATAG to DT
> code does for example). If so, the memory node should be commented with
> that requirement.
> 
> [...]

Here is the summary with links:
  - arm64: dts: Add/fix /memory node unit-addresses
    https://git.kernel.org/soc/soc/c/5c04a5b065e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


