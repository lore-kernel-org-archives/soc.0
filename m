Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44183C3065B
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37E93C4AF16; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21A3DC4AF15;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609650;
	bh=4u+Vnk6Y3L9AGlEknNMP77Mb1nFNnmHWrdpdo9aBRf8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h0yVIXtt2yWDCsVUVV8R6uPJaCl699LdPzuBTnZEckBndzFIDuysiWMaUK9zKeZbW
	 A2sBuXX71mnc7OdN3KrNtGcUj/jDah7NrE844g/3qYyb9kKUTngXSGFNU3Tw8tEGl5
	 9xtI6Te4bZ9twBwcFLeXxsiNpGchHr3Yqs5Ja2TjyGC0e1yFVPyArQGATRxKKDJb5y
	 2ANhlZgFQVnpUmxWV3/cK8TsbTEugc+dqG0Xkl9xljKieaFknAuueSfH4kbGgpiuTR
	 nZI5pdMIP9HOPmdvXgwWuVYaI8Cs50gYuj1h31J7PFXa+hwAVYLrTQfexJinE1ni0q
	 fvLtwbPRlkl5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1488DC43443;
	Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: dts: arm: Drop redundant fixed-factor clocks
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960965007.14447.451891138334977964.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:50 +0000
References: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
In-Reply-To: <20240627-arm-dts-fixes-v1-1-40a2cb7d344b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Jun 2024 21:57:38 +0200 you wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> There's not much reason to have multiple fixed-factor-clock instances
> which are all the same factor and clock input. Drop the nodes, but keep
> the labels to minimize the changes and keep some distinction of the
> different clocks.
> 
> [...]

Here is the summary with links:
  - arm: dts: arm: Drop redundant fixed-factor clocks
    https://git.kernel.org/soc/soc/c/b1a4e71d4fc4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


