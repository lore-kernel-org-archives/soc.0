Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999E7C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 811C7C385A9; Wed, 20 Apr 2022 07:05:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F542C385A0
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F542C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id u15so1514789ejf.11
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cs33zVKATtYwBAjt3G3bc95qbW93xGE5Ve8FyegMOGc=;
        b=T5G4aeSHJKDc4yJE3qYKEL0oEzPu43qNYQDk7i+dWTGxirpISMKLsh0bxqND9Hryh3
         3CRCvSeeJhWkO0NbHDzd8Z7htTQDw/aLDxbUdv/xDK85MAPKfsEfuaISiyAGtlY2/cbu
         c8TkALDwMkpJfZXMS8T8Q4jWbWpdLCz+yOZvS6bEZjUa9PEcZXNAslCwVBrUkAljf6mE
         VAnQyW3Bt2ou7y1BSDbSdD8v+Juz/S50/jIR5ydwcfupjEGYaB9z/hpTnnDPSoCxGo+Z
         4kYCfj18Tjrck4prjBL/covxwFoLs7T0KvgxQeXsQHlRbI2onbzcYVIqWkY1BfGr8mMb
         Tkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cs33zVKATtYwBAjt3G3bc95qbW93xGE5Ve8FyegMOGc=;
        b=yIRfncYNhFJAcUOlMjsbCeryNSFWa5MUBRuVFKYXDzVKxtq1mSwH9E9lEsdxkt4h5P
         SlEEBMfOJ+8rLe6FJg8ji65Ib0ZY208fLQOx2xSE+k30JWi8t5bqrnIdErhCv5/mLXVM
         SpC+pEIuN/d7Ee3ye6dsyzlKPLERxMSniRnvcJzIsanJoItajRNDwyPCl9OZ9U0FWD4Y
         863u4gQ1E5E/gQIwwBOki5dJwAaIu1feXF4eGrBnckBqCG4rplxwyQwQSUdk/hfixDCA
         vcnPlD46qMlrSLJrhPF5nY0IGytNHqmRCx9JrY5zdvCWH/KB2dpfWiC0cwuqXB9JP+8n
         4CpQ==
X-Gm-Message-State: AOAM530FsHgub9TXH3VmfAqs3ae2rt2cUXbj1+PCrq1BgS8qPx21Y3Aj
	i0GoFRkaR38b1LQcWRLByl5lHg==
X-Google-Smtp-Source: ABdhPJxHcdPisZ0QVBxPRcgcwViFGG+sGGyzl90+8b+NWepSZzBjASl7snENZprcpjkfbpfBAfVkJw==
X-Received: by 2002:a17:907:628c:b0:6ee:70cf:d59 with SMTP id nd12-20020a170907628c00b006ee70cf0d59mr17490957ejc.402.1650438333528;
        Wed, 20 Apr 2022 00:05:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b00420119333c1sm9671152edj.62.2022.04.20.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:05:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH drivers/memory/fixes] memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
Date: Wed, 20 Apr 2022 09:05:26 +0200
Message-Id: <20220420070526.9367-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

HyperFlash devices fail to probe:

    rpc-if-hyperflash rpc-if-hyperflash: probing of hyperbus device failed

In HyperFlash or Octal-SPI Flash mode, the Transfer Data Enable bits
(SPIDE) in the Manual Mode Enable Setting Register (SMENR) are derived
from half of the transfer size, cfr. the rpcif_bits_set() helper
function.  However, rpcif_reg_{read,write}() does not take the bus size
into account, and does not double all Manual Mode Data Register access
sizes when communicating with a HyperFlash or Octal-SPI Flash device.

Fix this, and avoid the back-and-forth conversion between transfer size
and Transfer Data Enable bits, by explicitly storing the transfer size
in struct rpcif, and using that value to determine access size in
rpcif_reg_{read,write}().

Enforce that the "high" Manual Mode Read/Write Data Registers
(SM[RW]DR1) are only used for 8-byte data accesses.
While at it, forbid writing to the Manual Mode Read Data Registers,
as they are read-only.

