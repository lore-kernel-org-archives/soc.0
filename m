Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14796CDB483
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1662C433D9; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F68C433CB;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=68HI9eXeE+30SeVc2pFQvz4sNZXU+JLYQ5pTx7RmrX8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gkrL04f7z1a0Fy8dZXMBwpL32RhdS27NWqn3z0Y/ffNzsNxb2JuQM/OEsB1u08nGi
	 DeaV4m+sIOkY3xaqaxE+0b1aYzOIiRTzg6ADw/31q6veQrbD9iFW8jlLydd7TGiqZd
	 IjYiIEz0/jZ30Mm6p/M+ebVq3zRvCvZybB/mbyC80qTiWKUq/+SadbgUsKn1i5PtZn
	 nZHK9Vf8IKaWadohVmDXtRQX2x341EH3+c4WKlOS/mvOWY+wFV/YOmo8L5zNzXnkzX
	 z2yMJ0i2qTHhgBG89lm6r1+oi0/b5jBtCukf9BgYMvuueGurXtlXGFNnUgaOnspjtZ
	 bE4qrdD06TN5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEB0EE4E9BC;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002771.24805.11574063631209995286.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <CACPK8XezpL-4bx0S-9t999_qde5Hik9BnuUZHcnmDHTd0KWBLA@mail.gmail.com>
In-Reply-To: <CACPK8XezpL-4bx0S-9t999_qde5Hik9BnuUZHcnmDHTd0KWBLA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 12:18:24 +1030 you wrote:
> Hello soc maintainers,
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: defconfig changes for 6.7
    https://git.kernel.org/soc/soc/c/8788f221b178

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


