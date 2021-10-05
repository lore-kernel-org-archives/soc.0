Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0D4C43217
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F665615A4; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4441261506;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=TwNoljeeS9Ebz2+y+48a064k1x19hcUPoQ6+PdS/2Rc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b4RWZoO6oOjRHGQI08qK17hBHfEeTt1ZcUnJKI6f85s0Ukbd2Wy6YZeSLcr3TWBXK
	 VZkyCFi9xnv7A/j7M+TgBXKLU1+SEar80bAg27i5CR0gvH5Cnps0HRXaHW604DtzzU
	 x4Jdo60nd2gD97b2NrFKcApkiXSKAbdvps3lQg1HaZGMMV3nbQqHueTjEzMrcefw1c
	 uYO6/xTCVEmIMAHK+kr7gFxuwOmpwusXRK3ETkd2/1JyUqS1S303uFTz6qKKQQJuwL
	 mrDJUIyGzT0W2wX7qD2ATqhmdCysvBFc5C7G5Y8DOI9gzw88vEM8wEkmvuHYi1AZX7
	 uAfHDrpW8lZBQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3A41A60A1B;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] arm64: dts: juno: fixes for v5.15-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180923.2242.11133553585159475899.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210927105249.3583380-1-sudeep.holla@arm.com>
In-Reply-To: <20210927105249.3583380-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 27 Sep 2021 11:52:49 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] arm64: dts: juno: fixes for v5.15-rc1
    https://git.kernel.org/soc/soc/c/2ecfddb105b6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


