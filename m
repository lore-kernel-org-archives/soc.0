Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C24C001DB
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6835C433B6; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACE1FC433C8;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=mynv0+nXV/UaZP+SY8SCdCPFjUio7JrPuOO2DzxKk48=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rAUDJlyZHq7pLVUlINloEunto0B/Fh2jRJJxd+W3/X1eV8JO+kCNULXEAHFZ5Hkcm
	 g0Ub2yw1laDgVMV3jfTP6dXSgpyWERLVVATBJKDKvMt4tI4gsCX4Gvo2Z0AClD3lfm
	 +F2pf4cenOX6rgVHwbCSbQSY3JCAk5xhXZMgccWBlRa/6VNNTmIxSObJo/RmJgffT0
	 snF+2QYhtyQGout6zYGv2rgLicLLVyao0dm3UQU+R2Le3Gv70CJgqYXdkPEkZZGJuS
	 wRWhyavkoIRO2l2bqXhJkuooleuvLvrO9IOW6K2as5aM6iItfvuovegtWNYsO/qM0T
	 IhLhxSkzXfT9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93237C395F1;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: defconfig: TI K3 updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943658.9834.1226632013347861234.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
In-Reply-To: <97a49740-32e7-f899-d153-743b5a57eba7@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 21:49:44 +0530 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5
    https://git.kernel.org/soc/soc/c/3e1a7433fed2
  - [GIT,PULL,2/2] arm64: dts: ti: K3 updates for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


