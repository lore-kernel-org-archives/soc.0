Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5208BC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 19D5B64EBE; Tue,  9 Feb 2021 15:14:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC95F64E88;
	Tue,  9 Feb 2021 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883654;
	bh=Mi1fKadKADh96jHzU5Otx7r4eiDSSdbt7khqooX8Ods=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBosjsasnBwzP1TwYqvInVxB6dZTaLDvwptlQRUX7f+sdygjoKvGN132g2kBiVL9k
	 z34znZFAIWJdJjfYBt4KOYxIsY4zqLfCLPrb5JUlAcbZ2/zzz+WgsAJV/kh7SHt7vj
	 F4pidT0dItc66PDdFuuPbA8IY+yU2iTppiSIDcFtHYYqODlAJh+vvJb1VPFzxV4zJq
	 +XVA1vHpfkuGIegv6MsrJWVyoEEjxbnxzQ2UBXcQs1kH8psUw5xQpbODMCt3aW7DFO
	 pqRHjNUE0iEJXdTKgHsT943AB9ddsB7PmkhCt5ik3/YQMt3f8I8Tpqjv4Y/x5qak4A
	 SRWMVx2ILkyCw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 6/6] i.MX defconfig update for 5.12
Date: Tue,  9 Feb 2021 16:13:56 +0100
Message-Id: <161288360555.2910447.18228490031918800455.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-6-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org> <20210204120150.26186-6-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:50 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.12
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 39a944cd8b6463d64ca237ffb0b3b0c9f2057d21

       Arnd
