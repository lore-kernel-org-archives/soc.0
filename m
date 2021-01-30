Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A941C433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A2DC64DDD; Sat, 30 Jan 2021 11:30:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6335C64DDB;
	Sat, 30 Jan 2021 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006257;
	bh=lWKyvAttHUJclQA26tKpBDuv/AngcAy6vqDiPCUX2Aw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6YZTlC/Gp10AGRiJwHph/dv+mwNdCWU2pNCmcu/LjNPIJtxNyDV3zD97vp92tTt8
	 r5CaMXnAM4flVGDzJorC7taoJH92L3Quhb5vFfR09DP4PkKb9fWwf4iHzANgaE95/E
	 himzii7avo23lzaogAcza1vNiGFv4UZD6ZiPepN2nVAEUfnhQmHFYbaf2amlsYLoM9
	 DHzUiJWp4sMmrZDJ+maElZB7P7krPyx9g2Tuf+fRp2HFLzY4X1mjeUGWbJ0pril0hD
	 /Nww9y1h2ZzJn7k5tSrMZtvSa8cYho7K/ES6ijL62Z77+TeJIs9W7k1r7ec2zSO9/K
	 cih/931YCgtuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Kevin Hilman <khilman@baylibre.com>,
	arm-soc <arm@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	Marek Vasut <marex@denx.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.11 #1
Date: Sat, 30 Jan 2021 12:30:46 +0100
Message-Id: <161200622954.2192465.3399195515252953534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
References: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 17:21:52 +0100, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.11. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e6777b8d35dc140033476b8f5ae21e8e5440baea

       Arnd
