Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65950C3DA40
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AE64C43397; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B368C433CB;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=jgpU6CowQZ8udTHS+cJve4mFGgQC4/i4wkSH61Fckg0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TlGYNFNS1MJHNDEWXkYRLMaVYyCq7waDQLPEUkrR/2BsPbyCHIEQiEgGBRvI1/6gm
	 Zcm//DU/6qHEBVDUk/6XXfP5b8xJ0a2GDbiF7Ml2ZmghEhvnRdAsHFDsKEUaqkD2Je
	 27yVVCPtzJZ0PqEFLiO23FOpqwDx9XLa3MMfi9ilxt1eGhzh3YNIMILUmBfzSb/mVJ
	 UETl8tMShHOZ3mKJ724Em/GQMuvCBNzvpHz+5VW6t0TE6d31mbvNx3gXJxAUWF6MSN
	 bfxQMJTHDrIXa7r+bIC0Mj5jBm6vr4YfJ2NFOmnGBA9ITwyuv63ITF6xSe4FpNQscN
	 utB5ohpyrx1Sw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF3A7E3308D;
	Sat, 12 Aug 2023 12:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 resend] ARM: dts: aspeed: Fix pca954x i2c-mux node names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462197.4542.13604850491003227102.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:21 +0000
References: <11a017bc452503cd391a17df3f029177f3e8e2d8.1689600517.git.geert+renesas@glider.be>
In-Reply-To: <11a017bc452503cd391a17df3f029177f3e8e2d8.1689600517.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Jul 2023 15:30:55 +0200 you wrote:
> "make dtbs_check":
> 
>     arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arm/boot/dts/aspeed-bmc-bytedance-g220a.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> [...]

Here is the summary with links:
  - [v2,resend] ARM: dts: aspeed: Fix pca954x i2c-mux node names
    https://git.kernel.org/soc/soc/c/4b46d86c978b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


