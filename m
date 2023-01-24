Return-Path: <SRS0=Qc4v=5V=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74010C38142
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F94FC4339E; Tue, 24 Jan 2023 11:02:23 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D714C433EF;
	Tue, 24 Jan 2023 11:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D714C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558140; x=1706094140;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3wIsd9yuwAxmR+0jDYx8c6/1g7gmVgh8u1CP487VUjo=;
  b=i7akQwqDr2ktekUKziQ2/XrTYuZvgd8owmg8VtUNBQTdNwAmSHeLPK1K
   eBLfw98yG5fhEwsrnhIWff6q3pzzh6e9St9o3qKlhL9TizO4eXY5NGVLc
   R2Jg3ZH2iWgdTsFsAzobZeT1ECUcsYbJ2wFzyrCpF8s48r5VMIXpmFau0
   cLeC3Zruc3tarEJ0ccv0JHwdqD3f2bsS/IqcUHJ5iE8xffTO2hrez9NkY
   KZtaO/+HfrYsrGo9oabAozwhX5pufxKJKbWDckBR3V83mUpX9s8tn0Gb5
   Ky0ijr3fGW5uOcX5KYCmGT0+JmML+pkNqvpgcQdWvFASOEw5TMteks199
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616608"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:16 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558136; x=1706094136;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3wIsd9yuwAxmR+0jDYx8c6/1g7gmVgh8u1CP487VUjo=;
  b=cWkyWJofCHtHPwqnWhAfT0UpGxrJ8iv7SGU+25Ym3oDeKQaXQFVfKUzY
   /IjImKbIGVl0rtb5qhxyK/MZaPGGCbvHscvAamT0ZCDuVHK01pTPap6zi
   GrKPRSF6OgUqqc+qutwd+zD9Zm1D6TswN7zaPI91D9nkTluBBSRMxzce0
   G9yhyXgxqMRCV1TgvDMw3H0faiCZNO7XRi3jOX/gatazGJcVWQwe+qlQK
   MsnciCCd2RwS5htTZ8FOAXOBlUIitbpcNrOoINBTkIS25CKBeTqhZ/7jL
   ybJbJCC6qk3Fl5IobYIdxRF+wJMY2aa+s1/GD6UrLbLkU3vWaiec4wWu/
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616606"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 00729280056;
	Tue, 24 Jan 2023 12:02:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 00/10] TQMLS1021A support
Date: Tue, 24 Jan 2023 12:02:03 +0100
Message-Id: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

thanks everyone for the feedback. This is the third round of this series to
add support for the TQMLS1021A using the MBLS1021A mainboard.
The changelog is included in the individual patches.

Best regards,
Alexander

Alexander Stein (7):
  ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
  ARM: dts: ls1021a: add TQMLS1021A flash partition layout
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH DC44 overlay
  ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH FC21 overlay
  ARM: multi_v7_defconfig: Add options to support TQMLS102xA series

Matthias Schiffer (1):
  dt-bindings: arm: fsl: add TQ-Systems LS1021A board

Nicolas Saenz Julienne (2):
  kbuild: Add config fragment merge functionality
  ARM: add multi_v7_lpae_defconfig

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 arch/arm/Makefile                             |   6 +
 arch/arm/boot/dts/Makefile                    |  12 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts |  55 +++
 ...1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts |  55 +++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    |  36 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso |  56 +++
 .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 406 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     | 112 +++++
 arch/arm/configs/lpae.config                  |   2 +
 arch/arm/configs/multi_v7_defconfig           |  13 +
 arch/powerpc/Makefile                         |  12 +-
 scripts/Makefile.defconf                      |  15 +
 13 files changed, 779 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a.dts
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi
 create mode 100644 arch/arm/configs/lpae.config
 create mode 100644 scripts/Makefile.defconf

-- 
2.34.1

