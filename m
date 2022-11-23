Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F41BC3A59F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75CCFC433C1; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F170C4347C;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669206016;
	bh=mt//D37703QbzpoSWBTl04q1w4WH+VgzGiEALCx4UIo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i5Ba6anvdCJ79l6L1BPFZSe9CJUjgpLTn4TLjRPvZeVtpiTWl2nwRp/f7xB57Bvsn
	 C3WxSfX5shYZ3e+wFtBtNuNK/VaaQGTjTOKJJv/rgnqCm6kUylFxgvekegi/ad/8Kv
	 niN9JnP2UFEbQU+wHF3ioaKnsOoghoo5XmlDnWo+EQMs12T2sH59BYhYP0X+sv2BFI
	 B27beQD7hKpD9sE03hKEZn0pij+K42TZU0b6LbDg73xYzlho0bJfQ5m+EltHIWp0S/
	 heAsPy6Y0Ln/h1dA5eXpXK5sphBRboxICwT/VagZebGhDVhRo967GAJxQ0ueahwIHW
	 j+2XqpHav2jOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3175FE21EF9;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920601619.19495.17276298201063635165.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:20:16 +0000
References: <8faa1d3c-5a17-2c3f-92d1-f8fe3df74131@linaro.org>
In-Reply-To: <8faa1d3c-5a17-2c3f-92d1-f8fe3df74131@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 16:28:46 +0100 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.2, with 1 new board:
> - Support for SPI clk pullups on pre-G12A
> - Active cooling on Odroid N2/N2+
> - DDR PMU on G12A, G12B & SM1
> - Update cache properties in Amlogic DTs
> - remove clock-frequency from rtc in Amlogic DTs
> - Initial support of the new Portable Game Console from Hardkernel: Odroid Go Ultra
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.2
    https://git.kernel.org/soc/soc/c/2d5e7e2a3db5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


