Return-Path: <SRS0=H8Po=YO=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010ADC00140
	for <soc@archiver.kernel.org>; Wed, 10 Aug 2022 14:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B71A5C433B5; Wed, 10 Aug 2022 14:03:49 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3DABC433D6;
	Wed, 10 Aug 2022 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3DABC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140229; x=1691676229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j+ubEaa4d6letw3k0c6vUxa4al5aj0IPLS7HTum/LzY=;
  b=qwYaE1CDowcbpsNoUY7dJZpAgLz5nUfHhvLVfUkC3YhaT0yMDaiLZjZl
   rstE2G23DJYiSxUx1rTQRAqJdImcGWiSn2oROHZnaVhtQpysVtD921vo0
   9bUFmqMOeqnqQF1m+InaMj+LmBPsxbiPsTsNNeIj0bwgD2bsyI//TSAVG
   NY5Bw4mjBevx/xk9DgNKQJeO7qVR4qcOgsudsHekbKioEf7RIYDmaSJ2G
   eCSJOEtot9ksRn2Wx7AgBMKi900RfxeqJrSWzHxGnNs5i/sv+7S5w+uUA
   LkzvD2vmOeYh1tqhllgRafylsxukfRCFj/1r/0MWncA2MneJRDJxaerJp
   w==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="175691467"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:03:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 07:03:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:42 -0700
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
	<conor.dooley@microchip.com>
Subject: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
Date: Wed, 10 Aug 2022 15:02:42 +0100
Message-ID: <20220810140243.2685416-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hey Arnd,

Could you please take the following two patches via the soc tree when
you get a chance?

The first is adding coverage for "my" dt-bindings as suggested by Mark.
I CCed all the subsystem maintainers on a V1 a week ago & I've added
them explicity to the patch text this time as CCs. Correct me if I am
wrong, but I am operating on the assumption that their Acks are not
required here. Hopefully increasing the binding coverage is non
controversial!

The second patch is a resend of a patch that was deferred to later in
the merge window avoid messing about with a 4th conflict in the entry.

Thanks,
Conor.

Conor Dooley (2):
  MAINTAINERS: add PolarFire SoC dt bindings
  MAINTAINERS: add the Polarfire SoC's i2c driver

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 4e23eeebb2e57f5a28b36221aa776b5a1122dde5
-- 
2.36.1

