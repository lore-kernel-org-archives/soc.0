Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6D2C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 16:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE0B60551
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 16:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BE0B60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iIoKxsRs9ydxRYtXQEXra/tx4e5mDtAkyc7plRjdG8=; b=Rre9wgkZU0T+U4
	el84OP2QreFBQafXzi730oKYuFGsVB0GSDg+EuYZAuuGh7wsjeWf2YZtXnukpLub/b6fCo6Q1OkgZ
	8Xf7UpppJIdluh8kP4/+kUUGrI5Ll049mUBGIoynSWTngRc6L5kHt7cm+3cjR8f2OVNGtusDkssqF
	H+zDX708f8wjNdcLzafyLGJxSoKs+R2NS4un3108ZdyrXmBliHvAOrkzab7TfdRzeQIq/NNGgD9id
	6suSy0AgFrH+VE64T3Uq5dFi5UB5in2TWmdoTgb+nZzmQHeTE172jh3vaUSgadtTDeYEGfslxsB7s
	DPexe8mly991d7RsPgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mah3X-0001YX-E9; Wed, 13 Oct 2021 16:24:39 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mah3J-0001Vz-BD
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 16:24:27 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 249C63FFEF
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634142264;
 bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=as71Kdc64OWRd5Ec7u2lh83K7h011+DHoW5BiFkGQ2lxDt8AcFCUIpOoI8ZkVmthb
 n2MJp5VFdtQkwHDKu+h0i7QWK1WZ59PVTOJmn29NKF+2fx6n+6Z+AOlanXzNSZV41V
 V/342G9UHqitRFb9HPrRa/iax63OEZVNFWbxcROdAaorG2/9G4+/rWgRq7bVa5zO5y
 frg/B06/FogZaBNJSWKvF3v/PJrKZWQjVUiO67CvBE6coDQ78MK0o0beWw66sbPsjs
 ACHBe4qbhvb2GOb9sWaIeRXcD6LrnmpaSWSzN0AgCzimsARHaNHZwypmNT5kE0m79S
 hro00Tk715idA==
Received: by mail-lf1-f70.google.com with SMTP id
 bp4-20020a056512158400b003fd96a37f3bso2363906lfb.21
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 09:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
 b=V2cQ2wt9Xd8pAeoCVMXU8O2rt/AvDKkcKTdxoBmpcvYACmEcI5VeSrc0qfQ0yQSfb6
 QDQ13QhWaSPYtpz9dSsGG7Q/VT/lIxfd5Ub8c0W7tXJ1WMgG+VIPJXCyVSNkmMK8RXK7
 90id9rlQ9ppQZetiPG1Mrm7B91/eN4VkgS6V2ywmLiqU8xrx+LFF0AhhyWCVkBZ9GsR0
 6nPST0Hsa+DrTV/I0s0w8xr54CEeNnWr7mUO5ayTalnD8hCqRzJ0G/85yEnd29ovcvGv
 IigwJ8Z32Mqx4ddIb8gNDRxCPQKqNlvmpsZsVWrsb54oCfwUPJkBXMsjUc9PC9kIMTbO
 zdAQ==
X-Gm-Message-State: AOAM530rPgovzABcXD08TAVb0ons+n9em8BWTmFNwzZ0uTk2JrTtqF0N
 F02fj/akQH0smjExkfzUq01DWCkJj5rr3F7PgQw9MLld14/RJMkpvwvOrtoU+wv5S7daWYhwMuj
 4Ased8JA7g0+WvBTwcSuUJHucsCe3zjdGgKgsaRLVh0aUko1gTCug
X-Received: by 2002:a05:6512:3e11:: with SMTP id
 i17mr42098288lfv.613.1634142263622; 
 Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHolWBkWOXzX0f51ubgW0eqGFbNEBJQRBguxvNwraBslq04UV0jSTXrux+0AdM94v1s4Wm+w==
X-Received: by 2002:a05:6512:3e11:: with SMTP id
 i17mr42098266lfv.613.1634142263460; 
 Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 r3sm1372281lfc.169.2021.10.13.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:24:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts64 for v5.16
Date: Wed, 13 Oct 2021 18:24:18 +0200
Message-ID: <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_092425_551297_6BF05E46 
X-CRM114-Status: GOOD (  11.47  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211013162418.RvpZSQZsoWYLnIuo6ExyHQrb1wtI8mblmo4aaii6Q0g@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16

for you to fetch changes up to 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16

1. Match Exynos5433 DTS with dtschema.
2. Add an Exynos Auto v9 SoC and SADK board. The Exynos Auto v9 is a
   design for automotive for In-vehicle Infotainments (IVI) and Advanced
   Driver-Assistance Systems (ADAS).
   This pull request brings very basic support (pinctrl, UART and UFS
   storage) with a development SADK (Samsung Automotive Development Kit)
   board.

----------------------------------------------------------------
Chanho Park (2):
      arm64: dts: exynos: add initial support for exynosautov9 SoC
      arm64: dts: exynos: add minimal support for exynosautov9 sadk board

Krzysztof Kozlowski (2):
      arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
      arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +-
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   10 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      | 1189 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  301 +++++
 7 files changed, 1562 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
