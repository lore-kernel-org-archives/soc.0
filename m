Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBFCC433FE
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A06260F5B; Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 82E8760F21;
	Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633947663;
	bh=GWtvpcSWEz5GsZ2gwTwUW35xnic7x188/+3POIuMa5o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XxVJ1eTMA/d589RDe3xymQHW0jrbAEYEYlpHO0RziVrosF46hHAw3qN9KtKyyqwxO
	 h1yHY79evDoaD6Mme6klKkONK3hLmRIwxRxLIqTJ9TMDVILVXZxFX0Zxnw0IThHXhy
	 OIOvIcuF1mXE8f5YiyNg0YSjUb7uVhomjmGNGm/Qgh8Dgvk80+XJfuV7U6TwM6Mcoh
	 8NIgSHL7FzrudU1DO9ZI3GlRpzmB0tJru1fpYI8RZuF04rkK08i+vx2r1mS928hVMP
	 cGvZltlbUDZM2yyLjAPrfSuchOA7SOeEPPGTCdF4vEYX8ik8+mmOpt3rZlcdlMiXrL
	 zGmR+vFaBE9Uw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7D70D608FE;
	Mon, 11 Oct 2021 10:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163394766350.9012.7891468303879995274.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 10:21:03 +0000
References: <20211006153231.4061789-1-sudeep.holla@arm.com>
In-Reply-To: <20211006153231.4061789-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  6 Oct 2021 16:32:31 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v5.15
    https://git.kernel.org/soc/soc/c/209ee634bc0d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


