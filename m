Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1414C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:05:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8DE6F6101E; Thu, 12 Aug 2021 21:05:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F0D60ED5;
	Thu, 12 Aug 2021 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802351;
	bh=M7CS3hy5FHYqtbakU+djiQ3z3fJ8w649qJ1OzlO1WCM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCQbR738Lszwx1ov4c5R8zaN5Ri8aqSPVjYNd2cQKDMnBh4CzrmJi7E5CslVB7Loj
	 W2sA+H5km8I02JHEqVABk11+I/15YrnxsRDmbHr8UrCnQz95Yu6if/3fbBkXx93pho
	 yZZPywVjsTpcUQUcXBP2fAJzh24MQdgYYieC5EgZnUTcNGfvwvviz2GOI+KnvaQIIN
	 Mag2chAFZX1RGtXpTG+cGWhw9NWC7YUODPFVuOjbCXGyk2VjBeKPjpnLJCKTi6edZs
	 tSReZ2LYvqNogE9Ebc8Njg3p30t+a6D2ah4fJAkj1+oMB4Hw8+nSXFHSf5QasNhWuT
	 tytIbq5O9PRjw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Kevin Hilman <khilman@baylibre.com>,
	SoC Team <soc@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Marek Vasut <marex@denx.de>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.15 #1
Date: Thu, 12 Aug 2021 23:05:35 +0200
Message-Id: <162880206112.1376011.3171809385171083085.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
References: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 6 Aug 2021 12:58:17 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.15. A small
> PR containing mainly dtbs_check warnings fix for ST and DH boards.
> 
> regards
> Alex
> 
> The following changes since commit 15f68f027ebd961b99a1c420f96ff3838c5e4450:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 57798ff216ebf1145bbbd5ea014ad65a72c1d064

       Arnd
