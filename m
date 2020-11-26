Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70441C6379D
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:17:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25043221F9; Thu, 26 Nov 2020 21:17:20 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 07E3B221F8;
	Thu, 26 Nov 2020 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425440;
	bh=8RibYTxN9NKIZJFzmsGiuRGKtEvzbiANmrNvuXigIOY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dXvTXr6jXabq27uBTcfQkf0Pw1haUSPr2E4RPUU7s+LThajhdwHX7FVigdSVPgs2q
	 +rDqzdF4EJ2qq48NOSz5SnE/8yeHiSWWMcETPKg+1yKZGNha9SmGuFAIC/+++QOzu6
	 2vNoBqhIeU9Ia5iL1W6dzdsi5wQ2Qt7wapAEKDog=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Michal Simek <monstr@monstr.eu>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] arm64: soc: zynqmp: Xilinx SoC fixes for v5.10-rc6
Date: Thu, 26 Nov 2020 22:17:12 +0100
Message-Id: <160642540697.1426580.7594704023420469334.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu>
References: <fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 24 Nov 2020 15:22:37 +0100, Michal Simek wrote:
> please pull these two fixes to the soc fixes branch. It would be great
> if we can get it to v5.10.
> The branch is based on v5.10-rc4 because Arnd's first patch was applied
> to rc4 by Greg which is causing panic on Xilinx Versal SoC.
> The second patch is fixing issue with SD reset by using proper ID.
> 
> Thanks,
> Michal
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: dbae2736fd9f131111d3e826396b45c36d1de211

       Arnd
