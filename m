Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB4AC41535
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 929126197A; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B04C61872;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=+WNJMVC6B3+832lZVIXNon12NMdnMugyI8DkalKgJwA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WiklXPIkO1ZkWU5yzmwPRnm2nTKc8o8Vdt+Kb7yfZLQJDEMTd/HIvj3x04R7K2Xdj
	 l2Q2zjBTsCq9k/M9uBKiKK2InfvW/KEJlzEKMh+S3QL9iyQPObrf3ZUgk2HtqE46hL
	 pSK2m9SUcJfEgxLuKpBwG7DUvbNY26Me99wrP/d/aMPw21op7TRAl6Hco5fWpJWuq7
	 usBnRI4JoN1yuLF9kg+0pXVHNJDuA/yTeipQvQXfJKPfF0whV5dMvoG13Raq8ukIwN
	 xdfjcQv/r35NlHjEJ/pFQByZPW2CCs+Ve1fr7LgO4YsnSJn3INZYiqXBOAvDbjde6z
	 fzz/IiGxcOPiw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7276660A1B;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [RESEND] ARM: sharpsl_param: work around -Wstringop-overread
 warning
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180946.2242.16359198571616577949.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210927145332.2784005-1-arnd@kernel.org>
In-Reply-To: <20210927145332.2784005-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 27 Sep 2021 16:53:25 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns that accessing a pointer based on a numeric constant may
> be an offset into a NULL pointer, and would therefore has zero
> accessible bytes:
> 
> arch/arm/common/sharpsl_param.c: In function ‘sharpsl_save_param’:
> arch/arm/common/sharpsl_param.c:43:9: error: ‘memcpy’ reading 64 bytes from a region of size 0 [-Werror=stringop-overread]
>    43 |         memcpy(&sharpsl_param, param_start(PARAM_BASE), sizeof(struct sharpsl_param_info));
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [RESEND] ARM: sharpsl_param: work around -Wstringop-overread warning
    https://git.kernel.org/soc/soc/c/34186b48d29b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


