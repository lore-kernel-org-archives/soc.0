Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A99C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A04A0610E7; Thu,  1 Apr 2021 20:15:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04C70610E6;
	Thu,  1 Apr 2021 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308138;
	bh=LweJqzMMPk3ru/FcLFu1wFQimre0Eokcq6QXnWa2MYU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBTWZxbjQkKDtM+9XHLsCx2tx7ng7plZf/kA7UVhohoARVOQRcny7NfvwaxSHML63
	 TINieDj3Yqvh1NmneqHNkBtraY60OrLb6pUGF5m1xCB827bfsfWVGflayUx3FT2yk5
	 +vdA/FIL38l9i2NP36vYbvi6x8zzD4lxLctfKm+JZhyQGoTEQ6wZXE8MZwaWoUpFi1
	 yFDw1my0sBFxi21t/nr2Tx0LhtqGvMyDMEsGSQrAnBOm6bAnJHI74AlKJYfbLwFWGe
	 3Ahnma6Ikc4ad8KO5Y1+wMe+/djitfsVDVyPcQsb4dRdxnDYY8whhEGEEbLzC1cRwu
	 8A6zV4+v3RJrw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	w@1wt.eu,
	olof@lixom.net,
	arnd@kernel.org
Subject: Re: [PATCH 0/3] ARM: mstar: MPLL mop up
Date: Thu,  1 Apr 2021 22:15:16 +0200
Message-Id: <161730808589.655497.9969521332794261660.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Mar 2021 21:35:39 +0900, Daniel Palmer wrote:
> This series is just 3 small patches that got left behind
> when the MPLL driver was merged.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20210211052206.2955988-1-daniel@0x0f.com/
> 
> Daniel Palmer (3):
>   ARM: mstar: Select MSTAR_MSC313_MPLL
>   ARM: mstar: Add the external clocks to the base dsti
>   ARM: mstar: Add mpll to base dtsi
> 
> [...]

Applied to arm/dt, thanks!

[1/3] ARM: mstar: Select MSTAR_MSC313_MPLL
      commit: de73b5a97bba1538f065e1e90d8eeac399db7510
[2/3] ARM: mstar: Add the external clocks to the base dsti
      commit: a93cf651df08c370e622c3aea456bc729b352437
[3/3] ARM: mstar: Add mpll to base dtsi
      commit: f374f25aab6f10ba5e442d8f81dd94d960276cb5

       Arnd
