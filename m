Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30657C433E6
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E6CB364F50; Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CBD0C64DDB;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286411;
	bh=67mnGLMKUSq7kM2ewKGuVXVoQiaB1qJHBQuPB1qwrL0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VPPzDugNMzf7C03JECEBiaOvJ3OIm0ULFX0AmRZcphc6K/dLy27+FKb1E1Qlf4rgt
	 9Kge9QYwcVfjYOxUJ8QPrfK1Rl+nBomEdoDpUPW+L6ZLjlHo02jJim6gmCk0WNh8ak
	 8KL127sUoNChcotUXysLPGYi85/lwgsNuWiM8tG16YBHEa6jcK8YXxiJvGsVR6VIja
	 IYr/FQVXidihUPSiiVTFUPkKEzZA/ptil1G4Enw4P6JusJaTJOnKC2Yfq6AOJpH20D
	 amfbc49SH2gf7Vmx+kfJJu2hoj4zko95ILqxT7V8+2r9zH14tTCMdBTL8MiIGWaAnu
	 AzqT1eiuk6dxw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C2824609E1;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.12 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161228641179.5662.4621619593855272815.git-patchwork-notify@kernel.org>
Date: Tue, 02 Feb 2021 17:20:11 +0000
References: <87pn1jn48s.fsf@BL-laptop>
In-Reply-To: <87pn1jn48s.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 01 Feb 2021 17:26:43 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.12 (#1)
    https://git.kernel.org/soc/soc/c/481d73c663e1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


