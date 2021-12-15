Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937BDC43217
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C22CC3460C; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42465C34609;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639581010;
	bh=IuZyAE2OUQ8QA15yYIgqVmfIF3NY4y5Q/YQWwwvwTg8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GSzq5cbpx6fh2zIXcklksBw2yBRFrFZHv9mI3XMl8q86ha2hl79lQmzXjTf9BojUA
	 8cnx6G499tz/2x9tBMmU/UwWDDe9xUk4pBrs+TKA9fTRzF2vvox3eWCP72veIPG2tI
	 3QmCyViWM/8xptUBafB+JNsj77/ucb1h0qGx95yaE+tt8EB60UxBV8b41Z0nhim//k
	 uqmD3OgcpxwuDViRxXLeYzIfKmcThhCrtRdYX8tYFWAowLqc5suHQA1DSXGwCDtGbv
	 Zj/uY1JPj9lOpFJSx78yJEJd51z+BaqAgcaa8xvaC95ewZfrbwzv5l0ZZ+0dkrSKMa
	 NO6db6VOKTm9A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2CD1260A4F;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.17 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163958101017.23013.4193518714021856645.git-patchwork-notify@kernel.org>
Date: Wed, 15 Dec 2021 15:10:10 +0000
References: <dfe942db-5af7-bb82-22b6-3bd866c9017d@foss.st.com>
In-Reply-To: <dfe942db-5af7-bb82-22b6-3bd866c9017d@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Dec 2021 11:56:29 +0100 you wrote:
> Dear ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.17.
> 
> Regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.17 #1
    https://git.kernel.org/soc/soc/c/03e9474bfc4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


