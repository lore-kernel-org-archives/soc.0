Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E6C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30291C4339C; Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19864C4339B;
	Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316223;
	bh=KaB2BkLMnTOqS60Fme+gLYM1oMgphmfkz1Xus1COVuI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tglBc1WM5iAKmPYjngv96vL/S8LbYDv2dVz1oCCw29nQrCsDYrHUla/u/fCa2N3w5
	 xwp+VTyXnsH36Emogx4KsCjrQy0Y0C8Wur9DaDCVQKLG4Qho18GmW/l2xdauRh89ci
	 iEJOtUn+PxnWXHP7/nYCsvpRDzkNwG3DWRTTa4Ks8RVHOD3iORbKvNBVM5WxcvAAUj
	 iG4r45cNR/+MMBkW2YGKFnUSM2lHJYTfn/eWv0KxNRltyLK7RsjkaXOeKlf8PemEtn
	 YER7Rya2dZUfQT/oab+w78aiDwaUlqzoUV+w/CdizqetBiTPMUBnvMEdbsGchMOz2G
	 1bD620T3nXcbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7411C43143;
	Fri,  9 Jun 2023 13:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE fix for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622293.816.9995460255020380114.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:22 +0000
References: <20230606075843.GA2792442@rayden>
In-Reply-To: <20230606075843.GA2792442@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Jun 2023 09:58:43 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this AMDTEE driver fix to add a return origin field to the
> struct tee_cmd_load_ta used when loading a Trusted Application into the
> AMDTEE. This change is backward compatible.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE fix for v6.5
    https://git.kernel.org/soc/soc/c/abd649fdf91a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


