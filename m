Return-Path: <SRS0=stlG=PK=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D42AC433F5
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 14:11:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 453C261251; Fri, 22 Oct 2021 14:11:59 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 162E56124D
	for <soc@kernel.org>; Fri, 22 Oct 2021 14:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 162E56124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id z126so5130325oiz.12
        for <soc@kernel.org>; Fri, 22 Oct 2021 07:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fntq8tUMlB+L0yN28C+/8oiQ/tqnhvbVaVy+XCHM97M=;
        b=Ktqd6WHaF9e3c1mJnBgMqvqqElQKfV9eWJksZnH/0CI2sA1BcBwpcjp+l9qdEuojtm
         UgZIz66QkW5sKkgH7qujK2OdqIsWULYpd25d8zk8tW/WDPnAvZ2y9NiFWqg2QrnECyY+
         DUQQNcmUwV1y3lC/EPh1WQSjpPdSVVLl+0FezOP78NIWgSh5soASUVxU2KyF+ZmvQEpK
         seBeyv7gabK2iQFTEunxlJqNYuqvDMopyIWaFVo5gxqz7ZF2ABUlsH9DGBvR7RYc5Fz+
         ubOUytvAmBSyaINFTSR6e+Jv4xq/48XH/dmHL6AwW2iKki1y5GBQVmuiDWMOGRt18ORK
         CwrA==
X-Gm-Message-State: AOAM5320n1uyFd6Hyg58S8O1MThI1RLW+XieqPI8T88Rv8Ey892gQqPe
	gbC/XWju0Y34pGRJXTSfqZe2Vlg13A==
X-Google-Smtp-Source: ABdhPJwQ2dCgcSgOjl+llkhisJut4OFc60/Z9ZVdZK9ftiZjWbJd0kP0dC9thm618B3k/7CcA122Eg==
X-Received: by 2002:a05:6808:1287:: with SMTP id a7mr10108534oiw.45.1634911917877;
        Fri, 22 Oct 2021 07:11:57 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id a15sm2037958oiw.53.2021.10.22.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 07:11:57 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI nodes
Date: Fri, 22 Oct 2021 09:11:56 -0500
Message-Id: <20211022141156.2592221-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spear13xx PCI 'interrupt-map' property is not parse-able.
'#interrupt-cells' is missing and there are 3 #address-cells. Based on the
driver, the only supported interrupt is for MSI. Therefore, 'interrupt-map'
is not needed.

Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---

Arnd, Olof, Please apply.

 arch/arm/boot/dts/spear1310.dtsi | 6 ------
 arch/arm/boot/dts/spear1340.dtsi | 2 --
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
index c4b49baf9804..2f746a9428a7 100644
--- a/arch/arm/boot/dts/spear1310.dtsi
+++ b/arch/arm/boot/dts/spear1310.dtsi
@@ -82,8 +82,6 @@ pcie0: pcie@b1000000 {
 			reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 68 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 68 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy0 1>;
 			phy-names = "pcie-phy";
@@ -101,8 +99,6 @@ pcie1: pcie@b1800000 {
 			reg = <0xb1800000 0x4000>, <0x90000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 69 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 69 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy1 1>;
 			phy-names = "pcie-phy";
@@ -120,8 +116,6 @@ pcie2: pcie@b4000000 {
 			reg = <0xb4000000 0x4000>, <0xc0000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 70 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 70 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy2 1>;
 			phy-names = "pcie-phy";
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index 1a8f5e8b10e3..827e887afbda 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -47,8 +47,6 @@ pcie0: pcie@b1000000 {
 			reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 68 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 68 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy0 1>;
 			phy-names = "pcie-phy";
-- 
2.32.0

