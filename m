Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80039C433ED
	for <soc@archiver.kernel.org>; Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3D26E60FD9; Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2755360FDC
	for <soc@kernel.org>; Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619127009;
	bh=XL9fNHaWZyqEXJm5aVoH3cAiu27xGkmOqIQkTE5bsco=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XHB9mDLEv5VkE8JIM+lMCKh7pVp0dxodObUgfTgOfRihzjMpcM+xLFmiSsgCURg8G
	 16MtNfs4hZv592iJlvti1M826gvHe3geax7w4xiGX6M1WJ8ooQ6AC+qygDL1MjEHo/
	 w5uyJVSbTDFkGt32DDrbU3ifqN2VKqxPs1c+ioLj+OQ9ZBqZ5yOYCvbs81iJtUKs46
	 Iptx2NRucpgT4945oVXhN51ujxOCKaeHqbXJK8uHMEfJv3IZvw2tIQrjx92NWp1r77
	 Hy7w9isEnNYs6vrO/ZbeK3Jifg6qktGFyKeoBnffBcTP4GOUDJmMug7EvJMgRAwI8R
	 anWwN81AqrzKg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1B9D2609AC;
	Thu, 22 Apr 2021 21:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161912700904.19496.1097878932149158730.git-patchwork-summary@kernel.org>
Date: Thu, 22 Apr 2021 21:30:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [1/2] arm64: dts: amlogic: misc DT schema fixups
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=471169
  Lore link: https://lore.kernel.org/r/20210421204833.18523-1-khilman@baylibre.com
    Patches: [1/2] arm64: dts: amlogic: misc DT schema fixups
             [2/2] dt-bindings: mali-bifrost: add dma-coherent

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


