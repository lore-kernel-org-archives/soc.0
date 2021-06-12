Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8041C49ED7
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 199D86141F; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 013F761419;
	Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514217;
	bh=YHselNMC0TyXfHp2emp9BPTAtcau29ca62asr8/b4nA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iRyhnMvVFQqG14bLBYKakezWVwNDAIwD6JMOvP4hOVwXZKCdX1ZHoH1fo6q5MO054
	 WOGpY+41qnmdv3ACPynrWLnBbK2uJRlumO6A1yx2wP+XAJVjHOz6iRFszbO17bHHxB
	 U4h96CRvjCvcoNNVCygt58UZrhBOddANmPnTtuWOMnGVf+1neJA/kF79LSTDkwJyI8
	 A4z63F1HuvDgJiAN4PH9ETfENgY7BKcXYHTqKVPlGu9k5wrDG0OHm721F0+yZuOyeS
	 AXcpK1e/IAYXiZ3yEGH+0LXplHStDd0083kmeigd3XM7MjfTEwZx8D0pAAty6SD1Su
	 yu6qPIEdrb/Ew==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EE71C60A6C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: gemini: add crypto node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421697.27448.587837368238562150.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611220501.684997-1-linus.walleij@linaro.org>
In-Reply-To: <20210611220501.684997-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Sat, 12 Jun 2021 00:05:01 +0200 you wrote:
> From: Corentin Labbe <clabbe@baylibre.com>
> 
> The SL3516 SoC has a crypto offloader IP.
> This patch adds it on the gemini SoC Device-tree.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: gemini: add crypto node
    https://git.kernel.org/soc/soc/c/83107b24c351

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


