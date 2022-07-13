Return-Path: <SRS0=u1x9=XS=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9C0C43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 07:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1CC6C341C8; Wed, 13 Jul 2022 07:03:43 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86615C34114;
	Wed, 13 Jul 2022 07:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86615C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657695822; x=1689231822;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9qt8csHkgYNrS5Oi1qBJfWGmXxYwaOhVFbXfJFXRZm8=;
  b=03HFyjG+Ly1Y/i5el+1ZEQ9a0jLz75DXKxxUhEqQ45LmRrxYu43udukX
   6oKgWfJ8aLXtxiEzdSDjY7dzSSOvr56HvibHaAz8ASy2pNCoECqjb/6CA
   Zip9EKycNnjsRykK5yPlIeYg3uVWw70mMS8VZlM8JEfqACHVZpeW3QN+j
   l9/ifc5iNQQmVe69aIwLGs+DeigiSoETiahR98q1KKItOB+3uZeDs8HFH
   tWcSi00s0zUHuH3dek6earvINaAAXkUVF5FID132w73uisn5jEgT1gcTF
   LHRupYj3PBrQohTEzA9gVf4mdyfGU/yUPn/HctevSI2JQqIPCzCh0/PYj
   A==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="104226152"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 00:03:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 00:03:37 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 00:03:35 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] AT91 device tree updates for v5.20 #2
Date: Wed, 13 Jul 2022 10:06:02 +0300
Message-ID: <20220713070602.1652118-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 4dd1a613e464e9036d5163fc8ec5f7dc6e394b53:

  ARM: dts: lan966x: Add UDPHS support (2022-07-05 10:42:18 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20-2

for you to fetch changes up to be16285265868aa371378132fe37df2bc14ceb78:

  ARM: dts: kswitch-d10: enable the USB device port (2022-07-12 10:12:30 +0300)

----------------------------------------------------------------
AT91 DT for v5.20 #2

It contains only the enablement of USB device port.

----------------------------------------------------------------
Michael Walle (1):
      ARM: dts: kswitch-d10: enable the USB device port

 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
