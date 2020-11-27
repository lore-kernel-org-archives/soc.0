Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCAAC64E7C
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6631C2224A; Fri, 27 Nov 2020 17:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497028;
	bh=bF3SHMaGukx/3am6D2CJZzBTqIHqlXSZDwgdKfPNcvk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=S3laNE82+Zn1nODby9/EWwIDbjyCIZCHA07T22Tww3cv9iiWXuQcyI3eQwfmaLymu
	 ZwjRBGLegJYBmXDDgRDujNF2konT9QvxuueBr2a5FziAutqgZlvk8cpE1teEnps3pN
	 N1I47Y9inUagDRjw9W3swq6se/R/pFQxGOapMNUI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE driver for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702828.7685.6858114051915132759.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 17:10:28 +0000
References: <20201125120134.GA1642471@jade>
In-Reply-To: <20201125120134.GA1642471@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 25 Nov 2020 13:01:34 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which allows the OP-TEE driver to work with
> ARMv7 based single CPU systems.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE driver for v5.11
    https://git.kernel.org/soc/soc/c/ae597565d13f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


