Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5E5CCA47E
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 265BBC3411C; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0522BC341CB;
	Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656086414;
	bh=jCNrgppmXECkVvYIl02wrHcwlm9X0xmEpBtjKaQ/qJY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Z/WC8vIpWZN7+/JXMIREFJmq5WryMOuXPMiIsrxkmKpyQpIhNwfAGx1btOBOom93k
	 fRqGBWRVpniAxuRiu2RMmxRmBFiq9Os73ls+p5kkyx7RdnDnvZNV1zovWxPqcqkfkq
	 frVOVLFPFTIPftDUG0w9MiIuylpyQvfqobsj/P6Ogi71bmV+JW9osMAZoDiweJ+PiG
	 Dfh4x/rR/oUsRXCXzjT6U1BGgtLUU2jugGyRNBLtNDurdECzJDIJsbgyJnYFbrBXxf
	 jf6GgtKliTmxHtW6RlRdY9wKO1ZNT6OJVsmzJ011a9MV3l5+YDJg5R+/qcdijth6yO
	 CU+/p76ZfXzbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E18DFE8DBEE;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165608641392.3411.5656740492744517789.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jun 2022 16:00:13 +0000
References: <20220624070511.4070659-1-joel@jms.id.au>
In-Reply-To: <20220624070511.4070659-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jun 2022 16:35:11 +0930 you wrote:
> From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> 
> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
> name in the file.
> 
> [...]

Here is the summary with links:
  - ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
    https://git.kernel.org/soc/soc/c/7f058112873e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


