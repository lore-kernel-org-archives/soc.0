Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71104C49EBC
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CBAB161404; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AA358613F2;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=iU0pvh83YKtzsYVIo7LJefdYxhy5jtej2roMZyQWqpM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pAQWXF0IoEfDdFL1Axb9cpcx30ox+gK6KTTcF3AiTANZy/jUUkJOMT2gV4hVp00Xq
	 7xr7Fk6eS+jlbvnCRaEtTuG+2XqGX0r9lKcRivX59BNDl1GmyHcercgM486k0c4ly5
	 1psefx5ATo6dyUMaZDs0+9bHtzJRtkwRH2B/DuBo9SSkEUB4mjhJnjD9IJ3uNgRGMk
	 Rr/jkS/0o6l5ZfkKGhCiKZfqBehnsNNERSrsNMmsEbAucdkvRi8+W9M43zq4Lixd9B
	 Zgm90nVKg+ANRlGsCWHwNaKs2eCU2S8xK56UFctmXKshurdLYCIr1/J+z+pQYjUYf5
	 PdpowlFc2uPXA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A246B60972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421666.27448.18278907375256638529.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <bb207cf8-fc7a-3121-eea8-56618b5952aa@baylibre.com>
In-Reply-To: <bb207cf8-fc7a-3121-eea8-56618b5952aa@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 2 Jun 2021 10:47:01 +0200 you wrote:
> Hi,
> 
> Here's the ARM64 DT changes for v5.14:
> - new Banana PI BPI-M5 board
> - handle of UART A bigger FIFO
> - various audio changes for internal DAC and loopback
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: amlogic updates for v5.14
    https://git.kernel.org/soc/soc/c/c7259477fec9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


