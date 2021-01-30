Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36A5C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8248664E0B; Sat, 30 Jan 2021 11:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B91164E10;
	Sat, 30 Jan 2021 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006475;
	bh=zL/su9NPauJa4Z+FU/FgaGL04PE6Ac/RyR8L45UZm4I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M5VGUJNFWoHd1afm+sUzEOVcMV1nfSAT0Zt+toOfLaypCnu+jtiju8Ds44QxGSEBA
	 /UKi4idmHX68vdr35t3/0F4hRkAdCjvCyF85Pid4iU1dcQCP/9hC7GrlA4hKvy32m+
	 Exv/TuXBYIpvpv0LTWN6xYjbUY3efxzEgRqnuQiDKqZ2AcSm9DjsYM3laSSac2Jy3F
	 bsTodDnPN/lWIV2PvYMiJL1dE18Fog3lTbDVCNeTX6qfN+8AyNLmXihF0DNqX4w6GO
	 pxpvsd+yJqz3zO7eydMCJxY8zFS17Y7oy6SU/pAhggUjdQ174PL+Fkz82DbAbFF/JL
	 ZNOxcqFUDMFhA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	jonathan.cameron@huawei.com,
	john.garry@huawei.com,
	linuxarm@openeuler.org,
	huangdaode <huangdaode@huawei.com>,
	shiju.jose@huawei.com,
	shameerali.kolothum.thodi@huawei.com,
	salil.mehta@huawei.com,
	zhangyi.ac@huawei.com,
	Tangkunshan <tangkunshan@huawei.com>,
	olof@lixom.net,
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	liguozhu@hisilicon.com
Subject: Re: [GIT PULL v2] arm64: dts: hisilicon dts updates for v5.12
Date: Sat, 30 Jan 2021 12:34:15 +0100
Message-Id: <161200641651.2316427.9644464780006221528.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <6013D1C7.90902@hisilicon.com>
References: <6013D1C7.90902@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 17:13:43 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 0b9c5cdda98ca31b9e49ebcb667f4aa684789b04

       Arnd
