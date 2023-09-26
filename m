Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93697E7F137
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8545DC116D3; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 702BEC4163D;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=3P8e+DehayF+MM3X9ZUtuL2mD1ol5+fldL+h79A0xjM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KEtB3Ahkq/JhBMRbu4laMt2YDt9VQMgwkDpfz178mng+yYY6ulNkv8k6Fvg9+ESua
	 C5qK9uz+BZCJK/nQdx09jz/7bHG5/TocLRvAEgAbkUuLAmLGvDJofQT1cai08POxx4
	 FR7QZMRC2QeSbxSGn1eoK2VUssTChFFZuP9j5Obv6pGlfA9Wyi+esHprhsbOCUQrjH
	 D07Oyqa0wol1uvqIGNm7NyX5vsY1al+0sWTq+RtfGTnMoenAw6ZftdmCjeBZKr1dK3
	 T3j5XOo3j5YrygnIFTYqThTAwLOv2hwaZu6IXBUHuN+KIvjKlfn34nVe78UQiaRHwz
	 xC4B2Q5nw1ukA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5EF19C691EF;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: mediatek: Fix "mediatek,merge-mute" and
 "mediatek,merge-fifo-en" types
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223338.24546.10454059403943686840.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230830195650.704737-1-robh@kernel.org>
In-Reply-To: <20230830195650.704737-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 30 Aug 2023 14:56:34 -0500 you wrote:
> "mediatek,merge-mute" and "mediatek,merge-fifo-en" properties are defined
> and used as boolean properties which in DT have no value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - arm64: dts: mediatek: Fix "mediatek,merge-mute" and "mediatek,merge-fifo-en" types
    https://git.kernel.org/soc/soc/c/5f8456b1faef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


