Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A63C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4112B64F8A; Tue,  2 Feb 2021 17:10:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 944C564E08;
	Tue,  2 Feb 2021 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285837;
	bh=KAm1Ms8yUl6F24bCv2lLApmEGS7zZXGPeynlLD4XllQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T/lHb3JyxSOMtZsxTfd8Zgt5Qzn1+WjPYSv8pOxSA6ykVje1/h3pLvGVOoKRrb+pS
	 MklQNGtq4iSy1T7qj1SMKOCrvLUuP2atwvX4WifGeB5zTQpOsm9waIE1TDZWgRyJfM
	 M1Nb6PY79hSVZGh0wb3ZlH5ukEZm8bgk60sEb7oL8qfzaJP2BTCXaumkJlg0hwzf7X
	 xTdlaPhPa/n9bt8ihJ3DeQ5RjCnTjL/PJ3dn6Rb8jU1wgLpAi8EjVq9esjPul8PGnU
	 WtYdHP9dT3R5Ju1j42WNk2wdaFqtruWMUvdwIpRXOL8PNQyxTdx8Eq+sX/cyTiUIAH
	 6Oa6neBcplO7A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.12
Date: Tue,  2 Feb 2021 18:10:13 +0100
Message-Id: <161228552203.1852435.15236332625313790243.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <48511540-fdd6-4fbe-8037-ec9fa8436147.lettre@localhost>
References: <48511540-fdd6-4fbe-8037-ec9fa8436147.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 19:50:39 +0100, Maxime Ripard wrote:
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

Merged into arm/dt, thanks!

merge commit: 29a6387c4ee7ef0b269c71c62c7b9770b91fa242

       Arnd