Fixes: fff53a551db50f5e ("memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://lore.kernel.org/r/cde9bfacf704c81865f57b15d1b48a4793da4286.1649681476.git.geert+renesas@glider.be
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

One fix, on top of my previous pull-request:
memory-controller-drv-fixes-5.18

https://lore.kernel.org/all/20220407081448.113208-1-krzysztof.kozlowski@linaro.org/

 drivers/memory/renesas-rpc-if.c | 60 +++++++++++++++++++++++++--------
 include/memory/renesas-rpc-if.h |  1 +
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 2e545f473cc6..019a0822bde0 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -164,25 +164,39 @@ static const struct regmap_access_table rpcif_volatile_table = {
 
 
 /*
- * Custom accessor functions to ensure SMRDR0 and SMWDR0 are always accessed
- * with proper width. Requires SMENR_SPIDE to be correctly set before!
+ * Custom accessor functions to ensure SM[RW]DR[01] are always accessed with
+ * proper width.  Requires rpcif.xfer_size to be correctly set before!
  */
 static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct rpcif *rpc = context;
 
-	if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
-		u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
-
-		if (spide == 0x8) {
+	switch (reg) {
+	case RPCIF_SMRDR0:
+	case RPCIF_SMWDR0:
+		switch (rpc->xfer_size) {
+		case 1:
 			*val = readb(rpc->base + reg);
 			return 0;
-		} else if (spide == 0xC) {
+
+		case 2:
 			*val = readw(rpc->base + reg);
 			return 0;
-		} else if (spide != 0xF) {
+
+		case 4:
+		case 8:
+			*val = readl(rpc->base + reg);
+			return 0;
+
+		default:
 			return -EILSEQ;
 		}
+
+	case RPCIF_SMRDR1:
+	case RPCIF_SMWDR1:
+		if (rpc->xfer_size != 8)
+			return -EILSEQ;
+		break;
 	}
 
 	*val = readl(rpc->base + reg);
@@ -193,18 +207,34 @@ static int rpcif_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct rpcif *rpc = context;
 
-	if (reg == RPCIF_SMRDR0 || reg == RPCIF_SMWDR0) {
-		u32 spide = readl(rpc->base + RPCIF_SMENR) & RPCIF_SMENR_SPIDE(0xF);
-
-		if (spide == 0x8) {
+	switch (reg) {
+	case RPCIF_SMWDR0:
+		switch (rpc->xfer_size) {
+		case 1:
 			writeb(val, rpc->base + reg);
 			return 0;
-		} else if (spide == 0xC) {
+
+		case 2:
 			writew(val, rpc->base + reg);
 			return 0;
-		} else if (spide != 0xF) {
+
+		case 4:
+		case 8:
+			writel(val, rpc->base + reg);
+			return 0;
+
+		default:
 			return -EILSEQ;
 		}
+
+	case RPCIF_SMWDR1:
+		if (rpc->xfer_size != 8)
+			return -EILSEQ;
+		break;
+
+	case RPCIF_SMRDR0:
+	case RPCIF_SMRDR1:
+		return -EPERM;
 	}
 
 	writel(val, rpc->base + reg);
@@ -469,6 +499,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 
 			smenr |= RPCIF_SMENR_SPIDE(rpcif_bits_set(rpc, nbytes));
 			regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
+			rpc->xfer_size = nbytes;
 
 			memcpy(data, rpc->buffer + pos, nbytes);
 			if (nbytes == 8) {
@@ -533,6 +564,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 			regmap_write(rpc->regmap, RPCIF_SMENR, smenr);
 			regmap_write(rpc->regmap, RPCIF_SMCR,
 				     rpc->smcr | RPCIF_SMCR_SPIE);
+			rpc->xfer_size = nbytes;
 			ret = wait_msg_xfer_end(rpc);
 			if (ret)
 				goto err_out;
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 7c93f5177532..9c0ad64b8d29 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -72,6 +72,7 @@ struct rpcif {
 	enum rpcif_type type;
 	enum rpcif_data_dir dir;
 	u8 bus_size;
+	u8 xfer_size;
 	void *buffer;
 	u32 xferlen;
 	u32 smcr;
-- 
2.32.0

