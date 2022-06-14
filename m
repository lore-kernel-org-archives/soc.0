Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E822CCA47E
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55CF1C341CB; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33A2EC3411E;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=L9/8DwO5WV2JAYYtvMxWrsucABo+Nt0pb+kdClsNBfc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AEC6j+2j8EluFDgC+sBPnPYPdyiiHRiPUyHbxetL+heLx/RF9itTyxY0frIFEgEo1
	 CTkqPaHXXGD3dklSDgqKxpSbZvNTKTyJj79mVBaWVT3K2rVYBapK73hzj7Gj0E3/eh
	 qkrR/kJCaU0kE1x6H2TgMhfT21xbAKYIKraNM8zClIjFvl9VMwkEClzKu3YTufrJ24
	 dRSr7SU50OH67+MR6T6vdk+DZAVrqaYMOmtjZ9lu5NcbOts3lLxhW1B3SUTH/ugbJc
	 KvnYhgikWoNTHt1EjYEWDucldTC12OULZJbCamkdp4BCVZ8lFNP3oa/ivqf3lN7NQ9
	 lq56L0glfOlmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10C95E7385E;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: stm32: move SCMI related nodes in a dedicated file
 for stm32mp15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881506.29335.2856954238016226604.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220613071920.5463-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20220613071920.5463-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Jun 2022 09:19:20 +0200 you wrote:
> Adding a "secure" version of STM32 boards (DK1/DK2/ED1/EV1), SCMI (clock/
> reset) protocol and OP-TEE node have been added in SoC dtsi file
> (stm32mp151.dtsi). They have been added with a status disabled in order to
> keep our legacy unchanged. It is actually not enough to keep our legacy
> unchanged.
> 
> First, just a reminder about our use case: TF-A (BL2) loads and starts
> OP-TEE, then loads and runs U-Boot. U-Boot code checks if an OP-TEE is
> running, if yes it searches in Kernel device tree if an OP-TEE node is
> present:
> 
> [...]

Here is the summary with links:
  - ARM: dts: stm32: move SCMI related nodes in a dedicated file for stm32mp15
    https://git.kernel.org/soc/soc/c/89931cb463d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


