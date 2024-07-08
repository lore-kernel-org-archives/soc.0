Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DA2C3DA41
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3142C3277B; Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7CDEC4AF0C;
	Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468236;
	bh=SuBDa/nxz22U8HmYyWea/aiJ0pJEApiBTmUHAjF1K9g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mDMmGNDQh10aCAM2iM4HJrfYsZxrnv0F7ondyv1ybbPYnoWmcwPxJCkYrGeqI0QoD
	 XS9yTcLW50rP5GuWTfBqKMtjoNiLTfcyqyGhLgs2T1YSxdDq0N1BC39UM+Bw1Bo85g
	 4KsIuVjjaQ2BkDLqiwXPKymQWaxwul71CkGbMQMkK7gXmVvGCx5IdMGm2PlQvibAGf
	 VdyV4U92yPVBR3T5GQsdeUB/P8p3J2tR7eZNHHD2u+wFW/5Mt9Yk/MDuQJDdxc1F37
	 TS9tdadYoztDPC88nRv6AQaARATbUMq0K6fHDN/E6s7Kpo33x6S6zQGerFH1FN28Y4
	 /5vO866P5X6WA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8C76DF370E;
	Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] MAINTAINERS: Move myself from SPRD Maintainer to
 Reviewer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046823668.24660.6436550199094248403.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:36 +0000
References: <20240705091133.3308539-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20240705091133.3308539-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  5 Jul 2024 17:11:33 +0800 you wrote:
> I've resigned from Unisoc (formerly Spreadtrum) and cannot access
> internal HW specifications any more, also cannot commit much
> time for maintaining sprd code, especially DTS.
> 
> While I'm happy to help review the sprd drivers I wrote before.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - [RESEND] MAINTAINERS: Move myself from SPRD Maintainer to Reviewer
    https://git.kernel.org/soc/soc/c/f3a6a54104b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


