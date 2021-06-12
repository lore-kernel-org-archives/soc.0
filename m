Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4ECC48BE8
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32AD4613B8; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CD4061376;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=ZVCDuG6AqtqH5XAxPBNHSbcjkxKpfWIuk9+EKiVJ9hc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lbkvjREvuTEabWaC9tLBwNygUREdhwkQJ9eKddkp55DtMkemCw1XejMTS2dm3HItK
	 x71N+zvNPom2BEjVumL2mX9u1jWPt/JARS5niW4ojQv/sLBhBoMObL8sDfP6TmU/8v
	 gbatnW9vfDo+0P3wQPbuq2E4ssAfDl6akw8kf3VYN5/GQDLE6wlvutJNS9uwDiD/1j
	 s1zOL2RBc15R8GzH5XD3co1ZJ7Oe9qAD+Rh49Nu8TEEXlPoUcttNrpmth+XcYSpPF9
	 NjoWPefxSH7g9mT5zmWgQxqQSD0pqWvd9SIqANUWln7qsFapNqs33TJ/auJ4dpnOjX
	 UjHKi8556gRYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1777360CE0;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Platform Changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421609.27448.9576760013217858100.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <bf3431f6-2196-425c-9b43-0bf4de0b6d30.lettre@localhost>
In-Reply-To: <bf3431f6-2196-425c-9b43-0bf4de0b6d30.lettre@localhost>
To: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 16:55:53 +0200 you wrote:
> Hi,
> 
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Platform Changes for 5.14
    https://git.kernel.org/soc/soc/c/2f80e8b45cda

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


