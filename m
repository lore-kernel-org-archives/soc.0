Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA0FC433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91FCCC36AE1; Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 797B1C36AE7;
	Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639754430;
	bh=mJ/9RNA3dfJOHD9kFCtk70c9Iq1Resq0K0AIh8G0Dmk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Kzz+Q2kpJ11GmLBMXXcqeLzrXIhr7y2R/fHueM3fw8TdRPmmx3dtMufko+YB3eOZR
	 FSVIPTeaTkPsW+Km6iKe4N+BYGp3rDuJrpJAGUzmA1ml5W90cU2eYZoMf/+7HX6fv9
	 s+zSbgYea6aPk/1fKuKhtGO9r+YJWd75tuVecN1ofLj26zM2G4qGRnEO6pXtGNOuZc
	 2W0jzva5HlfOiEsznttVAv0nsRZ3VeQEJHXSJ5UKPHPmkynm/XVJeE0fSPCYI5igBm
	 6l396usqL0mqAuiJgAGSYuOdIxDYILRyz93LAzXmk7AbE4SJbqnhaRY3lF8WtJzoKX
	 cJSi0qV/uDMGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6124860A3C;
	Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE and OP-TEE fixes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163975443039.14717.6371065035353968268.git-patchwork-notify@kernel.org>
Date: Fri, 17 Dec 2021 15:20:30 +0000
References: <20211216150745.GA3347954@jade>
In-Reply-To: <20211216150745.GA3347954@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Dec 2021 16:07:45 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these TEE subsystem and OP-TEE driver fixes which by coincident
> all are concerning memory shared with secure world.
> 
> There's one in particular nasty race fixed when a tee_shm is about to be
> teared down.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE and OP-TEE fixes for v5.16
    https://git.kernel.org/soc/soc/c/a6a476878ea9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


