Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D222C001B0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2487CC433CC; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04DE5C433C8;
	Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=CeRGI4jDNsRUN3GRF+Ivar9msoeswdRObED0SiUi5Aw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BePXhKSdw/ZiuXkWXySZLv007ZaPctXKf4MC5qJSbXfGNIErZSBBrSQBwi6kq3IIq
	 EBX5V4+r9azYGZQIPuVEpEskhoIHeQKZ9q1UCZXLDT3xGeMjNrtm+r2SRmJ84pDDgu
	 0KnNsYw2MGBaXpZCJF95YaQXRQTpLySmLPjesusD67jgV+4EoOegn0BNEIta8MJmKZ
	 Ix05n1oZ5piqS8btQQHQlxx8Al3ApIFNLWPXZejKPg6MYlts5CtIfpAP4meVth1sWg
	 4KOo7bYei/roz+IA+weUk89bN3s0ndBNY+VzENSuIOlHZoQvGxdV91+SRDgZkDYlz2
	 s5fHJKdZ4wzTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D67B2C3274B;
	Sat, 12 Aug 2023 12:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 resend] ARM: dts: nuvoton: Fix pca954x i2c-mux node names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462186.4542.11097462968188045123.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 12:50:21 +0000
References: <0e5625985cecd70e0f766da8eace6c6f7ae3192e.1689600667.git.geert+renesas@glider.be>
In-Reply-To: <0e5625985cecd70e0f766da8eace6c6f7ae3192e.1689600667.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Jul 2023 15:32:13 +0200 you wrote:
> "make dtbs_check":
> 
>     arch/arm/boot/dts/nuvoton-npcm730-gbs.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> Fix this by renaming PCA954x nodes to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> [...]

Here is the summary with links:
  - [v2,resend] ARM: dts: nuvoton: Fix pca954x i2c-mux node names
    https://git.kernel.org/soc/soc/c/bc924997c750

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


