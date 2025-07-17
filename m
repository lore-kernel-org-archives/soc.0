Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92312F85DA
	for <soc@lists.linux.dev>; Thu, 17 Jul 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762173; cv=none; b=FrEUOd133jg2PVl8zFObay71uL+UGuu/ErhTLAhyiffgTmTb4rBFhRd1McRtVgbORQiuGvJs5NGK8UE50XBIa19iJ+3FT/vcDJd1F8nubUPDps07dnXHsRYFcIS7nzsV0b5nf4c2sm0k5e0dZRAhIt7Ln3Dx7KS+AeglIjOgZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762173; c=relaxed/simple;
	bh=uujvZIEacMR4RmI0viShcrE6nyskrRbnFlw1trpWzkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcsdCYXanPUMtmqAMUA2U1dxYB2OqGSRMf8lMHBormEMyua5TJsZLHP6LwA1vRokckpdUB/57HPe+MXkxcanGNkoYdz1QXv6oCD28rR8Kd2SgvCr6yKal/rggEy++hPjJ+8R9pCReqC4K/zyneActuyNtJNX5fDSxSjf3Xv1EOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XK9cJl59; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XK9cJl59"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3a4b3fa38so19369066b.1
        for <soc@lists.linux.dev>; Thu, 17 Jul 2025 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762170; x=1753366970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUMs6u1zn9GnSxixdQQj+KqICw4gE2MY7effcI0/DiY=;
        b=XK9cJl59QhP7wW48FRzJpj6dtWdIAVRqYsqo1s6I0WvnJi1BnopqcvzDjgINNbUozL
         JMhJHDfWag8bRa6UR8bpETKGImwvvjiDx3eeJIAUkrJ8alH5+3K5euaR1EYBgeAGApF+
         j2QKUp9gyW21o9JFOGDqsntHk1ms+qH29oHkju1uSuY9oegJtoHHulLp2S+E9EYcFPFx
         lneHvPCk6miJvuUC1yKpl2TGah4XfADNIqr+a/h07wSOsB1diIZ3FQw7WvNq+Zyd+V8e
         ibvowspLNFOSEVn824Jsec16uNUM325UgqsY+4CstEPNou2qFiaxmuwSfKpa10qtyToD
         l9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762170; x=1753366970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUMs6u1zn9GnSxixdQQj+KqICw4gE2MY7effcI0/DiY=;
        b=J926b7Lqja7zPgvf316DFt+EtS/s7AcBe0yt+Ip4uxImULRvbq1r0tw+yyCyqJTXYz
         3R3MbKrgf4UOeNgqL4PMll/DmdLWGZ3mwji/rKN/vhKkb4g8w9UgKEC3QOMZdkJl8aSV
         12bwK8kKGU8bCHV62ABCHP4kByIw14+zOMlkTNd+hVBiuJvGFiOa3m0HSfP2Pz6PV6RE
         /501pVaikIDNWToger2cA0F4bxW+wv0al/iwi42D1B6gP7zDEGxAcX5V+qsPf9XDIBHp
         KcvGoWfavV/1JXpykbnwVqARv8wq0bA8k2lFlXOYBmb7J9k+J7RRXPHEqgm4uZ1KyHgs
         ISmg==
X-Forwarded-Encrypted: i=1; AJvYcCXi84H5SsYu662bH0aRr1kOVScSN4py4ZkCDGh31hJPpQ8oZf0/2+ETGuvFYItQcyEFka4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi3IwX+fzfS2PyLD1boYo1+E4wIvO4uGeERggrb4KqSW1W1IWU
	mrhVQ5WEI8WUuGXXZU7UPLuB6JwpwBWj0OiRxhtpKTbpEYXnWu130Zkuhs1n4ymuLU4=
X-Gm-Gg: ASbGncvmhu6y7WH1NsqJzubE/vCRjFBUV/MmxgM3isATgzf5qx3TXpWYvH/UgKQcDlp
	M55hCKoec0stcZZXng/4EYUDXsMoxFP7gmpdvu01y+yxXTjcXds2j9vaAFGW9x5nqBHjTOhVaNT
	TJYl57CXRUkXL+juNlXeiyYYrcuk0TdJIE9kh0oaksJwVYrsQYEq6KjBgVyqT+kz5ZTkJiIzB1D
	B3a4EeTg99ni5WWOHi9AWUBxZfuTHBPiY7kIOFCWTtuwNed4kaKs1+1zqmZq0aR9SEvZQax3Qgb
	lRjUyiuixzpUjxZyx0NEp9jaB9bmZfOZLopIQBRZX99m+XRi5tKSc1gzBFMTvHSDTqO6ulhsAUq
	eR6YUmXcOkkHfykZUXBxj3BBosaDz/osHOIZCg3uVUGo=
X-Google-Smtp-Source: AGHT+IFZX9BGgT9x3QocepLQl5WhOnUhBgwxIkPHZcxu8L9iFIb0/kRnbcbOnsyPXf7VCVGi0goryg==
X-Received: by 2002:a17:907:1b03:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-ae9c9ae83fdmr247023766b.9.1752762169843;
        Thu, 17 Jul 2025 07:22:49 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910fesm1371235366b.1.2025.07.17.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: st: spear: Use generic "ethernet" as node name
