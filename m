Return-Path: <SRS0=AqXq=PS=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9916DC3DA4A
	for <soc@archiver.kernel.org>; Mon, 19 Aug 2024 03:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A0DEC32782; Mon, 19 Aug 2024 03:57:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8538EC4AF10;
	Mon, 19 Aug 2024 03:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8538EC4AF10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201f2b7fe0dso23908305ad.1;
        Sun, 18 Aug 2024 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724039819; x=1724644619; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMxiBVm1dCy/VMbf3k3ryTxM8vkKELICEPudxbPC0sY=;
        b=bLGdpNJMT/TwwQ2dw/JDOTZzkapJM3b07Nv0UPoXT8OWMaZZCB6dejgBZs8bNizNsG
         EnldzkHWP/AW+62sElVxxpAVwYpBk6JH5LqSWyPUhskUzGNR/4H9xZ6FNn9NdELZkXZ5
         FDMdGG8BqReqWvcEkE/E5fBHA+g+GTeoo4M2pPfPprCbDNOXhx0WH28t05tGswKVz5CJ
         zXPMREHMp8V8y4v3Akbza/vLu6wHd2oMB8I5Ic4uwQOE3oyWTUAfK/dQUllOG7S+Psl+
         lzYIfPaolM2fumVpvN9qxML+e8inOquk4JYdHLP0H+CWqAQU3S3Z4736hI8eP9EDjE2n
         nfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724039819; x=1724644619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMxiBVm1dCy/VMbf3k3ryTxM8vkKELICEPudxbPC0sY=;
        b=PFgo8D37+HQLfwYEtgCoeriBoywO6prd6uGV9iBgdI5C236fLnFyxQPvKjEsQQpqKh
         Ho7MzkL3xn394T6/C4gaIew99XM4HZILtmutN13gjuGkMGeqhYL5ExFFt4I//WWYjeil
         CfRk1avr36sbJzeOrJjheyjL7+AoMAgy5GBPssIXT4ROhjmNr9Eyaz1+LJjPFQvlssW5
         e7Ny8bPEjYh02zLKRrOlGW+vfhTj6NxffLe039Hn0tnz1hcfw9byYHCe4hABzQ5sW8kC
         BDUDbrg6+doie2tbLki+O6WFW5v7vm1+ghQRMI7AviSUqoIC+/iMZpequfxDhGbJeFIl
         vRgw==
X-Forwarded-Encrypted: i=1; AJvYcCU1brGu84WoglHOPAfdHDyh3OQ11wzdST9+oTp0+7Jc4j555HJBiSAcoZiQICdhB3KSMGSz7HPUje+9Kq3B1z3V+saFFflibEfyPh5S0A2WmVM+/3Zf0w2DhICoQ3GOhNLK0dh+nI4Q
X-Gm-Message-State: AOJu0YwLWsw7+8RZZQOyFmU/M5rdUH6bswSj/VqtGxZ86344RC1L05me
	otEGRXGoiy9IbYwpKJl/RTsN6Il3bIrbvb2V39nWklC6OIA8A5AgEjgcng==
X-Google-Smtp-Source: AGHT+IEtQA3Sp2nVh0hsGcQt+DqddhpLy0t+34/lJMSE8+lE689mWVXGMwN6DWTsoCCP0VOnd/l4lw==
X-Received: by 2002:a17:902:db07:b0:202:4724:b700 with SMTP id d9443c01a7336-2024724b8d6mr16176115ad.58.1724039818753;
        Sun, 18 Aug 2024 20:56:58 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375649sm55784435ad.124.2024.08.18.20.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 20:56:58 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com
Subject: [PATCH 3/3] arm64: dts: nuvoton: ma35d1: Add uart pinctrl settings
Date: Mon, 19 Aug 2024 03:56:47 +0000
Message-Id: <20240819035647.306-4-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819035647.306-1-ychuang570808@gmail.com>
References: <20240819035647.306-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Enable all UART nodes presented on som and iot boards, and add pinctrl
function settings to these nodes.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 80 +++++++++++++++++-
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 83 ++++++++++++++++++-
 2 files changed, 155 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index b89e2be6abae..9482bec1aa57 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -14,6 +14,10 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial10 = &uart10;
+		serial12 = &uart12;
+		serial13 = &uart13;
+		serial14 = &uart14;
 	};
 
 	chosen {
@@ -33,10 +37,6 @@ clk_hxt: clock-hxt {
 	};
 };
 
-&uart0 {
-	status = "okay";
-};
-
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -54,3 +54,75 @@ &clk {
 			   "integer",
 			   "integer";
 };
+
+&pinctrl {
+	uart-grp {
+		pinctrl_uart0: uart0-pins {
+			nuvoton,pins = <4 14 1>,
+				       <4 15 1>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart10: uart10-pins {
+			nuvoton,pins = <7 4 2>,
+				       <7 5 2>,
+				       <7 6 2>,
+				       <7 7 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart12: uart12-pins {
+			nuvoton,pins = <2 13 2>,
+				       <2 14 2>,
+				       <2 15 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart13: uart13-pins {
+			nuvoton,pins = <7 12 3>,
+				       <7 13 3>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart14: uart14-pins {
+			nuvoton,pins = <7 14 2>,
+				       <7 15 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0>;
+	status = "okay";
+};
+
+&uart10 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart10>;
+	status = "okay";
+};
+
+&uart12 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart12>;
+	status = "okay";
+};
+
+&uart13 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart13>;
+	status = "okay";
+};
+
+&uart14 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart14>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a1ebddecb7f8..f6f20a17e501 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -14,6 +14,10 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial11 = &uart11;
+		serial12 = &uart12;
+		serial14 = &uart14;
+		serial16 = &uart16;
 	};
 
 	chosen {
@@ -33,10 +37,6 @@ clk_hxt: clock-hxt {
 	};
 };
 
-&uart0 {
-	status = "okay";
-};
-
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -54,3 +54,78 @@ &clk {
 			   "integer",
 			   "integer";
 };
+
+&pinctrl {
+	uart-grp {
+		pinctrl_uart0: uart0-pins {
+			nuvoton,pins = <4 14 1>,
+				       <4 15 1>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart11: uart11-pins {
+			nuvoton,pins = <11 0 2>,
+				       <11 1 2>,
+				       <11 2 2>,
+				       <11 3 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart12: uart12-pins {
+			nuvoton,pins = <8 1 2>,
+				       <8 2 2>,
+				       <8 3 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart14: uart14-pins {
+			nuvoton,pins = <8 5 2>,
+				       <8 6 2>,
+				       <8 7 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+
+		pinctrl_uart16: uart16-pins {
+			nuvoton,pins = <10 0 2>,
+				       <10 1 2>,
+				       <10 2 2>,
+				       <10 3 2>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0>;
+	status = "okay";
+};
+
+&uart11 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart11>;
+	status = "okay";
+};
+
+&uart12 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart12>;
+	status = "okay";
+};
+
+&uart14 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart14>;
+	status = "okay";
+};
+
+&uart16 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart16>;
+	status = "okay";
+};
-- 
2.34.1

