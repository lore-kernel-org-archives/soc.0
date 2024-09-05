Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A89CD5BC9
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7823EC4CEC7; Thu,  5 Sep 2024 15:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621A4C4CEC3;
	Thu,  5 Sep 2024 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550838;
	bh=cT6u2zszfLQ5UzncuNH0y8yAbji53tscUxjhvdhTmMg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KJ66E8Sfn4v0g4QjCZqggJNDKBIzCRvCIES3ls1EFU7FzvsI8TtyThldrFwsAuVGL
	 IZf3vyZEdgkqGrc3Rfv737e0NQ1RILgYs6w4n9mKax4orzYZ0yVJLqPic3tBsIsAO8
	 LX3oj/pFyW+QcCavJDuyOEqvNENKlMdr3GGV4o1NzMYswaUzbhNl/quioRQPOFi5lY
	 XbuT52DWlL8llpxqn3M7qRWQGppXqvclwAbqyHElSDc4EMXNCSJT6/Z+QC17jj34vZ
	 sXenCg0QMCsi6G/dcf3LCeXmz2mkfqvCVVnDiq86QJCXSl7uS0FS0Nzo09wvmoDlzD
	 9OrUu8o5QsrHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C773806651;
	Thu,  5 Sep 2024 15:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: toshiba: Fix pl011 and pl022 clocks
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083898.1737985.10754210468804384618.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:38 +0000
References: <20240826183848.1290957-2-robh@kernel.org>
In-Reply-To: <20240826183848.1290957-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Aug 2024 13:38:48 -0500 you wrote:
> Arm Primecell blocks have a functional clock and a bus clock. The
> Toshiba TMPV7708 only defines the bus clock (apb_pclk). Add the
> "uartclk" and "sspclk" clocks to the PL011 and PL022 nodes,
> respectively.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: toshiba: Fix pl011 and pl022 clocks
    https://git.kernel.org/soc/soc/c/6e7fd890f1d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


