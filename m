Return-Path: <SRS0=n/Pu=63=gmail.com=tomato1220@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8552DC64EC4
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 06:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F8FDC433EF; Fri,  3 Mar 2023 06:37:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 988EDC433D2;
	Fri,  3 Mar 2023 06:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 988EDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso5151571pjr.5;
        Thu, 02 Mar 2023 22:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4P2Gtj5voz2AvXPNtKglz66q8024rYl9baxTyNpUVU=;
        b=I58DVR3ZkpufsMpFPu8HBJQSctYJDzdZYy2bPl6NpVdhXfkp556X4bYC3xYQQma672
         OX5CXQ54v+ddd2mzH9wJp1tr5e0u+6N4lLITeFM2H37rbrPK7nBWQSdGUbq8FPGm84KU
         k98DJ7ENPfkGicXSu3c99luYIe/eyQ97WLOCpRY8LZZ1yfhm8bZj7g2fUZ+sDrBf1rMB
         QUQzJWaqEKgNjuGfjxexXNg2MqThnjUI1+I63yHOTvCN4T35AUuJNVtsDwb/qejYdAEJ
         t3B4GzrIGNrSaYBWuDhw+wdGO6xeUHEuguYF0h12i4T6AFj+csMf/rRssQ3SCKIuuBUg
         LHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4P2Gtj5voz2AvXPNtKglz66q8024rYl9baxTyNpUVU=;
        b=nhEKSSDuUavUiLmd2FhFLxJiTFlaYFWvRR9IRnixMytzYQ1PRHEKz6kSZJvIBjRNX3
         /p+scUtwvaGy8q7lKTSrKEMFSrUXx8nwXl5/hUIITMv3WgIJgN8RI6QYGwbaysIW+LzO
         lvD684OoNlrO7+u38am6a5Qtgy/iWMtueKxllL/d+iGSWc7O6vrdopz0JhGagv+km4ZZ
         NHSlVmOJcq+L/HAgABGCacVhNOvr0jqEp1BtBZVytoA9f4VZEK5VYrLSdRR03lCgncDV
         SKTy7M+IixNCkJeAlSeqGaUDCEw05usF7RaQ5LGYE/4B7mHXH5XUakO2b1Tgve+PlbOB
         Hvnw==
X-Gm-Message-State: AO0yUKUUIkgKHBZpJsvu7L9w7gR5zuMSxYGfI2/2OjbDzR1JRrlJOiMn
	dM5nIHLureJnbB1ON1AJNAw=
X-Google-Smtp-Source: AK7set9SihwApQZyw9Nh5YizzXYCQiwk6r3kApgwNF1x1wistEFc3Fk429ZCAu01fQxVRaueOScvGw==
X-Received: by 2002:a05:6a20:7883:b0:cc:8a62:d0da with SMTP id d3-20020a056a20788300b000cc8a62d0damr987051pzg.12.1677825426931;
        Thu, 02 Mar 2023 22:37:06 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:06 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com,
	David Wang <davidwang@quantatw.com>
Subject: [PATCH 7/7] ARM: dts: nuvoton: gsj: Remove ethernet aliases
Date: Fri,  3 Mar 2023 14:34:35 +0800
Message-Id: <20230303063435.803097-7-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alias "ethernet" in dts conflicted with systemd v252 naming rules and
caused a rename. Remove the aliases to avoid renaming.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 48110f8aa3ca..2b3e0af5b928 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -12,7 +12,6 @@ / {
 	compatible = "nuvoton,npcm750";
 
 	aliases {
-		ethernet1 = &gmac0;
 		serial3 = &serial3;
 		udc9 = &udc9;
 		i2c1 = &i2c1;
-- 
2.25.1

