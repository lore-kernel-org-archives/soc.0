Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC0CC3DA41
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DED6C43397; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E58CC433C9;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=ZMiaQP8wInsxvsmCxXN7WbXXQN8UjH58ocfVUx0gN/s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=svCliG6ipVKLztdnKlrT1RK/aS8s20WVHGQakZVw+sMCbM8Xndpur9fFkm8JsNx81
	 CJJ2K/qV3ZIsuXGiCeYUMp28j+8aqhsublvtjoGQAjEIzJR96m1PDq/SzFRzw4Ac6G
	 0fTZ+E+b1T6dwGXEDNY0484EukoFMOPjIAyOYKUMm0Gbhkugp95mdxfXlRu2aDpPGF
	 lghVgB4b2PnVNOPAxHIgzsH4n6ewCL/YgoAybj/kJfBrjYfS0B6NDe3p21UhC9Uvd8
	 Viy3r9h6H0p3CJmqKreGXTw6b4ycW5Zuwlv3p5ZQ8rBiiKwzaZi5hmy55ivzJtmWIM
	 1+JIKjGMsOmrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F448C64459;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] dt-bindings: Changes for v6.5-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972418.10612.4856154064539504351.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230620162615.2043450-1-thierry.reding@gmail.com>
In-Reply-To: <20230620162615.2043450-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 Jun 2023 18:26:15 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] dt-bindings: Changes for v6.5-rc1
    https://git.kernel.org/soc/soc/c/79e47607205a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


