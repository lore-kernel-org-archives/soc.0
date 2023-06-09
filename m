Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D54AC87FE2
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10138C43445; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECA3AC4339C;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316228;
	bh=ndLykSvES1YVWODEswOUzO0hPa3ekEYa3gmNMdTHBN0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DiZ1hbyJ0pwgOisXyb98gQVF2VpxadLmKnj9lnJJoppftw8jYqQr5YDiVpf703Y46
	 86X1FNPJ3S/OBOb2TK5jZVY2eKMnWqOPNPVCPO6sMg8KveILg0DHvOnu/2mOeZNoSW
	 L4H8QhAFsLj7S8BsjUTEUM+EqiApoXH1a+Y0B8WO4a+bnLwpc8C1XXVxl+8VmvvHOE
	 YFk78JTSrE/e9lbx+emndnqDTRO3hiGIj8PjJZYCOcNpBDe4A/GtlmMkyc4fUgERmw
	 QflK9bsmUxCvwQTYZkn0Rxfn0xbKPF1+qz1b2ypBNk4nzhaiGWxtT1gdgkkZHTFr5o
	 k9LO+jle+yoLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA295E1CF31;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622782.816.3758311995729210424.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <6482C916.1010507@hisilicon.com>
In-Reply-To: <6482C916.1010507@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 Jun 2023 14:39:18 +0800 you wrote:
> Hi,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.5
    https://git.kernel.org/soc/soc/c/a813efafd5f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


