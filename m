Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC8FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0BE20E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 19:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0BE20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YephqhhvPa+anM2ATxPYJliHm5wk9r5NBPlDD+OqBIU=; b=lfWrhFG1mcbYf0YRQJqawQAI1
	htycEWYdkXs1EOhvkDyJ0+LyrHZ4Pk86xj2K9IjY0eC9qrMuQNXml8FyHvVibw3Lp7o28eKxq0gEV
	NXIDC2FefMMusAHIwueLUT4YU+EanZ9ERHeWXBghNZbbAtGGoD13xE1cguZ8SsLYBMCq4RJfpgtuh
	9IAOKICidofjCQwn+pKar9HwXCZ3zIGQx2dc5qfpzw16aIBNahrakxPZpXCD+NZD0EaubM173NgYZ
	CMmtsNB0WFAJ71ZKLNrlsEzGC00GLDfMLZV8kpPXJ5UyDTDmLySIT9pMbKqah24VG93bdtEYULh2L
	HLn2dmKCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47IL-00065e-Br; Mon, 25 Jan 2021 19:13:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47IF-00064G-8S
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 19:12:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AE7421D94;
 Mon, 25 Jan 2021 19:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611601974;
 bh=2VuRuHW8Al2DfnQg6T81D9vdEK7Yw6uv4M3aBtQ02rE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GwBl19TQPtO32Ms7qWQnBYXb9z+aNt16f9wzrYWC07+BBBeFJe0PwCe3k7aTgcepR
 n6sQI7y/EnLVnavQ47u9x201TVXUkWv2GQjCENhCHVxm62gE1bnsx0E6trrS+2J9gG
 Aa3RB6YQnu02NnsNlYoFRFp5uey/dXolbud2z1P6K9WiAC65m5Tybdx3S3A6Pp7Ni2
 0ZnLXV+aqw1hT5HMG3BXfK2scJ+XH34/OYasPczjXwy1eSbZfb55jWheGAsd+IC5mO
 ljQ3ezRlbYwsrfTTpj1C3ZC8jCypli/VVQnOFlAW3JUSgWFnvCMn08vyFYqP7qFhSX
 QzH8yX2AgaEFA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Date: Mon, 25 Jan 2021 20:12:39 +0100
Message-ID: <20210125191240.11278-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_141255_415982_1CF1520C 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125191239.eQ0auavcnwIEZtZQgtj0vogBh-8V-EnOPMEQeYeJyMA@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12

for you to fetch changes up to 3803f461bd28c1c817281348509399778633e82f:

  ARM: dts: exynos: Add top-off charging regulator node for I9100 (2021-01-03 17:33:29 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.12

1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
   it suspend/resume cycle.
2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
3. Correct the voltages of Samsung GT-I9100 charger and add top-off
   charger.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
      ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
      ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
      ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
      ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family

Marek Szyprowski (1):
      ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible

Timon Baetz (2):
      ARM: dts: exynos: Fix charging regulator voltage and current for I9100
      ARM: dts: exynos: Add top-off charging regulator node for I9100

 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |  2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts       |  2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts        | 30 ++++++++++++++++-----------
 arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
 arch/arm/boot/dts/exynos54xx.dtsi             |  6 +++---
 8 files changed, 27 insertions(+), 21 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
