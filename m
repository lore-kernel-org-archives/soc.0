Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D5CC433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67EEDC385B8; Thu, 26 May 2022 20:46:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4293C385A9
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4293C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id er5so3144632edb.12
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsaZBsRuA05EIUREKaT6uWWUf8NwbjqVqV7AE7nTWuU=;
        b=BcG3GQbgtgUVWKJIL9pS1cl+PhYjFfOPC3ea6JJLYZLasXxxf9YqHtdfnk1vHgt9oN
         dXkvNfUzTUjdbG5iaHDtbTC7BOXBhpgZGZLuQYQozmdemKYFeNYmWVs+jzCkr5gijPP9
         pu8Vm3V/GmE1WfBcJJ4K1THJt2HVlLxGc41kND9G1ajNnuFoDVl9M3laiooEZSSPXfSC
         1vqO/Md++rL0A843euiuhBLUTx0Eh1Zq1S7xhD6oP2GUCNnlSTabYcCO6LGpwpKNZu/Q
         RVSVLzlGU3w5jbqpESra4VVecnEIAJ3IRnKwqcyjmtbK7nwf1DUA2Av/Z8mXY5Mab+lW
         e/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsaZBsRuA05EIUREKaT6uWWUf8NwbjqVqV7AE7nTWuU=;
        b=0i3BduBVvrKBsC0+x4VarlvN44XTNXus7VcPdnO+J2tWpPSJfGm/ZtWdbqNjxRxWR9
         ++olf3i8rzsl72Rxtc+vLFGU2Qnupgap+t9LUT8ll+Lw23l2qrrG3O5q5TBx2LOWGcUa
         OZDqNYwjKdMdlJUXEISqGlAa77JXMdL1rKQcJVN4fQI9+5+w+caJU1JIxX5PcGadlE8U
         6UHNaQKvQkfsxnDdad74l20s8tvgNKxeNoH26fPlWk7cZOZBcqzVUUxz3z1I51SPIZum
         TjZgZ4CiTuget9bELP+dUeynAy95nf/OB8GNcOrpMNyrLSXS6bwah12qE9r7Go48/dkc
         Y34A==
X-Gm-Message-State: AOAM533Y7doPtHNAbB6jJZWWrEWeCK4mbEgfv+XrdywEjgSezRHgQxEh
	fn1yKENiDuG5uIulV8atqLXRtA==
X-Google-Smtp-Source: ABdhPJxf+t6ex1yqGxjrKm3rgwAVyW6+45X+S9LTTOg/92RQBOuHNHx7ZIFz79bhaTqMDzO/AluRJA==
X-Received: by 2002:a05:6402:2071:b0:42b:dfa4:d4e1 with SMTP id bd17-20020a056402207100b0042bdfa4d4e1mr3714379edb.70.1653597971094;
        Thu, 26 May 2022 13:46:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gc21-20020a1709072b1500b006ff16f48e2asm813254ejc.76.2022.05.26.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:46:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: altera: adjust whitespace around '='
Date: Thu, 26 May 2022 22:46:02 +0200
Message-Id: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index aa2bba75265f..db771690641b 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -594,7 +594,7 @@ emac0-tx-ecc@ff8c0400 {
 		};
 
 		qspi: spi@ff8d2000 {
-			compatible =  "intel,socfpga-qspi", "cdns,qspi-nor";
+			compatible = "intel,socfpga-qspi", "cdns,qspi-nor";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xff8d2000 0x100>,
-- 
2.34.1

