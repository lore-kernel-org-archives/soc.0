Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB15C433FE
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 954B6C36AED; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CA8CC36AEB;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010612;
	bh=JP7yWqPoZS3j0a4W2nvCc+bdNn2ivpbEzhq0HqP0158=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iX/bRRsnUGpBSlgW7pfy0UJxNqZq64fwLsWYvRSuyjBX7TFl/RjqQm0Bf3QLwgeq1
	 /ETLmlqyQkYBJItcyY/F0Ov6/b/SNOVvIo1s/tkFtHQupODsLkvikKlcMeODdRllTv
	 xXrxf4HEJVS1/1QoW+iAroFg13SsdOMUlmVt1quxrYdhg7tqXLh662mZdJV03AWduQ
	 xH8JnIb4gR3br3Y8Q81haKop2HPQeChrDDRqGrXrOE/neWWdP5NOeLjxi92dEy/JkL
	 YwJxNkBRotwjlsI6Wg1M0i+rZSO4piR/p87/Is2vZHQNTrJEuJlAIX1091cJJAJgia
	 252arWeJWbWCw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5E41960952;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] reset: starfive-jh7100: Fix 32bit compilation
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061238.9073.2567888580372956795.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 14:30:12 +0000
References: <20211220121800.760846-1-kernel@esmil.dk>
In-Reply-To: <20211220121800.760846-1-kernel@esmil.dk>
To: Emil Renner Berthing <kernel@esmil.dk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 20 Dec 2021 13:17:59 +0100 you wrote:
> We need to include linux/io-64-nonatomic-lo-hi.h or readq/writeq won't
> be defined when compiling on 32bit architectures:
> 
> On i386:
> 
> ../drivers/reset/reset-starfive-jh7100.c: In function ‘jh7100_reset_update’:
> ../drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit declaration of function ‘readq’; did you mean ‘readl’? [-Werror=implicit-function-declaration]
>   value = readq(reg_assert);
>            ^~~~~
> ../drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declaration of function ‘writeq’; did you mean ‘writel’? [-Werror=implicit-function-declaration]
>   writeq(value, reg_assert);
>   ^~~~~~
> 
> [...]

Here is the summary with links:
  - [-next] reset: starfive-jh7100: Fix 32bit compilation
    https://git.kernel.org/soc/soc/c/299e6f788eab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


