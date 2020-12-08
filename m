Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E032C4167B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C081023B05; Tue,  8 Dec 2020 17:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447422;
	bh=0L6pBi5Wf/UZoxZExKTpQCBDEWdj1HhkLqLH+5tW8T0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o7xvLRnZMoZjMzE+NekivnlL/9Qvc8gYW4GroVd5rKJ7gx+0Om/4WgngjuXEJredZ
	 BtbJz0VxNgv70UJ9U04225bTRPMbry5jHgdR7fHRzAHCzjY0Z/EFIWHNM68RGPwKxG
	 /ecHA9QwDStErpwI6avCvw/W3CfqAWMcHNbDfeso4AMOv7aCLE+cCgs3yE2pjBOGwf
	 8oP6A39C+PfUqhURi2oOWQm+5oSndUcKQI9NdaNiVqFDEDE5SCaGDjzm/nCLJYsAkR
	 lIg6Xda5syjHZwRbi4ZYEFEE1DJ/CKLz+VoelZaEBxCtOYp4Bm62l23MHXoF9l14pk
	 JDSJ4DkLU8kgA==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744742265.1206.3751396139503019127.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:22 +0000
References: <20201203231847.1484900-1-arnd@kernel.org>
In-Reply-To: <20201203231847.1484900-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri,  4 Dec 2020 00:18:40 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These definitions are evidently left over from the days when
> sparsemem settings were platform specific. This was no longer
> the case when the platform got merged.
> 
> There was no warning in the past, but now the asm/sparsemem.h
> header ends up being included indirectly, causing this warning:
> 
> [...]

Here is the summary with links:
  - ARM: keystone: remove SECTION_SIZE_BITS/MAX_PHYSMEM_BITS
    https://git.kernel.org/soc/soc/c/9280f726097b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


