Return-Path: <SRS0=xfBl=ST=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A037CC433EF
	for <soc@archiver.kernel.org>; Fri,  4 Feb 2022 00:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6338DC340ED; Fri,  4 Feb 2022 00:41:31 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8C9FC340E8;
	Fri,  4 Feb 2022 00:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8C9FC340E8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id u13so6715088oie.5;
        Thu, 03 Feb 2022 16:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wnlQbhSLT+4EwhstgLphHjdPL3CXj12i6ppAfBqkb00=;
        b=PdxOf97qty/i1usK9iH4n57ikTky5A1lFzTeXPjwJzQ/tCE8MezIis06aMCGdP5DzX
         V2YgDmqRerw3n3zOpnbXqLjQCtyaikgkzMI1XJBpAS4s4V/z2aMrDZf6wFEkusxgGD4a
         XNGY28gWOksmZOO5R+EwjsExUO6abV5R89U3pMolkxkkR5GD9JVVAalMX1jM8JL+mTDR
         0WwKJMvaH0+Toeyb774rYyuww9Drzbr8xVn0eSgbda2gLGFJxCftmaTgl5GPR/nmIpS4
         MpjBYdNF0dR4d0CLABxxQ801z4CEASpRMhY+oHRDgSiSE0ASsuhAxCK3VAE9xV7bv0wd
         6YvA==
X-Gm-Message-State: AOAM532O3oTbDKmkMlam/lTYUwd5dwuNCWUAk7bsvxKkcDUTHd28ECzk
	AXL0ZKsp7KySbh5zqIE9hTNKTvIytA==
X-Google-Smtp-Source: ABdhPJwUZXdId4Wd3puhdPQHF0a2f6V7XUsKQO2PdEFSWC2bV1KWhm0eTLF7chOjaa6sHpywhu+slg==
X-Received: by 2002:a05:6808:2228:: with SMTP id bd40mr133025oib.335.1643935289747;
        Thu, 03 Feb 2022 16:41:29 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id g34sm153071ooi.48.2022.02.03.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 16:41:28 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: spear320: Drop unused and undocumented 'irq-over-gpio' property
Date: Thu,  3 Feb 2022 18:41:17 -0600
Message-Id: <20220204004117.1232902-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property 'irq-over-gpio' is both unused and undocumented. It also
happens to collide with standard *-gpio properties. As it is not needed,
drop it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/spear320-hmi.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear320-hmi.dts b/arch/arm/boot/dts/spear320-hmi.dts
index 367ba48aac3e..b587e4ec11e5 100644
--- a/arch/arm/boot/dts/spear320-hmi.dts
+++ b/arch/arm/boot/dts/spear320-hmi.dts
@@ -235,7 +235,6 @@ stmpe811@41 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <0x41>;
-					irq-over-gpio;
 					irq-gpios = <&gpiopinctrl 29 0x4>;
 					id = <0>;
 					blocks = <0x5>;
-- 
2.32.0

