Return-Path: <SRS0=pPb6=OZ=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375DBC433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:38:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17724613D5; Tue,  5 Oct 2021 14:38:10 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED79F61372
	for <soc@kernel.org>; Tue,  5 Oct 2021 14:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED79F61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f45.google.com with SMTP id i4so88025899lfv.4
        for <soc@kernel.org>; Tue, 05 Oct 2021 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
        b=A9uNkZL1Zeuo7Tspc6oQR2fBKHxSVRHx+WgNkJwJfw83LPMlNQQjYSsYKu6+1NGJ8O
         NB2CeH19fARPh9GsfBeEH/spe+gxRk3cY9v2/C+vlB4S4nEvS1XhNbMTMskxuATQrB5C
         U07yEvNOLUjOYFkrynNrUwD0iRyAOydH56W+ZvnHPe960sqryoPlAH3D81I71O4iGbOh
         c/8EkoNjOn1xAsDtaWTwSoxm9ya4RsuhlfokputHxqq1Aef21AepJiG+xFCCblgHEZ4C
         3Bv1uCy7CsYQNmCRngk4/PcoMYBF42wAZRtgAJbaRhxNsc42FMIM5ALwp/+8UsEtUZRA
         2/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
        b=BbgGR7jPrJTWxKTML7STzDCHLoacaiYuSkYLsADhZoBzW5D+ClxzO8KnN/BaWAr106
         5Wh8TKzaYWDzML+bgWwPaJ83HHqvB/KVJ+WVsTeHXoAOJFeDAbF6dRNKoTGOKzzA3o4s
         e2nH+naa2x7I0O+mdiSWkmkkx2slhN3FLz9lVX268V4H7/Jby9YmKpu4PxzqK6tCOw4N
         fhCDWDzvLiRQw1cLr40ORh/DvVjUgwJmAmtbbQsLxGudSoSG3fhr8BSDU1DabSO/Dp0s
         JwwYN/wYkG7WXFDPqPuDxNyYaUisq5kMZBRuxo9iMD37NSUryARWiL7xdkstIxmLYHwv
         fTPg==
X-Gm-Message-State: AOAM530Nh4ODMlMR7Iz7/XiGeIFj8agu2+mesBMDicloMkcuOTT1xuqA
	0d7o5UhdQnjz5rsFUWAPsPPNPA==
X-Google-Smtp-Source: ABdhPJwjHFt3CH4sjkux3RohVRrB59RZWeObwoAjO4ak37gG3wQ/jeQOUiIaNRGdJyngodBj+RX0UQ==
X-Received: by 2002:a05:6512:3501:: with SMTP id h1mr3770923lfs.446.1633444688364;
        Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	robh+dt@kernel.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.yadav@ti.com,
	Tudor.Ambarus@microchip.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	sre@kernel.org,
	thunder.leizhen@huawei.com,
	Jonathan.Cameron@huawei.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ka@semihalf.com,
	tn@semihalf.com,
	jam@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 0/4] Add support for the Mercury+ AA1 module
Date: Tue,  5 Oct 2021 16:37:44 +0200
Message-Id: <20211005143748.2471647-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA.

This version differs from the previous one by removing the spi
flash node, renaming the memory and mdio nodes, adding gpio nodes,
and adding a bus number property to Synopsys DesignWare i2c
controller node.

Paweł Anikiel (4):
  i2c: check bus number property in DesignWare I2C Controller
  dt-bindings: add bus number property
  reset: socfpga: add empty driver allowing consumers to probe
  dts: socfpga: Add Mercury+ AA1 devicetree

 .../bindings/i2c/snps,designware-i2c.yaml     |  5 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 99 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c   |  3 +-
 drivers/reset/reset-socfpga.c                 | 26 +++++
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

-- 
2.25.1

