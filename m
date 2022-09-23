Return-Path: <SRS0=Da4+=Z2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AFEC6FA82
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 11:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C591C433D7; Fri, 23 Sep 2022 11:38:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2F99C433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 11:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2F99C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id k10so19371577lfm.4
        for <soc@kernel.org>; Fri, 23 Sep 2022 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sC96iRWE0iR/7JrcBD8R/lRQZQ9BvY5t0TcgVakRQZg=;
        b=iZ/kGhp2yqDUAeHvctXBEY3roqpylxq4FeiUh6fDDZvpujQI4ynaEfb4OsGALL0N40
         vSBzDG2WKciYMnkIn83zbPkKH4ijRWijo2sXvtnMCBR+A2zQd+wVyBXvHybOI7XEWGtq
         WHu1LOVNjJZnhS7NZv94yizEfByjKQDDSa2yTmsPS7b2A08/JE1gdpGBWpFwOBGVSgEC
         Do4RtedrEYkIUSGla/bS+pGpcOS8riD9lkMPYrTBzQjqAOzm23VDDzRuo9H9TxyCIegO
         SWxFFYd2GJKrsZA3tVLc0tmNS6SNHLGc2XIlLpgSf2JjH/p+eK1e7ArJK6zpUZNohbI2
         85uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sC96iRWE0iR/7JrcBD8R/lRQZQ9BvY5t0TcgVakRQZg=;
        b=GlBujdAfD+fCauxDMQAhxyix3IWnJ5bHCkfVnvYLnW6XWjhmchaD96rN3e8Nl8EPOS
         3tuV3oF2b7hyUbfQh8DQKov3faff4/QRJd/EAVwN3YwL0HUj12Yg8U3oZNVUTFNWxOzN
         Kn0Y3MZEnC8sME90lANGbrw5ctFC6CGnK+TuFFca1U0E/36l0PNUi82OaidBiV41NPAw
         zKJAS9ReTiY5uPjlM8nXo36bYAA5yIlgrSmGjoHXiLzFSWI6czPd+M3Jl/yQr9wef0CC
         KDRAw6f5IxfNUVjjaaAVph8B9jGu+7IAlrqmn3BjbLbV/9B3sfTnD4IdTK0TmOArA7gK
         ljjw==
X-Gm-Message-State: ACrzQf03bfWRDMChTxjFxpov5EHoa7ndae5pZXGp8E9rO/XlzsnBC/LO
	toksAaJBt//ZonWuGdPuUBFqTg==
X-Google-Smtp-Source: AMsMyM6bk/6lP8bmCu1kqcX6ukJrTraEnFp7uwmZJzSXO/KTSUro3Hf8CT/92vrW1HQgnWQWII/SPA==
X-Received: by 2002:a19:ac04:0:b0:49a:7253:4a68 with SMTP id g4-20020a19ac04000000b0049a72534a68mr3172037lfc.322.1663933107050;
        Fri, 23 Sep 2022 04:38:27 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o15-20020a05651205cf00b0049f53b65790sm1407343lfo.228.2022.09.23.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 04:38:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Arnd Bergmann <arnd@arndb.de>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: integrator: Fix DMA ranges
Date: Fri, 23 Sep 2022 13:38:22 +0200
Message-Id: <20220923113822.1445491-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change affecting the behaviour of phys_to_dma() to
actually require the device tree ranges to work unmasked a
bug in the Integrator DMA ranges.

The PL110 uses the CMA allocator to obtain coherent allocations
from a dedicated 1MB video memory, leading to the following
call chain:

drm_gem_cma_create()
  dma_alloc_attrs()
    dma_alloc_from_dev_coherent()
      __dma_alloc_from_coherent()
        dma_get_device_base()
          phys_to_dma()
            translate_phys_to_dma()

phys_to_dma() by way of translate_phys_to_dma() will nowadays not
provide 1:1 mappings unless the ranges are properly defined in
the device tree and reflected into the dev->dma_range_map.

There is a bug in the device trees because the DMA ranges are
incorrectly specified, and the patch uncovers this bug.

Solution:

- Fix the LB (logic bus) ranges to be 1-to-1 like they should
  have always been.
- Provide a 1:1 dma-ranges attribute to the PL110.
- Mark the PL110 display controller as DMA coherent.

This makes the DMA ranges work right and makes the PL110
framebuffer work again.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org
Fixes: ae626eb97376 ("ARM/dma-mapping: use dma-direct unconditionally")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for fixes if it seems
to be the right thing to do.
---
 arch/arm/boot/dts/integratorap-im-pd1.dts | 2 ++
 arch/arm/boot/dts/integratorap.dts        | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts b/arch/arm/boot/dts/integratorap-im-pd1.dts
index 31724753d3f3..ecccbd1777a3 100644
--- a/arch/arm/boot/dts/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
@@ -248,6 +248,8 @@ display@1000000 {
 		/* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
 		max-memory-bandwidth = <40000000>;
 		memory-region = <&impd1_ram>;
+		dma-ranges;
+		dma-coherent;
 
 		port@0 {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index c983435ed492..9148287fa0a9 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -262,7 +262,7 @@ bus@c0000000 {
 		lm0: bus@c0000000 {
 			compatible = "simple-bus";
 			ranges = <0x00000000 0xc0000000 0x10000000>;
-			dma-ranges = <0x00000000 0x80000000 0x10000000>;
+			dma-ranges = <0x00000000 0xc0000000 0x10000000>;
 			reg = <0xc0000000 0x10000000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -270,7 +270,7 @@ lm0: bus@c0000000 {
 		lm1: bus@d0000000 {
 			compatible = "simple-bus";
 			ranges = <0x00000000 0xd0000000 0x10000000>;
-			dma-ranges = <0x00000000 0x80000000 0x10000000>;
+			dma-ranges = <0x00000000 0xd0000000 0x10000000>;
 			reg = <0xd0000000 0x10000000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -278,7 +278,7 @@ lm1: bus@d0000000 {
 		lm2: bus@e0000000 {
 			compatible = "simple-bus";
 			ranges = <0x00000000 0xe0000000 0x10000000>;
-			dma-ranges = <0x00000000 0x80000000 0x10000000>;
+			dma-ranges = <0x00000000 0xe0000000 0x10000000>;
 			reg = <0xe0000000 0x10000000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -286,7 +286,7 @@ lm2: bus@e0000000 {
 		lm3: bus@f0000000 {
 			compatible = "simple-bus";
 			ranges = <0x00000000 0xf0000000 0x10000000>;
-			dma-ranges = <0x00000000 0x80000000 0x10000000>;
+			dma-ranges = <0x00000000 0xf0000000 0x10000000>;
 			reg = <0xf0000000 0x10000000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.37.3

