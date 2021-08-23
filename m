Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38717C4320A
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 21:50:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C44D2613D3; Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A94EC613D0;
	Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629755418;
	bh=B/092mHt/DacOVgqBiVzCoIJXCBHwtTAsHNB/fT3C3M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SFFpr+uNy2AO6kfgsJqA7wevl8MTok9n8aSe3lzaYWIm5I1AKtzt5TyofKnTQEbVd
	 FGoU4tO+XeKxxo6SORDqouMseTZjVs/9lSKeFci3o1HpPXTP5PrC9iZDGWKrpLTTbz
	 6+f5g2mexeDTpLCwR2/0xJiec5Lbbuqs0Pr8frzTpDQzf+zA6NXGgGs+J5sepvfz/s
	 P7RaOOC41GmtonOSfEGTNdCwL9A2I5IQHCEV8bSWyu87tK3RbKe27jk6EDPn1slA6z
	 QDOE6zjLxuyB/wY7qCLTXFqpELjxQvpWRxDWOYEPXE+Ijx0MHICzdXcI0pftMS6/qi
	 j0IqJ7aCIEPww==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9B69E609ED;
	Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm/arm64: dts: Fix remaining dtc 'unit_address_format'
 warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162975541863.28427.14074898549351837542.git-patchwork-notify@kernel.org>
Date: Mon, 23 Aug 2021 21:50:18 +0000
References: <20210823165126.2320910-1-robh@kernel.org>
In-Reply-To: <20210823165126.2320910-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 23 Aug 2021 11:51:26 -0500 you wrote:
> Fix all the remaining dtc 'unit_address_format' warnings except for the ones
> related to 'register-bit-led'. For those, we need to decide on and document
> the node name.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Add back intergrator vco1/2 labels.
> 
> [...]

Here is the summary with links:
  - [v2] arm/arm64: dts: Fix remaining dtc 'unit_address_format' warnings
    https://git.kernel.org/soc/soc/c/054bc6a105d7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


