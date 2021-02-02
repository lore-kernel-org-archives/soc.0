Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0984AC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:37:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D062C64F68; Tue,  2 Feb 2021 21:37:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5035264F6A;
	Tue,  2 Feb 2021 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301820;
	bh=09b2U8l6Dtctv7PhUR1xjpAHcPX/oMiMbNS8HK2Xb9I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZRpwvtdBYi0C/xebF40kdGXTXIvv8PzHDdlcA0b67ZpEfos2casF4phEgucSIhrWk
	 U9buaOXhZgPBAPNiUGhSMt//8bU0Yw4mPtqfmcJfpfKITTm6/tOcdLud9idsoBM943
	 W9AE5XZdogSWiFyq/ZXqG9/6gtn27y8OqZGAReX7SEUtPipZGC+khMIzNDe67NpmvH
	 kWurpU422Eo+G9zBtC20118LZho+o0im6hfMffE7739/yy9Q86IfgO3EfsyvVpQQbh
	 irD3dyP0MRY9h8HMP7qK8hd/L7mfg9mtlK1xKm8zUYDC7vagWX+FPXdVNAdI9qW3HL
	 PnHZ0DSIbMTUA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [GIT PULL] Allwinner Drivers Changes for 5.12
Date: Tue,  2 Feb 2021 22:36:50 +0100
Message-Id: <161230178517.1902917.510621231358952073.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <91f2980f-266f-41f2-ba10-5a395625498c.lettre@localhost>
References: <91f2980f-266f-41f2-ba10-5a395625498c.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 18:58:57 +0100, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4fe05d21a9b1e5c5a8ad7380afd7edeae078e00f

       Arnd
