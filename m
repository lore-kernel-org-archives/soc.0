Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDA5C47DB3
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B66CCC116C8; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F502C4AF5E;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=bAwj/PdQFpL6n1CxY2g+8eho4zSytBEJ+LIjJN00bgk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aEZbrt7KtxsKJHJGiOn71PufoyKNEkKbzwrc6RKaxljJtMdZ81Imt3R4fmhE72hsR
	 tv1pg3lKnbCZgfd3PnO8/AsfV9wmVgKxyb6LKKPA9qi/pL3YIZvGNERtctoAcF1IDz
	 s7cbtlA7tcGr7K+cwa4yMw0Dm21KxLyrc1UvTwI0Dc/PZHOgxJoSLO7NeSgZs9O47w
	 LWv3QCZBFvU3cFoovd4DA7jcaFVLsTK355yzvdjG3MCjGavCOLz4kPODmmcUHE8ud3
	 fXjElY3sqBjZNVgjQg/hAw1moBafyvjLUooSdhnyfbxrZ+ivqSCsC/+gW82jHdamiy
	 ASoqJCnNQsj5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D8D2DD4EF2;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/6] PolarFire SoC Auto Update Support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046657.3302.14375109903144784345.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231020-agreeably-filing-3d48708e6262@spud>
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Conor Dooley <conor.dooley@microchip.com>:

On Fri, 20 Oct 2023 14:18:38 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> This patchset adds support for the "Auto Update" feature on PolarFire
> SoC that allows for writing an FPGA bistream to the SPI flash connected
> to the system controller.
> On powercycle (or reboot depending on how the firmware implements the
> openSBI SRST extension) "Auto Update" will take place, and program the
> FPGA with the contents of the SPI flash - provided that that image is
> valid and an actual upgrade from that already programmed.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: soc: microchip: add a property for system controller flash
    (no matching commit)
  - [v3,2/6] soc: microchip: mpfs: enable access to the system controller's flash
    (no matching commit)
  - [v3,3/6] soc: microchip: mpfs: print service status in warning message
    (no matching commit)
  - [v3,4/6] soc: microchip: mpfs: add auto-update subdev to system controller
    (no matching commit)
  - [v3,5/6] firmware: microchip: add PolarFire SoC Auto Update support
    (no matching commit)
  - [v3,6/6] riscv: dts: microchip: add the mpfs' system controller qspi & associated flash
    https://git.kernel.org/soc/soc/c/0678df827182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


