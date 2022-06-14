Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6959DC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 489E4C3411B; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C223C341C0;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=ifU6MtKvVd/anFjGAtvn14QTDKS/ZGBOq0NGMjpu4dc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=goV6WTKULh2ppCxVCkn27mUWTQyF5oZwjwbePbXlPuHo0OpJbXcbtQErk94Br0aRK
	 fsloI3mN66Y0vCvuK1PTnNbOmkQ06gVaolX4uNWqCP4NF4Dg/sr3ei9Puk6PrINGyj
	 54R/DQTCBwd8fR8LH5irc/n+Rhs+imiXNm08+mvt9/7y3Ti60uJbMnFWlcOA5+IoZB
	 Qrq57UEI6P6and/hBHffX76coXa5kTN5qy1tt1Hj8kcqSsjeKBzCsH8sD5t82b+dUO
	 hb5EerQE3P/BiLoKOr2WT6ijCUiODayXIbRD2A3QvmqvPkYjWghK2O6uWJWtvnndc8
	 ofBl7GerbFxmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1DA5E73856;
	Tue, 14 Jun 2022 20:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: s32g fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881498.29335.11548759629987238059.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:34 +0000
References: <Yp9Y4nGrQ2kVKV6S@linux-8mug>
In-Reply-To: <Yp9Y4nGrQ2kVKV6S@linux-8mug>
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Jun 2022 21:55:46 +0800 you wrote:
> Hi Arnd, Olof, and ARM SoC maintainers,
> 
> Please pull the following two changes for s32g. Thanks.
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: s32g fixes for v5.19
    https://git.kernel.org/soc/soc/c/2d2cb31bd36b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


