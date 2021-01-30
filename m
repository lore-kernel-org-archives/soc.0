Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E73C433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E278964E04; Sat, 30 Jan 2021 11:34:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E526364DDF;
	Sat, 30 Jan 2021 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006460;
	bh=Q8F+qBTC0HQUUMOXQcmJvGqSdv+trzUZuSsMttv4SD8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qczh69jq/uvFak1dNS3kcSWUEnRWIVV/P7VDb8Gtd33FkxB31gXXgKx+zH2n1c8cL
	 9UbB4S8xVUz9iN5G+SsPxZBmQSCDvcRpkHmU3uKEhhlnr+v08IILtt3a6NVNH8sZpN
	 wbQvHieUwtlGJtCFp5sE5lDrtXu0NUa360jeom33/lZNzgvVNNiPwsgbK5Li7XCRsr
	 nqeqD0xNpNCCs8FKJGp+1Tk+60/tZbmMsgUOoUKDxMK8SevH4GHcqntBAOjvKSDflb
	 6plIRgvH9PzmWf71+3ew6pcgvg/yjQgplE+clWdhnU7ctM6ALc3eiLZAZPCU3d2CP0
	 4LhHqs4DuOe+A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Olof Johansson <olof@lixom.net>,
	SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Marek Vasut <marex@denx.de>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT changes for v5.12 #1
Date: Sat, 30 Jan 2021 12:34:08 +0100
Message-Id: <161200641681.2316427.4971661443078699062.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
References: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 09:42:37 +0100, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.12. As usual
> main changed concern MPU part. Main changes concern DHCOM SDMMC1.
> 
> regards
> Alex
> 
> The following changes since commit 83d411224025ac1baab981e3d2f5d29e7761541d:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 86a24899c2dbf12a6ce80cc48eea48ac60d053ce

       Arnd
