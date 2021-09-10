Return-Path: <SRS0=7jOf=OA=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF93C433F5
	for <soc@archiver.kernel.org>; Fri, 10 Sep 2021 19:03:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3E5EE611EF; Fri, 10 Sep 2021 19:03:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CD1611C3;
	Fri, 10 Sep 2021 19:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11CD1611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id d6so4005758wrc.11;
        Fri, 10 Sep 2021 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HzZynKdGrV44/xOe+zaSu5/JFHGIIV4Z7i2+Mxb4So=;
        b=PXcww5kI0R813yeiWBw2wE4F/LSk9naoPzC626Wd5/POsg2wsFYMcT//IXfTy19CQI
         Gha1nqoD/VHFDpvh0jeItrnd9P6z7CcCDWD9xnT/2YKZEWsIrX8IhYcmhgJVLnNa3/Fj
         OeDJFxaV/gxkzivmzrYbRVWWz57oMllNVY/8+Qw3yBK43FVePed6xV2aeSynZawpFRER
         cDkljf2NbfKPw/Ov+cPc751QgEvaJ+x1K28Z0ZeaSl5EfngyvN17c7bzAT53coI3BNUT
         r0f2pKV5ssHkDXTIpRAZik9SfNsIy2n7QcWN03UqXL4MNKkKXnOsKC8YPxGLkOKEh2Us
         O5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HzZynKdGrV44/xOe+zaSu5/JFHGIIV4Z7i2+Mxb4So=;
        b=xRjEU+F78vLiWtb5EE3oHJ0ZyfbTNtqOsuj7UmxKbk45b5q5UiA9C4r5YNLxL7+Re5
         eRt00ai57WOTVtrdmeSgsehrosXidMyqpbRGtxgUl7l1sn4K+fByQ1lZRowcdj6zHlx+
         CRlKB5m061UmZM7ZC17PMvFYz4KvJmhK/ZEKQntqBO78SFOEpoDfH+mVPGiYTGY09AKB
         VGKvoqx3O/gl5pyXnoxH4JHna60LBXpbVL5yJNSpdPHpZnSoEL2IYhcPZSerufa6dHer
         B7yss9lxWLwuAT7VcurDjlGqqKZ0r5vwqhVVYdfxyMn38TJxKNZkVpU1jSuiaHbiare/
         aMAA==
X-Gm-Message-State: AOAM533TvWNZApXMm6D313ZnXABcUXTtqpjFdPhdSZIqXVN7qw9ZadQH
	bPvhcYvwy4bNBrckt74sANg=
X-Google-Smtp-Source: ABdhPJzSGwRdaLj6Q0psVF7VMzyjHnXUukEu7xXHgUWoXVMnooA6oL29OqEyljYzK6eEpDeRL8ebYQ==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr11558258wrb.329.1631300622777;
        Fri, 10 Sep 2021 12:03:42 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id e8sm156734wrj.48.2021.09.10.12.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:03:41 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for IDO-SBC2D06-V1B-22W
Date: Fri, 10 Sep 2021 21:03:18 +0200
Message-Id: <20210910190322.27058-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IDO-SOM2D01 is an ultra-small SOM module based on SigmaStar SSD201/SSD202
SoC (ARM Cortex A7 core). The module integrates WIFI, NAND and PM
circuits on a PCB area of 2.95CM x 2.95CM. The SoC integrates 128 MB of
DDR3 on-chip.

IDO-SBC2D06-V1B-22W is an dual-ethernet SBC powered by a IDO-SOM2D01,
that embeds a MicroSD card slot, 4-lane MIPI DSI connector for 4-inch
RGB565 display or 7-inch RGB888 display, Dual 10/100M Ethernet ports,
and more.

This series adds support for this SOM and this boards.

Romain Perier (4):
  ARM: mstar: Mark timer with arm,cpu-registers-not-fw-configured
  ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
  dt-bindings: add vendor prefix for Wireless Tag
  MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC maintainers

 .../devicetree/bindings/arm/mstar/mstar.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/Makefile                    |  1 +
 ...star-infinity2m-ssd201-som2d01-common.dtsi | 21 ++++++++++++++
 ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts | 23 +++++++++++++++
 ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi | 28 +++++++++++++++++++
 arch/arm/boot/dts/mstar-v7.dtsi               |  1 +
 8 files changed, 79 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi

-- 
2.33.0

