Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA67CC38A23
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AA82C433AA; Fri, 20 Jan 2023 13:35:09 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C80CC433D2;
	Fri, 20 Jan 2023 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C80CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221706; x=1705757706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1YkW/D/aj3GzfQPMLoPMshLV3DxdOqxzw3Aa3dO5+I=;
  b=KAFV9GfHNuIRxv7vtn87uJ935NFEHJQ3IVp4wIMamRHWMbnwCg2n4Kh2
   IaKOwfkPtXc76Iqx2Smx95+CDOBVRPTQ1T7t6Xw7cCqsZuLSNj8KR9fPq
   o/vIE4zMqFFWSae1On2icMC9DSd5eRvtMMuD5syVd+Ov9draVAxOANf1f
   Hh5pO/LanGZX8vX5r0lHpN2w0ZuB2us78bgzRZNtqTAHkz7TRsNZIJkl2
   5s+f2hUpqaTiBdBQ8wD4MQy9dMCOiEb/zAoh3Rh69nOIb9A5Nliycv/mL
   cSrm7JddAjw8iqRlmWeqAGXdf0lXgeRs7zlqrh/8hcHtYTYKQsfoeiinU
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561570"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:02 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:02 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221702; x=1705757702;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1YkW/D/aj3GzfQPMLoPMshLV3DxdOqxzw3Aa3dO5+I=;
  b=OWUkDRRIIHMQnr9dT5WrGSvGaP3GHoUsBSLH9MJ/+pBhTHOSx7QL2gA/
   R+eAqHY7or8ZJu+N9GiXZy8yVY8c9YX5MakwPhiKZh3RRX3vPT75LKWFC
   upGxtQ0LJn3Z5VDYrz/82HkHVc50GzjQhlG6aZxMt0Jq8JgjGhdng6x1M
   KoSEQqd5I80ybDJS8CrTEqmAki15OZhlB7czgUsb4QQW0vjzKO9wELFJT
   Yz9rM5TZGrJ5J103wHVbewCRnY9iRf04niKsXDYcle5v6ueLQ2Ji74TcH
   iM4ZmZWZxhFA/+kqvwFQGMQVPE2+El0sXwcQVstPV9A1VWOG0MX3XXLzW
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561567"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 32FD4280056;
	Fri, 20 Jan 2023 14:35:02 +0100 (CET)
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
Subject: [PATCH v2 00/10] TQMLS1021A support
Date: Fri, 20 Jan 2023 14:34:45 +0100
Message-Id: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the second round of this series to add support for the TQMLS1021A
using the MBLS1021A mainboard.
The changelog is included in the individual patches but the most notable
one is picking up the old patch series for adding lpae config snippet
support.

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
 arch/arm/Makefile                             |   4 +
 arch/arm/boot/dts/Makefile                    |  12 +
 ...1021a-tqmls1021a-mbls1021a-cdtech-dc44.dts |  55 +++
 ...1021a-tqmls1021a-mbls1021a-cdtech-fc21.dts |  55 +++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    |  36 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso |  56 +++
 .../boot/dts/ls1021a-tqmls1021a-mbls1021a.dts | 406 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a-tqmls1021a.dtsi     | 112 +++++
 arch/arm/configs/lpae.config                  |   1 +
 arch/arm/configs/multi_v7_defconfig           |  13 +
 arch/powerpc/Makefile                         |  12 +-
 scripts/Makefile.defconf                      |  15 +
 13 files changed, 776 insertions(+), 11 deletions(-)
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

