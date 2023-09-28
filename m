Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BAFCE7B0E
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 057DDC43391; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F51C433D9;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888044;
	bh=IGQXBZJLKbagZy+e+UF+emxslyWRfc1YbazMI0bntcg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aazLz3wcohRztRcCbfOHn8a8MrXM/mrIJm9wg6MatZouZYgmlAtUds/9laAfCzUEZ
	 2irleGOKOrC/FJu2dEXVIjOpdq6ttm7FvHtDu6y0afbJd+oz5YIJA9+9Ut4Fv6bJqG
	 tr6g7Dgr5fxCx1jY7A2AjXrHLVJx5MHT/CeKZcSyg40p11JVuhtQVRPF0D8ZpPSgH2
	 m9WK8p20yNtTjwrl17nlMhdQgI4hZkx/jaPHp+tDMgmLcNZ/ZDi3+K/O255kZwpHUg
	 K79McTIc0N1PuG0Fz5X2zLIBFrr8uxadpP/OvQ6RDUqaOSK1r98tzdCBYCS5ErTGP2
	 gXC1IcPJEPv4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB6C3E2A057;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: enable syscon-poweroff driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588804476.3136.7635113847290308543.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:00:44 +0000
References: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Sep 2023 13:57:32 +0200 you wrote:
> Enable the generic syscon-poweroff driver used on all Exynos ARM64 SoCs
> (e.g. Exynos5433) and few APM SoCs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: enable syscon-poweroff driver
    https://git.kernel.org/soc/soc/c/d75e870c32f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


