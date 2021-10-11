Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B5BC433FE
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F23861038; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EC70960F21;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633989010;
	bh=Orpcqtjp1BCJUvyowZgX2pKZFQ4+ShjkxkG3SjdSlXc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QiEZH5ucc0hpr8oTamiyGwshAaw/B/WfAqdSxfhntPtnoyWWk8BUt9ov95s3FQyzD
	 f4ew2nz9p7QVdUvT1UQdrlW1nrjNheSB5Kp100ymMXYcbV7kxB20wSXZMcnFzcNfcn
	 oViYpWy3jUrXOGtHNyDCV7+9GUbZhOVj96QE708wyN/Q2kvkYA0Rs0UXMY2OtEnYuM
	 irZf1lQojEveZ6BIK1Npa+46YRoTVNC+qDj11XKhQFYPg2/Smk3a9z0SEVjVdao9x/
	 DReX4Wj0yodJtRrOf6+1Md9TDlNIq9dohYc317BFwmqbHfln0iWVadlObpERCs++Va
	 gq6oYharqKbGw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC68160173;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.16-v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163398900989.3472.3915774463825744960.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 21:50:09 +0000
References: <9815867c-ffbb-fc9d-64b9-badee5e2862b@xilinx.com>
In-Reply-To: <9815867c-ffbb-fc9d-64b9-badee5e2862b@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Oct 2021 09:21:03 +0200 you wrote:
> Hi,
> 
> please pull this one patch to your tree. It was acked by Rob already
> and it is based on zynq/dt branch you have in soc.git tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.16-v2
    https://git.kernel.org/soc/soc/c/687d67639b83

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


