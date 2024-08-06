Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C7C52D76
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87746C4AF0D; Tue,  6 Aug 2024 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72038C32786;
	Tue,  6 Aug 2024 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974904;
	bh=lXudl4pEyAERmyG80O2TNl/y4qvwoheo656xlHLrXeM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BSbPpc58JHi4eCgUMYX3xY7a5ab7bxNCPjcp3wSz87PaeD9UiPsHfDciz4qLD01mX
	 KzWfoFtUC2WJUv9D4T37+kAuPxrTiRuAVVlh44bCSV5hLjop0oP3L5Sw2vXUi4oRL5
	 hCvLhihKfRhdk7n6DSOqsTN/KAW8JE7AJAu/PqDTZpyQxbTl6VmoSGl7s/QTdLBQLz
	 oD/9tKOo79zeosQx9+P97Lc/H/OaT1yiET4Ou+ZVAECP52xlLUa3uzZkOu8H4mO1Fi
	 hIzIpiRxdEaMf+BUJjziuaKgHxOzvKvyr17sFO4oA6cEBe0JIlE70CrnZKMGFcV2MX
	 zIQ7fY0Hs4DUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EF73824F34;
	Tue,  6 Aug 2024 20:08:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: dts: arm: versatile-ab: Fix duplicate clock node name
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297490324.1692635.13155838956948042110.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:23 +0000
References: <20240730210030.2150467-2-robh@kernel.org>
In-Reply-To: <20240730210030.2150467-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 Jul 2024 15:00:30 -0600 you wrote:
> Commit 04f08ef291d4 ("arm/arm64: dts: arm: Use generic clock and
> regulator nodenames") renamed nodes and created 2 "clock-24000000" nodes
> (at different paths). The kernel can't handle these duplicate names
> even though they are at different paths. Fix this by renaming one of
> the nodes to "clock-pclk". This name is aligned with other Arm boards
> (those didn't have a known frequency to use in the node name).
> 
> [...]

Here is the summary with links:
  - arm: dts: arm: versatile-ab: Fix duplicate clock node name
    https://git.kernel.org/soc/soc/c/5b92ca4b2368

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


