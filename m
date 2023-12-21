Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579A4C47072
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43A37C433BC; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25478C43395;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=Gq49EV0mComXLBuzwWdBYQqzFBfvc8kkrShGriak6PM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ol/yiZMWW1ECahJZHSrBHaoDil6MFFjtFAfDsaIv4Ok4khaOGW5Izm4O7+snkkuso
	 4MCkxkYsdP1k86PyUqA36jMD6UOQjKmIxSm5PjcIU5dvbOEqHkSFoMako/0akX9N76
	 hXK/LoczMgewMiruYWcsTMpkrs3gmp43YaISJzZ83lbUXt9nk/ssXO/93MBUfgn+el
	 tiXGFs60imGEhW+LAc38wSBe4hw+C41qj09kjLcqfxi11c6RgNQzDu0s4fcO8TKkr6
	 WSGHBsl1ZqZGvJF7crYuOJtmCJzbHIcV8lJPXT/Yvm4x4+ZH/5Iweg92ImbdVwEUGe
	 nUdz+RJAejylA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E9F7D8C98B;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL RESEND] arm64: dts: ZynqMP DT changes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046605.3302.17188535993114512551.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <CAHTX3dLyA1Y9guLKSNJTChFVvkspMfTa0odULyAdcuFUSiSH3A@mail.gmail.com>
In-Reply-To: <CAHTX3dLyA1Y9guLKSNJTChFVvkspMfTa0odULyAdcuFUSiSH3A@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 09:09:03 +0100 you wrote:
> Hi,
> 
> please pull these changes to your tree. Most of those patches are related to dt
> schema fixes or solving issues reported by W=1.
> FYI: I have rebased the queue this week because Masahiro sent fixes tag Dec 12
> against Rob's patch and wanted to record it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,RESEND] arm64: dts: ZynqMP DT changes for v6.8
    https://git.kernel.org/soc/soc/c/55bfefaabd45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


