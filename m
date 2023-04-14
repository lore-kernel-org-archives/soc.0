Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0810C77B7F
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD8F4C43442; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2AE5C4331D;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=/AufM2mfDix3LNJL5uGD5QCUnXa+3Ppn0AY9sbaBk3c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mfSOO2VqHhEZlbu++Je60YmkeTj7iLLn/FDjdPRhiTEwY3q+/2PFOXQNqb3LQ8JnH
	 MyFjJP4q4Q8cuglHnRgvH+AmFuAU+3QauI8Vx4Asn5RYhdt1Y/CIcP8PgkxPgXeloA
	 O5SETYKUfJqD5ZlfC77OiQDizT0dOm5f3AtNoy//iIT8gfL0v4NBa9nWTDyVWmktzc
	 w3B2k3bPq1+fqxwrnllWSOqDHbRjPe4KA0bkk71U1F/3Q06tju7HRmqOpuNpDy61cq
	 f460mJTm97IPmvRv8DEdoC43XzJbGUuIlXk/yC4XyZvM6RCwg7Iv7aGZo1MeBuJ5RD
	 N5cXqmY+Hl/Rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A8C0E4508F;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: nomadik: Replace deprecated spi-gpio properties
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926362.30442.4223686655099058324.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230410220300.2431524-1-linus.walleij@linaro.org>
In-Reply-To: <20230410220300.2431524-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 11 Apr 2023 00:03:00 +0200 you wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> As stated in Documentation/devicetree/bindings/spi/spi-gpio.yaml,
> 'gpio-mosi' and 'gpio-sck' are deprecated properties.
> 
> Use the recommeded 'mosi-gpios' and 'sck-gpios' instead.
> 
> [...]

Here is the summary with links:
  - ARM: dts: nomadik: Replace deprecated spi-gpio properties
    https://git.kernel.org/soc/soc/c/325ae154b42b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


