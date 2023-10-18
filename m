Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40BC41513
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F69CC4339A; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E681FC433CA;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643633;
	bh=pjYA9klbkClUzfUPOYDcnuza087nXimd7t7yexp9oGw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uK7LloaJnfGKV/gWnj9gToUCYU14jORHe97Bi8eGqucUwQkuLVDpYcHIIC6MgcvK0
	 MCtaAk/T8XDFh6DXwKukqmZ3R+NVFTSFUtsveoPkzBsnHTar4ABVL83gCnRKTNlxzf
	 vrJ6cMR06vjBrYP0a2NY3tB4r5sRIw6XYyE1ZB+d+OqnSNdAFa0HQahrY/QIFsTPqX
	 Wq70hHh0TSc958KxsyaG74pqXd9f+ZFQGnAdrm3/0l0dSTcjdPNZC2Hb5TNljt7LH3
	 cQDeEpDI2PkZ5GTAIar8M6IoF6ZqRBi4T7vOtgxLmavptLRHMjAamVCUMHdl/nW/gh
	 dRQeXg1ORhJEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6267E00081;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm/arm64: dts: Removed undocumented and unused
 "pl022,hierarchy" property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363380.8197.3566778333954941742.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
References: <20230928190859.1072420-1-robh@kernel.org>
In-Reply-To: <20230928190859.1072420-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Sep 2023 14:08:45 -0500 you wrote:
> The "pl022,hierarchy" is not documented, all instances use are 0 and
> isn't handled in the kernel driver, so let's just remove it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Please apply this directly.
> 
> [...]

Here is the summary with links:
  - arm/arm64: dts: Removed undocumented and unused "pl022,hierarchy" property
    https://git.kernel.org/soc/soc/c/7115816b609a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


