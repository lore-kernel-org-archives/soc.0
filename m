Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77361C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2A77F61372; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12C6560FC1;
	Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634847608;
	bh=LWMbsMc+kKTYExi9FhzLttd43oKIHkrjfKM2na3kuM4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UL+IWNh2Kr3YILL3wTQayBkjH+Oj+gDZzyXTOxRQw+K+ROMoemHz/XVME7WZvY8L2
	 88hTwkIo1tO1vhbT1bwsWOcIAlkvtFu9AOcIQ0GsVhtqqRDLIlEqPig3ao0O2x1452
	 1tBh5PtFFb2GbzkJyHnZVxAOjcjF6ntzfkUCktB0lUyldLRp+7O4k6/BEToaB9GwXH
	 ALmrB5SYJy5Tqaf1CDfGDkKnuqjjz07fsuibPCMA2V8d95pt8uKuCDEQzGiQ9y+6jk
	 yzici3+8ORQZU1llxpgE+C8TnibWXc9W3RyEWdP1sdd64In179n1qpMISRDvIABfoV
	 /zfi/3NT0ve0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0906360A21;
	Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163484760803.31591.13054855407639419716.git-patchwork-notify@kernel.org>
Date: Thu, 21 Oct 2021 20:20:08 +0000
References: <CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com>
In-Reply-To: <CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Oct 2021 05:34:39 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are aspeed defconfig changes for v5.16.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: defconfig changes for 5.16
    https://git.kernel.org/soc/soc/c/6fc04eacf1ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


