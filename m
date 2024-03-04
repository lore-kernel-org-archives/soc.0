Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB135C54E4A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AC66C433F1; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75181C43390;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=U/pTucBgN8wxoAhh3UbXeO2T69GhJK3kRay8nVN+k58=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WlMKd457Qrni9CcY+BlrBriFSWAwSeWKpEsea+5N1sd6lri49NWWQH5ivuHrvVGP8
	 iOK5iKJgITIg9PgHd5yU35eqV8oivc4clm1p8sERDceETDUEDwzAd+14ON5vCaGVTa
	 he1BhR4+OAWtP/hXCcvSgMNDC1KMSb5jjq06JsXYA1i37yyJOKlxUZEcZmWG66mQJt
	 f8WBcELUiZipzqli98bMereA0uZjwPXNaAdb9eMU57J75u8QrDwCOfXgUQ1Lj6w3UW
	 GC5ylEUkE/9XMVzBcCswaMAArpmdvTQrJQ+f3M3rOC5mlI9YcC01dxYK/2EP2yS6s3
	 xyco/KagsWydg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F368D9A4BB;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.8, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869732.25915.16708535906694521810.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
References: <ZdtPJzdenRybI+Bq@dragon>
In-Reply-To: <ZdtPJzdenRybI+Bq@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 25 Feb 2024 22:31:03 +0800 you wrote:
> The following changes since commit 7bca405c986075c99b9f729d3587b5c45db39d01:
> 
>   bus: imx-weim: fix valid range check (2024-02-06 14:10:47 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.8, round 2
    https://git.kernel.org/soc/soc/c/d20f2a196d28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


