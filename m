Return-Path: <SRS0=2E+3=6D=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A8C636D3
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 17:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C275C4339E; Tue,  7 Feb 2023 17:31:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49FA9C433D2
	for <soc@kernel.org>; Tue,  7 Feb 2023 17:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49FA9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so3425124wmb.5
        for <soc@kernel.org>; Tue, 07 Feb 2023 09:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bi/yAyDRu2WocGb5+/KUmFIlOY4z/VJN19MnKHFYIsM=;
        b=tty0Ud1PEu+PkLC0FWcRx6/RYluys9bJ5tT9WLBbv5439KCf0UH6GIvvtf+a2c5Lff
         f6s34Q0Q6/h63ap/myN4nPnKGJW6B3dPfBGqDp36g785LuVHMH+yPbISYzKQ8KFn3avH
         Y0V4oECf1i47qer586ORoHii/qS6DVOArVi2Vjw0U+fLhmJcfiuCUTyZQpxvtAnxvRsH
         vf5lA4TfXZRtUFsLvQ1PNz3/YQ2vbq+OPU5c2MIKK8TdwdguEWpFB2+5lRRutb9EI2Ik
         0Qr4gNqUt9slxyWxps/F2bXQqQV2ZWpXwC4hPC9nLQgFF8PPaQy84FSTDXTtXQaW4Lyj
         C6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi/yAyDRu2WocGb5+/KUmFIlOY4z/VJN19MnKHFYIsM=;
        b=HyTjJFpd7Jr8f6OcLtwmHWvs/JJnh9Aptd2ZKvfQa+uPvfG8RoOGL/5RKaMJTnSCxh
         TmeONRy8eOcZjoWGbt3v6xcZ4vwmlIQMUz57bXaJBzWl5gyQ0cklQsK8xHtji7YtHIKx
         ttJRYbEZCgKUjjAwHkEHpN2I44rJsN3lbTGOXmfIHQBi43B1t8whcPasEDiwbmBInaTS
         c94c2J7BiZuad/MeBLeLGbXUDId9fH9OsTBU2AbroMmWgsrQbB1Zl2qNuOVJoq7/3mpK
         LZ5eLKQhYjX7jNoYSQ3MiFXYDa3ARGHYDxqPaj0vLEqgnvlL2BzbW985voOUxxsiQB8U
         yE1Q==
X-Gm-Message-State: AO0yUKUzQVhDF/iNzz7wEfG3G5Kma920f9hWhSg55kUlvc0an9B+yNbY
	kXP0vnIJmFuHje4QkyNBTWxpSw==
X-Google-Smtp-Source: AK7set9QM6Kq6OeQkUxzYPb3W3KCAmy63ZcY1fsOaY5ETdZArpPANUZqLWtBja2jOT/nHrW0NyIrDQ==
X-Received: by 2002:a05:600c:3513:b0:3dc:c5c:b94f with SMTP id h19-20020a05600c351300b003dc0c5cb94fmr3748458wmq.39.1675791058542;
        Tue, 07 Feb 2023 09:30:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm2826547wms.1.2023.02.07.09.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 09:30:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] memory: renesas-rpc-if: Remove redundant division of dummy
Date: Tue,  7 Feb 2023 18:30:51 +0100
Message-Id: <20230207173051.449151-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

The dummy cycles value was wrongly calculated if dummy.buswidth > 1,
which affects QSPI, OSPI, HyperFlash on various SoCs. We're lucky in
Single SPI case since its dummy.buswidth equals to 1, so the result of
the division is unchanged

This issue can be reproduced using something like the following commands
A. QSPI mode: Mount device with jffs2 format
    jffs2: CLEANMARKER node found at 0x00000004, not first node in block (0x00000000)

B. QSPI mode: Write data to mtd10, where mtd10 is a parition on SPI Flash
storage, defined properly in a device tree

[Correct fragment, read from SPI Flash]

  root@v3x:~# echo "hello" > /dev/mtd10
  root@v3x:~# hexdump -C -n100 /dev/mtd10
  00000000  68 65 6c 6c 6f 0a ff ff  ff ff ff ff ff ff ff ff  |hello...........|
  00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|

[Incorrect read of the same fragment: see the difference at offsets 0-3]

  root@v3x:~# echo "hello" > /dev/mtd10
  root@v3x:~# hexdump -C -n100 /dev/mtd10
  00000000  00 00 00 00 68 65 6c 6c  6f 0a ff ff ff ff ff ff  |....hello.......|
  00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|

As seen from the result, 4 NULL bytes were inserted before the test data.
Wrong calculation in rpcif_prepare() led to miss of some dummy cycle. A
division by bus width is redundant because it had been performed already
in spi-rpc-if.c::rpcif_spi_mem_prepare()

Fix this by removing the redundant division.

Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://lore.kernel.org/r/20230112090655.43367-1-wsa+renesas@sang-engineering.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

One patch for memory-controllers drivers on top of previous pull.

 drivers/memory/renesas-rpc-if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 62b06041d758..025bb628aaf3 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -435,8 +435,7 @@ void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 
 	if (op->dummy.buswidth) {
 		rpc->enable |= RPCIF_SMENR_DME;
-		rpc->dummy = RPCIF_SMDMCR_DMCYC(op->dummy.ncycles /
-						op->dummy.buswidth);
+		rpc->dummy = RPCIF_SMDMCR_DMCYC(op->dummy.ncycles);
 	}
 
 	if (op->option.buswidth) {
-- 
2.34.1

