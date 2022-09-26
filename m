Return-Path: <SRS0=rGsr=Z5=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879D5C07E9D
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 07:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41BEBC433D7; Mon, 26 Sep 2022 07:33:23 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12C18C433D6
	for <soc@kernel.org>; Mon, 26 Sep 2022 07:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12C18C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id l12so6393939ljg.9
        for <soc@kernel.org>; Mon, 26 Sep 2022 00:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bdmIJt6rQNjlh0yiDVLdX9e0561sbzxHw5aFIA/IaNo=;
        b=v79cy6oXnn6jFvsaen77Mg6VdE701cIGEaHuQTENaKPOGUgN9B7BSimv2dbnyULTr1
         /zKvGRHQYgZuaceUwXKyZ+TBqSHHNguVYPpScdrvDR5+40XaNOls7rfwOjyqmxidXKZl
         nyDSYayYQfBQJfq+FQPGsvpQUUzMfJ7/tr03QW22jNI+EmTXC+tpXGN3QStZCe15lpTL
         nx551+rzSYOKLyqRBPZhR0sOxEiwYpCnnjDChekA0IS2mv/7XPSGZBRcsyI8mtgV0jDC
         GbY/CWP3VHkDfo4l1/n3bgKsLlbJDfnSVQB+9070z9ftiMfjm/BH5ITCXszUztRuT5LL
         NhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bdmIJt6rQNjlh0yiDVLdX9e0561sbzxHw5aFIA/IaNo=;
        b=2IqBKM6q5yDOE+EqR0OBUO8tRrcKTJsYSCpOlgEF9iReHAseSL2/EapFR3WUn/x1il
         ATiKrGmkdDNFAN5SQJ0CVN/JqFdrV3UlKvaEHtUakU2TwwRmKAjfLHUly+8QbXWm7mPL
         dHQq0pMCG+1tCtDbxpqFYFDRZQptYiHw57EdZ6qtH7SVi7q2syDrXWCfJaUGOLOCgce/
         3sy/tS1sTIDxE5OgH2Fd0fE6ASu54xYu6GFSOhon3gOglcOF6jy0UIpXDqsM7fUgMD2r
         R4JvtBPTFF2ZaL9hJ+ejj0ERRZ/Zh6gLdiMc017JBU/+j2LZQtKTUFgy8W2XPAf1Hq5/
         g25Q==
X-Gm-Message-State: ACrzQf23qgEnNCpHNxZDH/8rxvQ+P7XwuDGmZvq18+W10z9UKOJ9xuqM
	9TimOgsy5heuRw2t5pvcnCb66w==
X-Google-Smtp-Source: AMsMyM6+bHOUKcKPn0fKD6bzf9pjyryrPSsSP+eheRR0ZtKMCuofYdlbGJLB+iKpVhBqQ6BwgXkt8Q==
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id d23-20020a2e8917000000b0026aa520db52mr6804043lji.289.1664177599969;
        Mon, 26 Sep 2022 00:33:19 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm2442477lfe.195.2022.09.26.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:33:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Arnd Bergmann <arnd@arndb.de>,
	stable@vger.kernel.org
Subject: [PATCH v2] ARM: dts: integrator: Fix DMA ranges
Date: Mon, 26 Sep 2022 09:33:11 +0200
Message-Id: <20220926073311.1610568-1-linus.walleij@linaro.org>
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
Fixes: af6f23b88e95 ("ARM/dma-mapping: use the generic versions of dma_to_phys/phys_to_dma by default")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drom dma-coherent, this device is not cache coherent
  whatsoever, just my misunderstanding.
- Change Fixes: tag to a hopefully more appropriate one.
- Update commit message.

SoC folks: please apply this directly for fixes if it seems
to be the right thing to do.
---
 arch/arm/boot/dts/integratorap-im-pd1.dts | 1 +
 arch/arm/boot/dts/integratorap.dts        | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/integratorap-im-pd1.dts b/arch/arm/boot/dts/integratorap-im-pd1.dts
index 31724753d3f3..14fab499f0fa 100644
--- a/arch/arm/boot/dts/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/integratorap-im-pd1.dts
@@ -248,6 +248,7 @@ display@1000000 {
 		/* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
 		max-memory-bandwidth = <40000000>;
 		memory-region = <&impd1_ram>;
+		dma-ranges;
 
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

