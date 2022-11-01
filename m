Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FEAFA3746
	for <soc@archiver.kernel.org>; Tue,  1 Nov 2022 11:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDC35C43144; Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C60CDC4347C;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302217;
	bh=0KKx1hyO4jS4PdrIm0qAnb+7l1MqDlhxgkCDBp95dv8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SNPS5hN+Brp4tJS2TduT983rvD1fi99uYwFRx/rOVerkV9JM/Xgujl0zsx7LqTKva
	 XXkYY0TPTZVOd18HXjv9mWdToZwqnHI5+/C3yFQh5Urjl1M735+5cdoex/TzwHVeGP
	 elDC+1QJ6QXK8llT70CA2Hklks/K+BlQQX5AeHO7H4J05Np+DNzs3xihKciBjRPsEk
	 gxHaZqW5pN+KJJ/cHMzJmldGQ8MZCBPCtvIUDnS9RA3dTAzaTY1PAmJ0uRucXSBrw3
	 uMmVN7QfUiwIHZGr0WkNmPuCuGYcOGFNx1GOK0XbS07IHZIimnifSdl8SZYSiS5Xu8
	 ll6SFeCTW9lVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADF0DE52504;
	Tue,  1 Nov 2022 11:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ux500: Add trips to battery thermal zones
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166730221770.4100.3112976412700227752.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 11:30:17 +0000
References: <20221030210854.346662-1-linus.walleij@linaro.org>
In-Reply-To: <20221030210854.346662-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 30 Oct 2022 22:08:54 +0100 you wrote:
> Recent changes to the thermal framework has made the trip
> points (trips) for thermal zones compulsory, which made
> the Ux500 DTS files break validation and also stopped
> probing because of similar changes to the code.
> 
> Fix this by adding an "outer bounding box": battery thermal
> zones should not get warmer than 70 degress, then we will
> shut down.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ux500: Add trips to battery thermal zones
    https://git.kernel.org/soc/soc/c/cd73adcdbad3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


