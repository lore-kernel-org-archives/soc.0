Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BCC4167D
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4A5AC4314C; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEF5DC4314A;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=BTUbYEsB28qyLSZglvkpu1CJZfjJRMEvhYw6M7GyODI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UReSjwqfUt/r5yrA1zDbyWDo+vQ79zsGCdL5whq2fW4a/tEXVwPg+/nIaRTfc9HJz
	 0P2f2L3ZebTBnTrAqPxv5PyqWV7E+fMIs82Gl8e7+32sgyLXDy3NQrpo3S4+JQEgih
	 23mYs+RM8XVlnC43Ei8tXtbYT6CM+mp/PJNh935/hstfWqDWxnaCE/mSy5xV0xa/lV
	 kUaYw32UVWCE/CYPWK8fh735GAzDVBktr9ugCAif4Ne+dVbtWN5OrLnFR2TJ8qiKHe
	 sVe1L2vqR/wX/7lmEtEXIdPELuXjKedX8J79A5GEQXu2Lg5EYbBx8PVa1DliQaHW6b
	 VhZnEhnhJ0TRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2B37E50D9A;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 core changes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982066.12382.8983422672440454310.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <CACRpkdaPDbJKUzZHsS2POVUQEjYi+6bjU6cvbg4ox=SKPXG2ng@mail.gmail.com>
In-Reply-To: <CACRpkdaPDbJKUzZHsS2POVUQEjYi+6bjU6cvbg4ox=SKPXG2ng@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 8 Nov 2022 21:53:28 +0100 you wrote:
> Hi SoC folks,
> 
> here are a few Ux500 core patches for v6.2. Please pull
> them in as appropriate. Details in the signed tag.
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 core changes for v6.2
    https://git.kernel.org/soc/soc/c/6cb1253c6d9c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


