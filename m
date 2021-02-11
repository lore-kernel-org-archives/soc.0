Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A284C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:04:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 162CA64EF0; Thu, 11 Feb 2021 15:04:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D841B64EEE;
	Thu, 11 Feb 2021 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055868;
	bh=1d42BxUE/1dsT5m/gRPrkorZT4HaEgiBeyVaFobzOsA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxGM0fV48RHhFOhTkFUOGLeqpCmEV7wINIoEY+BFlvgjWqtGRDU0/RodkCAzi2Bm4
	 iFH6FFcN4UtWqBunHqcg6C4ndQ9lYLMsaYgJqCEyUE6UT2skOw6VeTeFug9zwsF5Js
	 YIRqj1hNbSAa/hVu8hiQlZivuvu+0Jb+1u0ThMPTro7rZ/qPIjrXfx0XatomIy/LlU
	 tLEEd+SUIkkb7hsnLlW8v3EjolZW8M7C2eRib/JyKqzJkms3owcD4EDg8BlXINHwQt
	 qY4QZZBz++A3KM2i4fJAKTDD4EHsQK8ywf5nEv2x/Y2dGYHYkCXlfnaqdoO0996S0H
	 SrgKgxJzmkS2g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
Date: Thu, 11 Feb 2021 16:04:21 +0100
Message-Id: <161305573925.259289.17212813544897085950.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 12:33:01 +0100, Michal Simek wrote:
> please pull the following DT changes to your tree. The major part is
> adding one new board and qspi dt binding conversion.
> I have dropped one patch based on communication with Arnd.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 78155527283ddb04bb4a5b78320c861e1035d357

       Arnd
