Return-Path: <SRS0=hDLm=OK=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75A3C433EF
	for <soc@archiver.kernel.org>; Mon, 20 Sep 2021 12:42:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AA78660F43; Mon, 20 Sep 2021 12:42:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E73661019
	for <soc@kernel.org>; Mon, 20 Sep 2021 12:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E73661019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f43.google.com with SMTP id t10so61019809lfd.8
        for <soc@kernel.org>; Mon, 20 Sep 2021 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Jyaaz7vsLz5usd/SRKYitd1GGLRRfy3n82omug9pAA=;
        b=L/kr3gQxhCNlhY6qH1CLUHlheQzY/Uh+X/1bxbkbfOsRhN5fgPZdylx7AksknyVZx0
         ZavNwA4iIjTf8EcdStQfTAE/CRJna1NdH2D1H7fxIYHEiQ+0MHOPC7853nFtRKP48Vb1
         GJzyA8LSMUDfFgdLyXv74OeaA8br/7jymBKqKQKfeYRtMB2s0FkIFGGt5rTgnSKxV8mU
         X4NlHShLxa3rlaPq+R/xlNlW86R+vVxLpXI2xSERkAr/iLu0cn1PCrZkVQlCaSVrLeQt
         SndtPNzU3Ga5dMxXpv6OGJSxycuUZb6UBdv2g/0rC2zCOClhczAXcpdZBuLYOnmaI5kz
         GHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Jyaaz7vsLz5usd/SRKYitd1GGLRRfy3n82omug9pAA=;
        b=7bEQ8Wp5ck0xfgAf0MIF+yvM6uNZ6uQKcGbtr7jmk+BYkeWvkPa9wB2SIbKnyrsIaq
         10lR8awf8kAMLGBVYU6QaISj2R5cg2ICzKifwXt5+waCMRpY09eEmgtbQMD1Rr3ZZHCi
         2QEpQaFDIHmNwKKfB8LYBdMNwRyuT5+JVF7H1U3+nY4LhQ7w5Hug5sDJQcuqmW2Oc4cv
         JQF+PvN5p9wnVZSPM3aecxryWtheo8HV0Lvw+Wdl3D4Q3Evky0sNiA4Pn8NsIgIWAjvq
         Zosy9GWcAJkl6/AVn/aDMa2q4IT1QYyOePM2hVMy27iPvXiEYS8uCDRoZXkwurzpHRmZ
         zcxQ==
X-Gm-Message-State: AOAM530C9Dm+w4/Kwte/CEeQo/o61VWmcsYNg2B2ugoSrTYonbr5/8t7
	5DPzHG7EmQ01Y5hqzeICtclHAw==
X-Google-Smtp-Source: ABdhPJwptMV9N4Ai1/dhNdrr/uDN6aHZsMXxgGcaXehA6fzWLlCPes1ne4JSuGwqmkcUqu3FgLPPGw==
X-Received: by 2002:a2e:501a:: with SMTP id e26mr20763529ljb.57.1632141723926;
        Mon, 20 Sep 2021 05:42:03 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:42:03 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	dinguyen@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tn@semihalf.com,
	ka@semihalf.com,
	jam@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 0/3] Add support for the Mercury+ AA1 module
Date: Mon, 20 Sep 2021 14:41:38 +0200
Message-Id: <20210920124141.1166544-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA, namely a device tree, and a fix regarding the
Arria 10 reset manager driver.

Paweł Anikiel (3):
  dt-bindings: mtd: spi-nor: add n25q00 schema
  dts: socfpga: Add Mercury+ AA1 devicetree
  reset: socfpga: add empty driver allowing consumers to probe

 .../bindings/mtd/jedec,spi-nor.yaml           |   2 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 127 ++++++++++++++++++
 drivers/reset/reset-socfpga.c                 |  26 ++++
 4 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

-- 
2.25.1

