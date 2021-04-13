Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77954C43462
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20338613C0; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 06F2C613BD;
	Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306211;
	bh=QMEaS9IRCoO6ufVZdUdXW6eXPdeMddaGPyFnkPmgsLI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=S4LASV6THP+6koeWGLF40Y6i6dpdnSwTEMxF6kdntwNJ/zC4YfAagUTX2/nUbZCrF
	 W0/r/Q9skkLas2et+mU4cFVcHgE33myA8M3JcWCpNOFnkPbyJMbQtFZL/GCNtCZJoR
	 f2qzgUqGwEMBPf5Ov3WKYO+qjdNbHYBFX1t7YUM3cK0a53Pe/Kb5WbxcA0w/OgOdjk
	 i4VFg2uTX5poj5O2ExItGJKDDktu/NltcGOF12U9fjvBg4WXn0c82niMWrxmV3qy0M
	 5u/bMKkx35rurfYg0ysP1MhAw8iraGUDvdq1u/bi8cB+Lw/0tucG5mnek+WNp3NDWT
	 RGByDCvm8BFZQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F0B1C60BD8;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: ZynqMP changes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621098.20348.1292718761094004586.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
References: <a44f8e9f-cea7-57ef-c3bc-10f5f5e064fc@monstr.eu>
In-Reply-To: <a44f8e9f-cea7-57ef-c3bc-10f5f5e064fc@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 12 Apr 2021 10:29:51 +0200 you wrote:
> Hi,
> 
> please pull these two patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: ZynqMP changes for v5.13
    https://git.kernel.org/soc/soc/c/5418db1f6ee3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


