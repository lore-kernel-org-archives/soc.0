Return-Path: <SRS0=UXL6=TW=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C207AC433FE
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 09:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC71FC340EC; Fri, 11 Mar 2022 09:38:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 113DEC340E9;
	Fri, 11 Mar 2022 09:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 113DEC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id v1-20020a17090a088100b001bf25f97c6eso8436341pjc.0;
        Fri, 11 Mar 2022 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+sti7R5r7TlUzIhwq2afJWAsp4Iedj4R4baq+ryUh2g=;
        b=UPsLXqoS5RBH3+XHcocj3dT6VT/oGbCNu4zvXSVjMWOQiIW4Zv17pEQjwbEJSmuHKq
         nwt/rKa9jWswtdLbCpD7380vcsbGTynIJOI+EJOU1h24OKwK9TOjMpg9t2KCq89gkedX
         rrzz28GkgRUXbJ8yI9rda/V2EE7WzDjn74gJiwec3XUzXqWu84Tv355++8yxsjlK8OCr
         slB+drV0Yvrnt1rRSJOGrEFj/+gHKsH53kXryJxw9tB1AIbdUcpyjUv0Z9hkhy0DOKEd
         5pv8Y9K17lZ4i1+xAmlhZruknJN1k+vaMTTA0LNYp6VuZm+Ut3GT05DuXjkEdPPJjUZu
         sMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+sti7R5r7TlUzIhwq2afJWAsp4Iedj4R4baq+ryUh2g=;
        b=WW74RCCyfYpzcpYGmP5UmPFbqjMUAI6V9ebuLN46Uvt0iOKsLZ/4embyx4pd/aEJM9
         0joa4BYP5tuiT+1K/nHsEzIKEqK43yQ8SG82F+erEXUlaMeAkjN8oxlUO7n6igomT5B4
         Q/+9OYJi0UFJfWq5Kn7PxCkFRnd3e2D7wZH97lT3Wufu81UJMfu55xd+IWd7oNYLyTvP
         sud2f2XenGx3k8MXQeXDEf8Du1zmPEvYaqq9lgvT4HCSA8hqYEHpqRtjakpIjqUZ1EGa
         APdBoBKCtdVWj4DJ9r0N4RAXsH7q8Fd9cVoi8Hz8TfZU1QAEs63EutPTtrhitDEb0H0m
         NWsA==
X-Gm-Message-State: AOAM533BV4/kGoDdru+HOFsEeIUfr3ZqNCbTG8ikVvptiljcJxECy1mD
	kEm/jQB4R7NNABRjEdlYd8o=
X-Google-Smtp-Source: ABdhPJzYRJlhVYjsiUbgyuUOuHb8yYvjyX5Y3NPJ7anc1+dPGbWZPcJPM2mEEqB5bo8jjieTu90yqg==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id oo6-20020a17090b1c8600b001bf2a7e5c75mr9954721pjb.145.1646991489547;
        Fri, 11 Mar 2022 01:38:09 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id m11-20020a056a00080b00b004f75d5f9b5csm9011011pfk.26.2022.03.11.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 01:38:09 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Brijesh Singh <brijeshkumar.singh@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] arm64: dts: seattle: Update spi clock properties
Date: Fri, 11 Mar 2022 15:07:58 +0530
Message-Id: <20220311093800.18778-2-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
References: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PL022 binding require two clocks to be defined but AMD seattle platform
does't comply with binding and define only one clock i.e apb_pclk.

Update spi clocks and clocks-names property by adding appropriate clock
reference to make it compliant with bindings.

CC: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
- Resend to soc ML
- Add Rob's acked-by tag

 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index b664e7af74eb..2aa21d98d560 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -113,8 +113,8 @@ spi0: spi@e1020000 {
 			reg = <0 0xe1020000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 330 4>;
-			clocks = <&uartspiclk_100mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&uartspiclk_100mhz>, <&uartspiclk_100mhz>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 
 		spi1: spi@e1030000 {
@@ -123,8 +123,8 @@ spi1: spi@e1030000 {
 			reg = <0 0xe1030000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 329 4>;
-			clocks = <&uartspiclk_100mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&uartspiclk_100mhz>, <&uartspiclk_100mhz>;
+			clock-names = "sspclk", "apb_pclk";
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.25.1

