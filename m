Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF215C6FA96
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3BD8C4314E; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB66C4314A;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=Chq3gfecInqVxlQifP7UQO7c8nSl8g1JYFkeFZRmbnY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nf/1fjgIOV8GVXq+fU9K3l7lLu/OEpRA41hirK1kOdkJazvJjAfwo8uX3A5LWbKpY
	 /mcHXYerIrZxdIIpVsE1+9pemPlg64r3uo4UpTaJhOm3yyAtOZ9ulYL7nc/AFQuYc0
	 rTwSPNW/lRB9K/KFl8MJi+5KV3RFS87YWtslV0h4iQH0PplR3pjWzj61t9cfO9JAzr
	 z8Wp8DYY/jTCdKYlASLu722YtU+d9/Aw8PMQ9zbIr4Ezeks2fKxiQ9q7nuMw9ytGCM
	 4JIUiHlGxiVaYWRCitNTh0qxXFxN4EHU6BWZpbBTHfl2syTmDgExzHuDlsZYcyQfJu
	 m0U7zan5VCkGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7B405E4D022;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL 0/2] Two patches for next cycle, v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882949.18494.2698142571686819366.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Sep 2022 12:43:52 +0200 you wrote:
> Hi Arnd and Olof,
> 
> I got two remaining patches for v6.1 - DTS and ARM/mach code.
> 
> Best regards,
> Krzysztof

Here is the summary with links:
  - [PULL,1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    https://git.kernel.org/soc/soc/c/3ba2d4bb9592
  - [PULL,2/2] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
    https://git.kernel.org/soc/soc/c/c1ce7edcb69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


