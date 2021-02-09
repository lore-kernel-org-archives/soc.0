Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96229C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:13:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C25664E6F; Tue,  9 Feb 2021 23:13:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3757E64E66;
	Tue,  9 Feb 2021 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912402;
	bh=+FwThmQbIydIO66KLIJ43qFFT7FaCPoF54VIyr5Pt4M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiiuKhosKmZYc/vA2i+hRXtub8k9uxttUFtZTQSlG02znw8YK6yyczEiTCmYKt/FB
	 7ptUQdz2QBkVZQwvdvdCuU+Ztt06eqsBXT3OOyVvtsan+Q1xheXjU28o6YS0VMkFV7
	 OMTA5uvl4BjtziQCr7Qa9H8hvO662AOgDoedq9c3KvRABh28Jloe9F0BmxO55nul5Q
	 crQ+sAHq8Q2sIpHN6etXqD/M1/p8O4BTxjf4zzBeh2cfB13aF3FBuHqViCg/9ejikZ
	 V/yernwDlAk0GM9JL2AkVNUUNiZee5Ei9LhioyhMq7Hdtkm0c8zyfvMvXT4KSLzlxc
	 N1ANjJylYzRAg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm-soc <arm@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: arm64: soc: ZynqMP changes for v5.12
Date: Wed, 10 Feb 2021 00:13:17 +0100
Message-Id: <161291238389.977540.16961858748175182289.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
References: <2b0f6314-13ba-375a-9231-925b0a07be82@monstr.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 14:38:20 +0100, Michal Simek wrote:
> please pull this simple defconfig change to your repo. Maybe it
> shouldn't be labeled as soc change that's why please let me know if you
> need me to change it.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 21e4675d9305f6ccd20b95d943882d607c8ae288

       Arnd
