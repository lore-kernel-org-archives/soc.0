Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F64CCA483
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F373C341CB; Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15741C341D1;
	Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657314615;
	bh=4nDTvyi216EvAbecGZ1ii3W0VaQaTXcIrCOK7ve13Ys=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=adm0RmT19hf7xSA78z5KjfcfoTp8wUZZ5CVL6kYxDN623K1KE417xgMcNJBaI8OAp
	 ZtHZvoDF/YJC7gIBRKMDV4nsgh6UecLz00aj6Ej0oXFh5qVMOP+PuQPANSkpKr1whW
	 rTWPdBX41mcxbIM7tYH7GV4RJgbpCK76LV0SxyPRB8XQ/WEURWDFcthek9H8VH7vMP
	 TTLzOphEVJufxrNNUCJ9qe0aBdUYAcHJ+UZvgd9mvsoFC/uf9eEYb0JcAfOJGzQ5Bs
	 JbARQjxqKe9+1HjpmPaZc+gIwK1KKpnvTrOutgHx4BNQWpj1z1hFPzOp7H8atEVJkc
	 I4Pq+A9nSdykQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F082EE45BE0;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for v5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165731461498.21745.15421559146027639560.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 21:10:14 +0000
References: <20220708151621.860339-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220708151621.860339-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Jul 2022 18:16:21 +0300 you wrote:
> Hi, Arnd, Olof, ARM SoC maintainers,
> 
> In case it is not too late, please pull these 2 fixes for 5.19.
> They are necessary for proper working of:
> - I2S1 interface on SAMA5D2
> - switch available on kswitch-d10 based boards.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for v5.19 #2
    https://git.kernel.org/soc/soc/c/5e7230a4daf9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


