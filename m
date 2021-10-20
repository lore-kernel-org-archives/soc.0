Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7227FC433FE
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 278BA61359; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 109826137C;
	Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741407;
	bh=zlTN0f+kd/Ut+9oPAK9Y04i5e2oHQUb0LURU/sjitzk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dx6rfVCo0KhxBTTxRlR5NHiVaZ5Gq2tjc+SX10Pd35/GMKVuXB2gXW7RionyPlHZe
	 ftsa/KlxXflPkpDjycDzX0Pwz0cnJN17ldhwC1EsKOQyXaHrb6NaEwBsA52+vdAxxx
	 UtKIz/oOJ/WRKWjz0rBN178Kn4sPN1t0fEz/+Cu14qlojDT0yfQHa/nVLd9w9JweRp
	 KYyye6aRVtC2s6Q1q7kAd4ZyLKtV5atnMFKRkJnTgxO9eVqka0JRmH7ZYELxvpKUOM
	 fmKiF8ytIYBLfGqx/gPXH8Ko1UuTmpptOAtsela/xTlC2ama0+YQdivja38tbn+DK7
	 hu3jjYfkACkGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 05D0260A4E;
	Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474140701.10750.14266121943280864568.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 14:50:07 +0000
References: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
In-Reply-To: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Oct 2021 17:12:51 +0200 you wrote:
> Dear SoC maintainers,
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v5.15
    https://git.kernel.org/soc/soc/c/36b6dcbc1245

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


