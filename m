Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C0BC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEA7B64F87; Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C5C4964F4B;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286411;
	bh=cQ6UIwN7WX3Um4GJzHjsUhTl6z8lY2yztrO436M3XYY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=frOPki6bNMmXHb39+4DKaIznT8pIKgNZfmEqoKqmJqwJIRIBnbDZD+hyuXDInl8rU
	 Ck9vGnE6cNL5FCfbiSGIinbYcFjTpkp5h41yBcfscBNCGKiIqu40QT6Z5ikLv5+BKR
	 CnugkcVogaqldnmlzjZpzkPLjRFle5TZbVobYMER1wv0/W0LgYsPQuxrXibFIFXKD5
	 nrTddiI0PRGQvMaEAg80Ugqq+PgNl5NEqzo+eTVPQ7tDjfA6YB+Ng0UJgXdI7ItXvp
	 YvYF5EliGbx0553/l5IXgIGZlonDYmWEyv6jgGuB2AMu/0fQvx4K9e/rppnK9QXSNG
	 UnpGVu7/v18Bg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BA2AD609CE;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges
 property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161228641175.5662.8984573357205459060.git-patchwork-notify@kernel.org>
Date: Tue, 02 Feb 2021 17:20:11 +0000
References: <20210121034130.1381872-2-lkundrak@v3.sk>
In-Reply-To: <20210121034130.1381872-2-lkundrak@v3.sk>
To: Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Thu, 21 Jan 2021 04:41:19 +0100 you wrote:
> The property specifies a list of GPIO-capable pins. Don't limit it to a
> single element as there's  presumably more than one GPIO pin.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges property
    https://git.kernel.org/soc/soc/c/1adacc491909
  - [02/12] media: dt-bindings: marvell,mmp2-ccic: Allow power-domains property
    https://git.kernel.org/soc/soc/c/fa432444095a
  - [03/12] ARM: dts: mmp2-olpc-xo-1-75: Fix memory node name
    https://git.kernel.org/soc/soc/c/7ca1ea0db2de
  - [04/12] ARM: dts: mmp2-olpc-xo-1-75: Drop linux,usable-memory from /memory
    https://git.kernel.org/soc/soc/c/ebfdb34c277d
  - [05/12] ARM: dts: mmp3-dell-ariel: Drop linux,usable-memory from /memory
    https://git.kernel.org/soc/soc/c/1130466a4101
  - [06/12] ARM: dts: mmp3: Extend the MPMU reg range
    https://git.kernel.org/soc/soc/c/5fb4df28da3b
  - [07/12] ARM: dts: mmp2: Use symbolic names for audio clocks
    https://git.kernel.org/soc/soc/c/d2192c0d3cfb
  - [08/12] ARM: dts: mmp2-olpc-xo-1-75: Use symbolic names for audio clocks
    https://git.kernel.org/soc/soc/c/a2decdbd7592
  - [09/12] ARM: dts: mmp3-dell-ariel: Add the embedded controller
    https://git.kernel.org/soc/soc/c/e691d58e3383
  - [10/12] ARM: dts: mmp3-dell-ariel: Add the power button node
    https://git.kernel.org/soc/soc/c/49061130eb1f
  - [11/12] ARM: dts: mmp3-dell-ariel: Replace SSP2 with spi-gpio
    https://git.kernel.org/soc/soc/c/0561cba77caf
  - [12/12] ARM: dts: mmp3: Fix the CCIC interrupts
    https://git.kernel.org/soc/soc/c/fff342100771

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


