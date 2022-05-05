Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C0EC4321E
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FA6DC385B8; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 135EDC385B7;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=oySdSor4uCqbOnNnrtlUCtQ8kyssIakKrOdNdlmeWCc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eWy4imoKc2xz8N7MPh5/8SWIFJ8uzQnVh9p9W3y/XdSozntH/2A6iN3v00UNE52d+
	 EkANMSBH3+A2DbpUV4IzXFSWFOU0/AsDZp8sm59to5owkGIG97Zhyx3xq/usisN1QR
	 LBB5ktxhpZAywGyb4u402mQslZQDfJTufQw7D5wqd+w5Ubf2PbxaVPCCk/+EBUbSzE
	 LF62S2lCN5t1paeTi/Mlaw5yjJDC/sPM67wMMqNhz7H2mvikHmj2WtQy490rGqZmlg
	 vfinQFqHZxk0QKGef8p5pkf8O0aQFMvJZLEO3WapcyPbc3Um4Uc0kJDHRuj2+ZFF2B
	 +QRTh+72U91+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0259F0390F;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE RPC arg for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910797.9627.3529367690706914529.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220504201759.GA180315@jade>
In-Reply-To: <20220504201759.GA180315@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 4 May 2022 22:17:59 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches which improves performance when communicating
> with OP-TEE in the secure world. A cache of argument structs is
> implemented to minimize the number of alloc/free and possibly also
> register/unregister of these buffers in the secure world. This boosts
> the performance in particular in a FF-A configuration. It should also
> save a bit of shared memory since each multiple a physical page now can
> hold multiple argument structs, instead of one page per struct as it was
> before.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE RPC arg for v5.19
    https://git.kernel.org/soc/soc/c/6c6012ab96fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


