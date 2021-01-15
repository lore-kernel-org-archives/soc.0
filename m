Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3F1C433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:22:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1441238EE; Fri, 15 Jan 2021 17:22:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 486FE238E7;
	Fri, 15 Jan 2021 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731339;
	bh=SL80JnqP4VeZBqiSUAJTFlnVGZniTb+FgtlqNX1t8DA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GiQOSTlKX+rhOp2LdXtyk81vuF5DGQpHfq3+K2oZNZPPq1O5Lr3vraAPtK4QR2W29
	 vX4CAUcZvWWTAvKpYRWtPbwf5uCeAieyeCd+b/xdRLHiJpfRh+64WdabrItKFa1V7n
	 Eaebr3xW+hZLMvbkMQzoyniC2wdYy33V9AOmYygrXh2RoMeIKYYzvAvx7Uzz462XDM
	 ku6YI5Equ1DE6s+T1TopA+Fx+V7y7natzTMznBPjy/20Q2wsW0vfP+YlYV6SXiAbfC
	 EXC/yxn0cMxarhVtjJyaKUs8XRWQuEUL8O0lQqHqN10upQhEZjA587ysbNmO9N654t
	 YOQbZNrr45yGQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: defconfig: Drop unused K3 SoC specific options
Date: Fri, 15 Jan 2021 18:22:08 +0100
Message-Id: <161073123818.625238.13327554400808515391.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107132228.6577-1-nm@ti.com>
References: <20210107132228.6577-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Jan 2021 07:22:28 -0600, Nishanth Menon wrote:
> With [1] integrated and all users of the config symbols removed, we
> can safely remove the options from defconfig.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201026170624.24241-1-nm@ti.com/

Applied to arm/fixes, thanks!

[1/1] arm64: defconfig: Drop unused K3 SoC specific options
      commit: 2004e62a2a06b9029f7d728a0b5d19a499569184

       Arnd
