Return-Path: <SRS0=D6vJ=T5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B56C433EF
	for <soc@archiver.kernel.org>; Fri, 18 Mar 2022 12:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B42DC340E8; Fri, 18 Mar 2022 12:11:38 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C3FCC340F2
	for <soc@kernel.org>; Fri, 18 Mar 2022 12:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C3FCC340F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45BD83F1A4
	for <soc@kernel.org>; Fri, 18 Mar 2022 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647605489;
	bh=lvXN32xWMwqKUxNGexSgeJG3uEGExxJ/K8H5AwYMdqU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=kqEGMtV6kkAJuSOZvgnINUJSB0RW0XzUn05VlSJ0gufn4qEtavenQbX5VCNuonizK
	 yA3cYqFQ58iV9XCBx8g3G0pWp/HrABQueM5SSih76JvZp8Eg6ZKGCh5KQu1jIvSXAR
	 0f75dN9nhtGlir3yDdNX3kQLJTTqwJEbP9W/t7LKjVomPnq9Gds/itri6Ikne6phkm
	 0Xxd2TQC0tyYSWMHMmsmxstidY5OZ2KOOQCEUFNMlKcadDbbLuCN06x18UtIfZ0/68
	 OqP8hPng3eLv6t9TqFaFOGRE0ec3ELDJLirDpyBo5n1216BTIjlvnXqc64SV7Ty8L0
	 Q5YLXQsrJNB9A==
Received: by mail-lj1-f199.google.com with SMTP id u22-20020a2eb816000000b00247e3bb7d2eso3367987ljo.5
        for <soc@kernel.org>; Fri, 18 Mar 2022 05:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lvXN32xWMwqKUxNGexSgeJG3uEGExxJ/K8H5AwYMdqU=;
        b=GU9oK/dGsxgHFjFISyDuLO191AqivLlymuDLSd91xqjZj5bpLqThuhkDWT19ZvQyTs
         fWQ3LmTECW5Qu65wduZSjFW7i39WzIh1JlbU38RvcAkDwahiZMyWdsjE9LZRAkj7HvCs
         Hqpu68UU/1hmZFJnNJVBLe2R7WfO/D3xB1BRYSaR2MQ5O+mIO2nwJLMlLD0vNC4Cwvos
         Ni1l8RgWItsGzU5gXhJqXYqJU3lMvZQ0tNHKpfcY/zalEPGVap7LGDuzNSbif8qRu6SZ
         RIYM0+w1ZMarMm4M1mQL4L9Z6miRGnA24EBrhjiEMfKbkMUprGWzLo7575ZCDwSW1syA
         Sc4w==
X-Gm-Message-State: AOAM532T7ZVybxUl9NgG+PoTRJJjIt9S5t4XeTxvC5bkx9TffwhZDUWD
	56EEnu/MCvsGOGhPPKXHpnkDI6tWULtt9+x5VTyGy4oPsYNv9sq6+NwgjwLHKabysXEg6HlRrq1
	43GT2QQBFTlvuwbGazSLtKNE=
X-Received: by 2002:a05:6512:3b95:b0:44a:1de:54df with SMTP id g21-20020a0565123b9500b0044a01de54dfmr3211549lfv.211.1647605488537;
        Fri, 18 Mar 2022 05:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWnQHUOh4+kIJLXpmMZOz6RYDvKlF9U3Ib9DEoUH8CIfpREXO3SjMF0GS+wtqHKsDbm2a3GQ==
X-Received: by 2002:a05:6512:3b95:b0:44a:1de:54df with SMTP id g21-20020a0565123b9500b0044a01de54dfmr3211534lfv.211.1647605488317;
        Fri, 18 Mar 2022 05:11:28 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z1-20020a0565120c0100b00447a7c10e4dsm827132lfu.31.2022.03.18.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 05:11:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] arm64: dts: n5x: drop invalid property and fix edac node name
Date: Fri, 18 Mar 2022 13:10:44 +0100
Message-Id: <20220318121044.108750-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel,sysmgr-syscon in EDAC/memory controller node is not a
recognized and documented property, so drop it to fix error:

  sdr_edac@f87f8000: 'intel,sysmgr-syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Align also the node name with Devicetree specification (generic, not
specific, and EDAC is purely Linux term).

Fixes: ef82c9be844f ("arm64: dts: n5x: add sdr edac support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index 50b29fa7ee01..62c66e52b656 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -26,11 +26,10 @@ memory {
 	};
 
 	soc {
-		sdram_edac: sdr_edac@f87f8000 {
+		sdram_edac: memory-controller@f87f8000 {
 			compatible = "snps,ddrc-3.80a";
 			reg = <0xf87f8000 0x400>;
 			interrupts = <0 175 4>;
-			intel,sysmgr-syscon = <&sysmgr 0xb8>;
 			status = "okay";
 		};
 	};
-- 
2.32.0

