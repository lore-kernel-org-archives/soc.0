Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B7C433E6
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0D62239D1; Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 998A02399C
	for <soc@kernel.org>; Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610119808;
	bh=Us8130VvWqkW5W8NJUo6DwLnJuUTfUZszJG5Wc6zc5c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ulpkW2zDCZKowErw26aAzSyLcRQSSLJjOcft2r3Yw1zbcbzsr/nA94xBD+VCres4M
	 /UVhKBjeNGOAXeCOi/sk0sONtQWNhhnFu/kZGup9CXOsGV0wxns/FXPXIIxJxfL/KS
	 TQpYMm8tOPvT3BlK+pvXBbtHWMRI4MkzvYWuxysfQtoZljhybrdS1Jp74BRO+1xVgt
	 DUBzpXnulZxI+NqA16TDg/yFMC08BMteCVRKrciSdXz97kVACO01rATjzFtuoV/1Ek
	 hb28zEAebHxiuoK4T9IDcUayEVLFhQFcW8qSpMQFIzwnyRMbe3LeWmxqJgsP9eQ80S
	 zjWNGnJ2y6//A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 81DC560597;
	Fri,  8 Jan 2021 15:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161011980846.25062.14465215257624582384.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jan 2021 15:30:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: ARM: picoxcell: fix missing interrupt-parent properties
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=407583
  Lore link: https://lore.kernel.org/r/20201230152010.3914962-1-arnd@kernel.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


