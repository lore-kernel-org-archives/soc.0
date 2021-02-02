Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03ECC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 16:47:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACB7264F8F; Tue,  2 Feb 2021 16:47:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A4AD64F7B;
	Tue,  2 Feb 2021 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612284478;
	bh=B/qWAWOL4ROfuweEOczWCM/+e9Zh0rKL1qeiZEZDdDA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bScgUhlXY0TV5YaIXj0BrLr9WhZsJY2mD4vqeblUUdj/kMAP93783109qT6llqt+h
	 k157UcYmQdh5o2CIt6Xa6MubJ5gwUpT8mXEpAHeMKGr5jsLps6cb0LLhYebbo2X/O0
	 k7NbIvqK3n5EtZ3gDwNw3tm5OOm+fiwAzvZ6SpurMCd0PDIqPtOGGMecZRhSFksofA
	 1J7TcYD4o/GxaDNbwSCiWprXtwvRIu9jzYXpGyn/I60xU8Qma/l+17iLUUf5wNlGXW
	 vKZAaZklt9OQ9AuqKlpzFJ0MjvVgHQ2hiGUEEJlumixFJz5TLWr+QxBg/jn14dM38Q
	 zKVVPNOFN8cRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.11
Date: Tue,  2 Feb 2021 17:47:50 +0100
Message-Id: <161228438423.1848830.360600745300776744.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
References: <50368e09-c84f-4015-a6f8-70e75e12720d.lettre@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 18:49:56 +0100, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: fe43a00f88c98de1cf1dea644a37b88a2df2243a

       Arnd
