Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA3DC433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79ACEC36AE7; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 637FBC36AE9;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010612;
	bh=wsT1aVrUihrTRdPfWWTdLn69bQhTmAKmLmM16aOEsLQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dd8ihI5lbEan779h3bdg35iPJkYcGUCNSUWjnw2pF8ki7Wfj3RvDok6QN0CACAhTL
	 +YohqTWim60sE4RjNiMAbb355pnjeBKhx674lXSFz1+Hl3p4spOIRPL14mC/zyBsSd
	 WxeoORNgxWpnAXFqNsrh78KsaqfbxS1cdfEylTlqzH91yCy3sqKrBGwq09yj/TZd/I
	 NOKc3jyhlAxnyP9d5TKijj4fr8XnmFKGkzu0UWj177eINbzvbBoKyKmZ7MSFwKP6UP
	 Uz1GPguovdfmGgAXJEoQ4X2XB1Y5kXc43F2DlcwnUMLBaJ5AuPNfSTlMhsxQIBnmMO
	 5I4nAZmMmRosw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 54CB3609B3;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061234.9073.8565390358125466140.git-patchwork-notify@kernel.org>
Date: Mon, 20 Dec 2021 14:30:12 +0000
References: <20211217164134.28566-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211217164134.28566-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 17:41:34 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is one soc change for 5.17.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.17
    https://git.kernel.org/soc/soc/c/a904c5f099e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


