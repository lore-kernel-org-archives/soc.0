Return-Path: <SRS0=H8Po=YO=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0973C00140
	for <soc@archiver.kernel.org>; Wed, 10 Aug 2022 14:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB42DC433C1; Wed, 10 Aug 2022 14:04:11 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF6CAC433D6;
	Wed, 10 Aug 2022 14:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF6CAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140250; x=1691676250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=essceR54I1P1+uwnMKusOBNBSYj2G5avgwzUHp9FtEE=;
  b=joE0a9tsVh9cuX+vIaUyJ9z0ngkJYXScIT9HzOGDlzoRjanrnX9n/wQa
   5cTtuXIsl0TTKF/7hRSr/owwQM+V/lobpeQSiZgx7aaU5qJg6ta7LCPbE
   Sspk8LsxBtPnPuWS07zxTFCNDl7gMF4p/Qam9tVbHwXD1x6bPhVkp+T/N
   0ROts0jjse+lkzcqYzJSQ9xfCkFBbSBi+Dc5u2iobfdwYI98qT4IEhe7B
   hOadjYYVtpEcz4U//MvRHC60gszR8h2zY36DDSxUEtBn3FNHjSayJZfPT
   c6dcTbeWk3/tPBoFFtCXHeT+qPjbzRbeD+Dz8h/iuIRZjVWnYbpN+s6cb
   w==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108428032"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:04:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:03:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-i2c@vger.kernel.org>
Subject: [RESEND PATCH 2/2] MAINTAINERS: add the Polarfire SoC's i2c driver
Date: Wed, 10 Aug 2022 15:02:44 +0100
Message-ID: <20220810140243.2685416-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: linux-i2c@vger.kernel.org

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd0f10a110e7..148c9b03759a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17524,6 +17524,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
-- 
2.36.1

