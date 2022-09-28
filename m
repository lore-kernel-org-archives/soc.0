Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32AC6FA86
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68BE9C43144; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F6AC433B5;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=UkIr1SmfoxjGU5MFISDBiDfrIXqkdakD3qRddS2QRLE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LT6M7W7FztLMBe5DImfoUt3nkABo0WU88nz/J+e2th6ArciRXFBpdOUxubRUTfadH
	 nxxGQNnJu1nhp4VptJS0dGQ2hjQHFjeB7150wmWNT2uKwyw0K3pvRe6+lKd9YBlRHK
	 e6ffeQDPD/1hLqC+5XC/9Gnfc0JaSfbRrtIfSyU0zZlFtUvcwHUHNFj+EQF4q7CJMu
	 FkiPW2wLepc9CZ0cU4uu7eAGLtjDEbRKMXR3X8GdrSkqvkCyFZ5P4gB92IGAOu2LH8
	 Cp1GDWXjl4mcdLUQjzhqE/j4G/oGx2QfphfRWV8VRHETmubAPIzyGxXzNY3H9gRl6+
	 v57bAUKx29tsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30476E4D01B;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/10] Update UniPhier armv8 devicetree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882919.18494.7935821745732984988.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20220913042321.4817-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Sep 2022 13:23:11 +0900 you wrote:
> Update devicetree sources for UniPhier armv8 SoCs to remove dtschema
> warnings, add support existing features that haven't yet been
> described, and replace constants with macros.
> 
> Changes since v2:
> - Rename the nodes for usb external controller to "usb-controller"
> - Fix the node names for sata
> 
> [...]

Here is the summary with links:
  - [v3,01/10] arm64: dts: uniphier: Rename pvtctl node to thermal-sensor
    https://git.kernel.org/soc/soc/c/2dfb62d6ce80
  - [v3,02/10] arm64: dts: uniphier: Rename usb-phy node for USB2 to usb-controller
    https://git.kernel.org/soc/soc/c/8fa3e658579a
  - [v3,03/10] arm64: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
    https://git.kernel.org/soc/soc/c/4cc752a88ca9
  - [v3,04/10] arm64: dts: uniphier: Rename gpio-hog nodes
    https://git.kernel.org/soc/soc/c/173b9b8e5f83
  - [v3,05/10] arm64: dts: uniphier: Use GIC interrupt definitions
    https://git.kernel.org/soc/soc/c/5ba95e8ec2dd
  - [v3,06/10] arm64: dts: uniphier: Add ahci controller nodes for PXs3
    https://git.kernel.org/soc/soc/c/23e001e75db7
  - [v3,07/10] arm64: dts: uniphier: Add USB-device support for PXs3 reference board
    https://git.kernel.org/soc/soc/c/19fee1a1096d
  - [v3,08/10] arm64: dts: uniphier: Fix opp-table node name for LD20
    https://git.kernel.org/soc/soc/c/4ff64e7089d1
  - [v3,09/10] arm64: dts: uniphier: Remove compatible "snps,dw-pcie" from pcie node
    https://git.kernel.org/soc/soc/c/d93ecbf56946
  - [v3,10/10] arm64: dts: uniphier: Add L2 cache node
    https://git.kernel.org/soc/soc/c/5381a96cd9c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


