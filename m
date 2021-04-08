Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84550C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:24:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 676B56113D; Thu,  8 Apr 2021 15:24:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB90561108;
	Thu,  8 Apr 2021 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895492;
	bh=jKXKkgZ07rHIjheOw/4DO2B9AWMNAqJxWU6gGBKJ1E0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JjEMW1v1h5vQjW8wKz+HKcWmhgz+X/w4iPvYoEea91NazWA1+kbENaG/LSKIEd08s
	 NC5ER2IvbBE9h0oWaevd+QphsTulJdu6/+/0Yz9IkH7p5Pe+8RBdsO/MWz4ph21EUj
	 7ZJ4bWL4+hl1xxRWc91UumlX0YyvrcvVTFcKZ/2Ext50UaiIonEoIbYKKOdmW75gc7
	 BjaQE8i1XvgeVQM+H6+hIhJ3dXftUKHeURFsTjtKJDM7Y0iZVpFMzt5GMdJBp2QBSG
	 DBpnl/N35X6HibMgc2MD/xuiC3QBa9XiSQmZN94QrLSzaHj8Azxp7ZZnSD0aRDn11P
	 V6QORIxJGYGVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
Date: Thu,  8 Apr 2021 17:24:23 +0200
Message-Id: <161789493809.1630479.13120302214696813911.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 08:58:26 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.13
> 
> [...]

Merged into arm/dt, thanks!

I also merged the corresponding 64-bit branch.

merge commit: 59206cf877be3a93dff0ea270bb1dd14f3010799

       Arnd
