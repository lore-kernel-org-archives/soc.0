Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2A3CCA48A
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 690BCC341E2; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F04AC341D9;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=SoIz+c0K4C/CImWyGaOpBmAqvzPnussTe+7spil1eUk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RcDhSTBLcpubr6qk/WBT2+oaJQl14HoFMvIQPBf24sn0Kj8R+tjTsd7DC8hCClM/s
	 xA75QTvzDKsCYI7rhpQFvVSYDy6+OwhghO/9yDoNjxYEUYI+tChF1wNh/Wc8S3BSvn
	 P8Hxmhz1dx9nq3+N1AErXm9NvYOGWWJzJ8n0Z9iSb5RmpRhjIPSa7M5GjYEx1ol6DT
	 d+fq55TBuu/bfozE9BGmkmDwQUYe+xV02ZOzRZdBsaPu2zuJs/ftfSZeQehYHM7xCH
	 eYawAbBCQa//k+UR0mKqFXJagK6rI02IXZEdS1rEMAa5FG+Uc3XpEIwt/GpRDRgdcU
	 LYtTPyYDaybpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37CF6E49FA2;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: marvell: adjust whitespace around '='
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809722.26141.4815216063768929807.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Thu, 26 May 2022 22:45:24 +0200 you wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: marvell: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/8c1be9336e9a
  - [2/2] ARM: dts: pxa: adjust whitespace around '='
    https://git.kernel.org/soc/soc/c/4580f60b2337

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


