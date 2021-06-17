Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FABBC49EA3
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2BFF0613E9; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1296B613E1;
	Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623894605;
	bh=U+7v4YH6uHx1QMrIUL40VEkU+Yop+rNu6pIK6IhPh4I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AXSXr9hGb8RRbhXfBJxJP10XCUjY30SErggiL/0FGBeUR3JFJ3NL4oGCpNKm+Mn1Z
	 ttTFuN0aWUcUr6Hbfx/50v+rGTL3iMaWxMN8CwTEbUGYQ++zoJIejibvx+nwmlW4l9
	 ZjEwPMD9PuT0ooovPAuH/L44xdknLP4h4Bd0+2ZWncjM45CbvYJC2U8/fe8WpfKwfx
	 tX74TXZzYhGuzUabxnU7TrjhNnLnAPLNwrecf9/ZAgQcBkuPiXzIQ5Slu7y7v0QDtw
	 qcQmOuoU4/e4bC1dNbnNUxGSCHYFNN6iSXuJc7QZEZMf803UDddvt6K3wMKtYqWJpE
	 uGZYM3AMfJFVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0A1FF60CD0;
	Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Visconti: defconfig changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162389460503.26973.2028951233765157746.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jun 2021 01:50:05 +0000
References: <20210615231232.pllzlqoamkmnsqq6@toshiba.co.jp>
In-Reply-To: <20210615231232.pllzlqoamkmnsqq6@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 16 Jun 2021 08:12:32 +0900 you wrote:
> Hi SoC team,
> 
> This request includes patches that enables PWM and GPIO for Visconti
> SoC in defconfig.
> Please pull for v5.14 kernel cycle.
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Visconti: defconfig changes for 5.14
    https://git.kernel.org/soc/soc/c/c8700d80d75e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


