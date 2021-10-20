Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D1AC4167B
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3A1B6138F; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CB8B361361;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=Dc5+doz4ou0ZbbcHgJ1PSkz1hKaTxV/BJEXi/J8FTvU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ERfN/N9sK2cvw5zK/EWxArUOQPTv74VZEGDyB7qJR3HVETHp0ybocBr3/4O4U6MFm
	 BIXJZqj1W3pD6oybj3XEufcsEtvvzlq2AZlfJzWMCly6frtWCuN3g/Ahr7uVIy4ZXN
	 7RWi2XlDPGKl4pf1SecB+POPHF88xY+JGSndLQprLBfroHGzCbGjPeNenlgBzjz+GD
	 qRV1rsYih5DT2S1dD2WxFawk51QGp279/YN+n5DW/51TPQCqY/tCucRBL95SaumS2n
	 YXwJ+dWelqVcIwt0MUn3jQvpgbcT5vK2jA0m56FIhWwlM5IWSj4otFxv/8GqkwcqyU
	 L+VAkiPGTYAsw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C169160A24;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.16 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781378.13902.13621250614432133069.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <877deemefy.fsf@BL-laptop>
In-Reply-To: <877deemefy.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 18:37:53 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.16.
> 
> Gregory
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.16 (#1)
    https://git.kernel.org/soc/soc/c/e844804baa07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


