Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC0EC07E8C
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1D90C116A0; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BCAEC0760F;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=k3GtyTWVFvrc4J7f+PiLR2iwn9fzFpr5Xle87FNBTS8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dClddml4eX1RquoUhgKmDTyDX4MqNM11b10x1QZAKih3euLYpNwE/639O9VqCrRQb
	 dLNt2HlmWF3bmsjyZY/KDWvLtq+9RRjwKha6HtOQ0sROnr1pj1Qc9TC4udxfO+i3yO
	 Vn7H87ULwz3c3WHJEKazbbL/dh2zBvXGUFQdyH9GcqkwNb6AIvhb2ptS2cdyXiNDgb
	 UgyTWWn3zib/rSYbvLwMLtVHdtztqP8oFsdmpNpxj66PuQvh4ceqEhcnZLVWOGHrAm
	 L1g1/QJm1h+aTNqEKsYx2c4iBFYDMTH6qmsX2GsZ/+27TuFcnSGmKhIFimkOtV+VAB
	 5FTkPTdlzzXxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B75CE505D5;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168956.30475.6572975939901186061.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230703060222.24263-1-chen.pj@inventec.com>
In-Reply-To: <20230703060222.24263-1-chen.pj@inventec.com>
To: PJ Chen <Chen.PJ@inventec.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Joel Stanley <joel@jms.id.au>:

On Mon, 3 Jul 2023 14:02:21 +0800 you wrote:
> From: Chen PJ <Chen.pj@inventec.com>
> 
> Document the new compatibles used on Inventec starscream-bmc
> 
> Signed-off-by: Chen PJ <Chen.pj@inventec.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v7,1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
    https://git.kernel.org/soc/soc/c/d1dbb0d34e7f
  - [v7,2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
    https://git.kernel.org/soc/soc/c/3f2879e4040c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