Date: Thu, 17 Jul 2025 16:22:46 +0200
Message-ID: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4702; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=uujvZIEacMR4RmI0viShcrE6nyskrRbnFlw1trpWzkg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoeQc1nazIsXmyvnrckGiynmTvQnQDrqclaTwNs
 09NE3Zpv6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHkHNQAKCRDBN2bmhouD
 1ziUD/4xRIoA9qa8jB6p8q9H6du3tZw9quXQJhekhD31jMX4VcsCOcjBIiktkHqvRK+VHXCx8SF
 IlsxNiot9I64M/+CVxK9HOBiD5w2C3MflRYkbeAH3BfbfTvafMU+fo9JgTFr3aOT+vDTGtEfkm9
 RAeLbqDe6beDNFeG71n25GvTULT8ECpzou92GkVNv2CNf5vG6NmxjOz2/CLn0XlhgWToS8S+tig
 P8A62nu8Mqmr2sUJ2354HQ4MPB0+yR/iuBfoDU2SuYyUZkf5XvaSligGVsDh0jk+3fjUglX1ne7
 m4RxY5rg28N6bvXVJpHVW7tcmg89/xdKzOIk0BHk/tlDPjs3XN4BiZu6cW1GC0RSz243zjIJkwY
 rSE37Vk/lUFbOkuUgXnY9KdkjkywXFBgl2VlQDIyaUZRhV8BBQaIZT0gjFgixzL+Uf3e4LkmQBg
 FCeEhBHKB9FfYoPgP680CVLj1MUSewy9Z6U3gyXMAr6wq17itAUNRXZbfy90ayzO4NRo7R41Fxk
 EYVPf23yT0fiaONZv4S3yx8fnt5j25SRnIy+6cM6cMBpKOpWGVKb0dypLdJNxnfRfifT9c0nrcz
 ZONV3p1k3TigfZKPhQCvzuCkk6L6+/FgYFSAm26bWvXbBPMSzN2GYMii/2DLqSc8Rbze0lZbFAX IzY3tofXGHWcLiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Common name for Ethernet controllers is "ethernet", not "eth", also
recommended by Devicetree specification in "Generic Names
Recommendation".  Verified lack of impact using dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear1310.dtsi    | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear13xx.dtsi    | 2 +-
 arch/arm/boot/dts/st/spear300-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear310-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear320-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear3xx.dtsi     | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 089bd7db55c7..417a064db11e 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -159,7 +159,7 @@ button@1 {
 			};
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			phy-mode = "gmii";
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/st/spear1310.dtsi b/arch/arm/boot/dts/st/spear1310.dtsi
index ba827d60bf07..1498996be14e 100644
--- a/arch/arm/boot/dts/st/spear1310.dtsi
+++ b/arch/arm/boot/dts/st/spear1310.dtsi
@@ -128,7 +128,7 @@ pcie2: pcie@b4000000 {
 			status = "disabled";
 		};
 
-		gmac1: eth@5c400000 {
+		gmac1: ethernet@5c400000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c400000 0x8000>;
 			interrupts = <0 95 0x4>;
@@ -137,7 +137,7 @@ gmac1: eth@5c400000 {
 			status = "disabled";
 		};
 
-		gmac2: eth@5c500000 {
+		gmac2: ethernet@5c500000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c500000 0x8000>;
 			interrupts = <0 96 0x4>;
@@ -146,7 +146,7 @@ gmac2: eth@5c500000 {
 			status = "disabled";
 		};
 
-		gmac3: eth@5c600000 {
+		gmac3: ethernet@5c600000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c600000 0x8000>;
 			interrupts = <0 97 0x4>;
@@ -155,7 +155,7 @@ gmac3: eth@5c600000 {
 			status = "disabled";
 		};
 
-		gmac4: eth@5c700000 {
+		gmac4: ethernet@5c700000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c700000 0x8000>;
 			interrupts = <0 98 0x4>;
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index d24146c3c9e8..9e7c356b1d9e 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -157,7 +157,7 @@ partition@1200000 {
 			};
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			phy-mode = "rgmii";
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 76749992394d..159e941708ca 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -149,7 +149,7 @@ fsmc: flash@b0000000 {
 			status = "disabled";
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			compatible = "st,spear600-gmac";
 			reg = <0xe2000000 0x8000>;
 			interrupts = <0 33 0x4>,
diff --git a/arch/arm/boot/dts/st/spear300-evb.dts b/arch/arm/boot/dts/st/spear300-evb.dts
index 7d4e6412d558..80fae76d4610 100644
--- a/arch/arm/boot/dts/st/spear300-evb.dts
+++ b/arch/arm/boot/dts/st/spear300-evb.dts
@@ -69,7 +69,7 @@ fsmc: flash@94000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear310-evb.dts b/arch/arm/boot/dts/st/spear310-evb.dts
index 459182210825..a3449eb7e59b 100644
--- a/arch/arm/boot/dts/st/spear310-evb.dts
+++ b/arch/arm/boot/dts/st/spear310-evb.dts
@@ -88,7 +88,7 @@ fsmc: flash@44000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-evb.dts b/arch/arm/boot/dts/st/spear320-evb.dts
index 6ac53d993cf3..984075e60634 100644
--- a/arch/arm/boot/dts/st/spear320-evb.dts
+++ b/arch/arm/boot/dts/st/spear320-evb.dts
@@ -84,7 +84,7 @@ fsmc: flash@4c000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear3xx.dtsi b/arch/arm/boot/dts/st/spear3xx.dtsi
index f54bb80ba28a..54e87ac98164 100644
--- a/arch/arm/boot/dts/st/spear3xx.dtsi
+++ b/arch/arm/boot/dts/st/spear3xx.dtsi
@@ -46,7 +46,7 @@ dma@fc400000 {
 			status = "disabled";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			compatible = "snps,dwmac-3.40a";
 			reg = <0xe0800000 0x8000>;
 			interrupts = <23 22>;
-- 
2.48.1

