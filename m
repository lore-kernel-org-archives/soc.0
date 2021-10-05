Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E292CC4321E
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6644961507; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 44F9C61501;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=I2cuXTORuobaP6nDL9dvv3YugpufxcthDn2NuFC+yjo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V99TFBFEpLnkpnZN3X2xWVzbnc3MARQ8LtxOphB+LWlF9Hr7pdowrIJpP1rFjtDS2
	 CLi5/IqfqHolyIzPjVWz2saBkTq5g03hmW29TqB9G/IWKNNNE02vq+T8L/v/rk2BVZ
	 rlZbFVSUpxFOiNrEc+nNgvfEdOnSZ8QxlATi1M06zDzPQQtrokVfchbO5A2PiJsmtG
	 ylFUZkhv7IIWFfaHxvJAd5hVkpfxDBXqUVVDfUkAf5K4xspvET9wl7Sh8yYMOasxP3
	 w2cOXJFbpv3H1tnssXDxBmSIYIo8+hCv7hOyZ5kd0BHyNoiKXTocFB9IyPPwvIjSST
	 TSVJIuv6CRIoQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2EA0360A6C;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483218.23473.11446991832726550374.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 14:40:32 +0000
References: <b1cbd05d-ab40-e1fc-4001-6cf88e1e81f9@monstr.eu>
In-Reply-To: <b1cbd05d-ab40-e1fc-4001-6cf88e1e81f9@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 15 Sep 2021 10:09:15 +0200 you wrote:
> Hi,
> 
> based on discussion at
> https://lore.kernel.org/r/CAK8P3a0ZWxsUrGA2J8d=M-G=0Bbw16XfxuL=Uu=cXvPpMyQkgQ@mail.gmail.com
> I am sending new pull request for adding DT changes which didn't go to
> v5.15. There is likely be another pull request later for v5.16 kernel.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.16
    https://git.kernel.org/soc/soc/c/db55451509cb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


