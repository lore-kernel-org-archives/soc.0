Return-Path: <SRS0=Z+3y=ZW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B456AECAAD3
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 09:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75E69C433D7; Mon, 19 Sep 2022 09:26:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB5D3C433D6
	for <soc@kernel.org>; Mon, 19 Sep 2022 09:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB5D3C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id a3so33928928lfk.9
        for <soc@kernel.org>; Mon, 19 Sep 2022 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jY+Ll13EtSRSZqnmg84nXEpRI5JPJFL45ThtkhHD7KI=;
        b=iPQXCgVBFXLvMxnb88A4Y4RN5PzkIam2LLZcTdRInoXsFgMvIObqNBroT5awBiVcie
         O+6QZAHwTU3Vobun0dFUoyqIFjwOEFSSRPWRQuKLQ3dMRxDJ5mkhoGQDVUpFKN73wXlz
         Ewh0gLZ2/fgNEOVMVMCihScz9/kCxWfRQ4YP0ivCwwQQhB97xMIE+17+09a6zC4VhI9U
         V7mtNW8OKatFR0FnNZfmD9mrU2Jhad6EBQRJ8I33ttkvrdOzL/No7GtN3L1E2FNDHBxL
         2WlP8c8WhlPHe6ksnOZg47vq2OgM+jHEXxSMgR5UzBfNwmS63X8i7C/sgTz3KDGOoqGv
         2c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jY+Ll13EtSRSZqnmg84nXEpRI5JPJFL45ThtkhHD7KI=;
        b=GyJLSJtV8dc7TC1vCqk0Xq1FeffqI+69qmNB0BdJft9nop3YNqLyIJpOhO1ZB4kdNm
         kmEe0PQM21pkGBDF6q9g0mznoS1cJoXYgnqJIGLJho1PhatYKKTw4DzyzoNiePAgq2be
         47D0f3rTrkaAs4p2Xz7M86qPQeRg4vAepewAWmLkgNL1/RzBK8drSWwGVDQ5Aw6CV0Nz
         ZIg9pGUtac7+eTZZVRl763W57c7z1iiOxyYXGtH2MV/QQ9Z63Z6d2zatCOuCB2GAaXjL
         gi2TITSb8GR5l4enma6FzdiXuBjBf2AlFLIlAH+BnyB5xReN9cyYPdZWogoy+87wZn69
         1swQ==
X-Gm-Message-State: ACrzQf2fF9K2wjfRrdmADZgUPPoblp0rizlWkGI87sSzIvStzcXOAtJz
	/O8Hu1OkwqlqEH1pIe6vIz2gGA==
X-Google-Smtp-Source: AMsMyM5MJF/RfYu/oQl/cdxpkdj09uQXUbkrbUPkQ8D7A7YH66uz6kxyHI2Xt1ZWdna8RAWRIJ5kbQ==
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id i3-20020a056512340300b0048c972750b0mr5623241lfr.309.1663579572956;
        Mon, 19 Sep 2022 02:26:12 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o20-20020ac24bd4000000b0049c29292250sm3829456lfq.149.2022.09.19.02.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 02:26:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: integrator: Tag PCI host with device_type
Date: Mon, 19 Sep 2022 11:26:08 +0200
Message-Id: <20220919092608.813511-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT parser is dependent on the PCI device being tagged as
device_type = "pci" in order to parse memory ranges properly.
Fix this up.

Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this directly for fixes.
---
 arch/arm/boot/dts/integratorap.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index 9b652cc27b14..c983435ed492 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -160,6 +160,7 @@ pic: pic@14000000 {
 
 	pci: pciv3@62000000 {
 		compatible = "arm,integrator-ap-pci", "v3,v360epc-pci";
+		device_type = "pci";
 		#interrupt-cells = <1>;
 		#size-cells = <2>;
 		#address-cells = <3>;
-- 
2.37.3

