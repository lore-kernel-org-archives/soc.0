Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02711C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8CD9160F11; Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 750ED60E53;
	Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633992607;
	bh=Jpzl/8bwVObAabJdy0oeoP3WfpVbr84J1LFi3vAi0E4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XSaCKAKiGHhh6nrcszONJUuR1hRWvVuth7SXHMiINqDWoOFDmStvtCPPcNFnLh60l
	 ASQZqf0FY9O6750Nv8XbhlBckhdeRDKi4wtCNGV639QWyTA3UBcKALHnjxPqevzCGT
	 Qk0q8+QIMPNXQvKJ6xZz0xmIZxlbmQ1Skt4/KOQD9RvjjOqV+coEMJTwLG1DWF59Dz
	 LzerVSczUli4jfutOOrmu5kdGMXEkReidNYwg+mN/r171GOh+jlYKAF+QNwFdOOERt
	 PfiJjuF3U7PVaOynnA+BpgutAPhMvIzDzL2gl1IB1KRpdUK51xsk6vlmgjjpGQl3Hi
	 q+KhoeAbLzBqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 65C79600DF;
	Mon, 11 Oct 2021 22:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163399260741.29188.14984287031106589236.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 22:50:07 +0000
References: <20211011124650.17218-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211011124650.17218-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Oct 2021 14:46:50 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the at91 soc changes for 5.16. We are really at the beginning for
> lan966 family with an ongoing activity in the clock sub-system, for instance.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.16
    https://git.kernel.org/soc/soc/c/f7fec1cfa0c0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


