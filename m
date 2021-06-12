Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7984C49ED6
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 26C8C61421; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AB506141E;
	Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514217;
	bh=zOJk4EAeJVbVpxOYmfmLhStmb/cpDsNzaYPE7plLD9Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fW9dCenQ1Ybqad3sTmcxvhkHKWM13vR5V20AaayBen0fy4hnmc+tpi7RemTdrUGn9
	 AePerIBbAtx1KbrRyqlGjYGCv9BXDxwgYqGB7fUFVdY5UnXDB+VGjMMnAT70Gbkzd/
	 /2iHg55c3AlHDOKHFO1OES3E+VhCCs0t91rrlvXX3GFMhMwakV4qCkGQMAHDrcefPV
	 8kzgJ7DpMptM9J12vjk7AjGOfHO0WiUwIs+Sg++CZEcNzUnU86pS1C1ULFw5/s+Yjx
	 tQjIjxVBRV7VgfaTMsBK7K6h0ts7kHkKUhIZ3WG7YsaL6vl8VnJpGLV7DITMxbKUXF
	 o2as1JCj/kkCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 02EC760CE4;
	Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421700.27448.13674370696273893888.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:17 +0000
References: <96cc77ec-139d-4685-8a66-a60964cf39fd.lettre@localhost>
In-Reply-To: <96cc77ec-139d-4685-8a66-a60964cf39fd.lettre@localhost>
To: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 16:56:28 +0200 you wrote:
> Hi,
> 
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Device Tree Changes for 5.14
    https://git.kernel.org/soc/soc/c/b0545d11a975

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


