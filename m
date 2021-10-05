Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4566C4167D
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 854F461881; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C83A61244;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=Xe9it8feci7Kh4KY/Vq7zNJVlWmx4xLjdjfvgf+/wnQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Cu1Klwjp841Yl9UM5odbxs5JL9RwxH33w7H/y9gS2WtV+FOFPvMDid7OBMs5vgf5j
	 lSW10aS6esbNK4OZIMVAVVwyte8Xq4LnQSAIwHzxWgaPxIn9zvPd1PtcN9Altl4dga
	 e39XvlfG/F90CsJzWG9+D46Jj4GOr+v+9Zij16k+IPdXAJnEmEPPZFRUBM5Why9eOB
	 FRaQRu1fjFCeDEm2bbAA12Jo3s+49Zwvme+9lFPEL2vff4oZ1kxpvzqpSga0lXNV3Q
	 EpmFIo8dgvAkpFW/OQrzAM6bkgmmWuk/m2zURtUbCbLN1MkqbektMiJAKs/CjvktLv
	 fnBGK6QuYcRDg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6064260A3A;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dove: mark 'putc' as inline
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180939.2242.4258926684022576745.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210927095343.1015422-1-arnd@kernel.org>
In-Reply-To: <20210927095343.1015422-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 27 Sep 2021 11:53:33 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This can cause a randconfig warning without the 'inline' flag
> that every other platform uses:
> 
> In file included from arch/arm/boot/compressed/misc.c:29:
> arch/arm/mach-dove/include/mach/uncompress.h:14:13: error: 'putc' defined but not used [-Werror=unused-function]
>    14 | static void putc(const char c)
>       |             ^~~~
> 
> [...]

Here is the summary with links:
  - dove: mark 'putc' as inline
    https://git.kernel.org/soc/soc/c/b9af50bcbcd2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


