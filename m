Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01460C25B4A
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC8A2C433AD; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A49ABC433CD;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=bRf0DQcsdAH4TwSnKUu7X238z8G2Ul0MdflFlfdOZrw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kkyk928jsztmByl0PJll4UM1QphHARJRH2q+iz1S6Zot4SsgXB8S5YKgP+OgU5S8i
	 tKqz0wFqpP5v3HolTxFj/IErVG7/okuP2idyacJJIku7qjqNOQxv8KaRpBEnxyVjBn
	 paPHwvERGQdCa898Namcv/pQ9RhwaHOvkKG4QaQsHWFtEec9jeDbtue7TpDroNOvKr
	 ZO3zNwmcnIvJKC2gtwkYRdwI7wfafKPXFCRsrdwbeU9eNxTCwWR1e7JETK6vIZQX1g
	 AI0Qn9YB1qh9EbdcScexDHHT+K5JJ5VcIoEqsLrO5gahl6VYdiXXtaCi5QA7alqsHK
	 7Ms571hhSU8GA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80622C595C5;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943052.14534.11721854700745835140.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <f05c98b6-6274-4544-8fcd-0332c39244c9@ti.com>
In-Reply-To: <f05c98b6-6274-4544-8fcd-0332c39244c9@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Oct 2023 22:57:52 +0530 you wrote:
> Hi ARM SoC maintainers,
> 
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v6.7
    https://git.kernel.org/soc/soc/c/270797765063
  - [GIT,PULL,2/2] arm64: defconfig: TI K3 updates for v6.7
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


