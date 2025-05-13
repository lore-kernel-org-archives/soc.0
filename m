Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644D244697
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131042; cv=none; b=mIh6R7b1JVVZRMeO5QyVcsF+jqCiU56D7mZKOCg+ohl9oOSa33KDoXC0MraKGneB9VMWn00ztfyaL5xDQtM2wf4Aw3dJcbNBRTA1K6tlo590/45MIDTSE8miRiHjdtMAWM8AwXKZP6C5qTF6rt05KR8myoHYLOt4AEH9fJvctbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131042; c=relaxed/simple;
	bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppHK/99BRcXpm9zVbTMMvPryCrMKWV/PodqzPh3tRkRqoh5Ddd7C1iSJ53sSXiiEPsGPUYNo/IR/hVB5bUNUckhknKwhCC8wk0/VH01e+5LM22uGadku5/nCYfkJxRooQXJveMVKhf4XSe6S9yKEPgLWu7I8aKG3oiBjZk1nTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vt5kfuHg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vt5kfuHg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so4652235e9.2
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131039; x=1747735839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=vt5kfuHg3TADqzUBtqb2lP0pr/XIG4RsrJqEYXuEwi026EsWk4p5wOTo1TIdmZzAPM
         SuoROAGiTeJ0kvvuLs9NJ27B36nme0N5HFeDCvnMVPqAx4cjSf+gOIBGH2DHY12zWRoa
         J7yltyDQK/12iWPL31gILz37u+rZ0xz7FESIZTKGot9UwGpgpb4zFtu8w7CrPnn/R0eC
         ErLO9KU8eweyjBVPjErByswjyeAt3GA/N7WOfkMFOw1ik6FVNd72ciAYmtcXL2lUsUn5
         TIVk0i1GJlGQzNx0W1IFMTLXbihty6Wjf3z8gwMlgYzmObFz7VutVegURSseMiW283sb
         VNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131039; x=1747735839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=DVIqzFfsu09M0CUQNWFnRZNUCgHMK+H1ldo1wRy0inl9A2Ee5cxD//7kAV3cc6iKLK
         nqMAapbjb44csmNl55LHOZpoUh+cPWQXoJ2crJ4aIsGGhPhh6h0cTSmO51gKmAHtpQ+6
         OrHEcOIs9AOq8Rp6Hr/VsUGyYSEUrfjmiY+CH0II4GS0g+7maGUN4BT1c56+MKAw9Scj
         9vURlhEKk5phtCW2299aK2X/2qZPTHPcp/n0wtOJM5rrSM8BhVG8lfu7FcJepnNM+N5P
         SXi1m8qAXKt7Mh/DhEbIafEGutGoLlOBQ9L/mXgW0j6aeCPTWfn2/5hxTSSY7RYERCFS
         x7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVhqBtS7wrpaljvrWzrotBN4SwSG9icIX3vo+ew6QONOEiC+tQ7zrXq5Y7HnmUSuJrQWdE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv+5h+8Mq6vyclFYAib400P0Z+Es02sKhQN4kONEg3ABJSCNhr
	qQuBxjMrSMz1yG7qEK0fhxuSLbwZJaXtb+2miPo5frlyEa5fdygcjv/ozbaSURQ=
X-Gm-Gg: ASbGncvEbSFs5c0RwyXjG6hX4lTgotLU9GXEVO4dVAFPXomJEYaiOG2teZctX5Ytkar
	1u0wZC/SC4fEJggpYTG8qnd5bu3iqpDXF86cv0FbAujDArpBjGdXT/9/z3rK/hC6kOgtQtmkCUP
	m/4si78+sA11eclgw+DSk2eLDIIIm1AFthDmD5nXaSSngkc2DO8hEhyoamSTfvJD4n62xucX0sG
	nY+4lIoeUZwexAMGVyfGKyXCF4xdGoGIgEVqJfiUd+d4vYlGVT6xQLZe+tZgNYAVebtGx38gwIS
	u4Im05ykt3edT4LlmqnQH2l0luSz4ySCEwvP+IDrbvNRnv/nYQ6j9H9KLqveQKd5zP8JPWY/wRM
	N2+apLhQb1aQpQNyxMYN/30kgF8LZJ2NoFNxsDHM=
X-Google-Smtp-Source: AGHT+IHby+uH+9SrUe0Mcr5B37Co4treeOqApvNmT3ZzjxOsvuWSMZ2/x9YLsSi2DmbWlz1SlUQrbw==
X-Received: by 2002:a05:600c:1c90:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-442d6de97f0mr50703025e9.9.1747131038625;
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH PULL 3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Tue, 13 May 2025 12:10:24 +0200
Message-ID: <20250513101023.21552-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqREOlMZHUTEeB8rGJ1Gc38+QkgIxsOYpihB
 PhNb4GFzH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakQAKCRDBN2bmhouD
 133pEACOMqgFZZYU1knd0BczssaCxOXwa3oD5FfktfyjygqFRCU+/WCNPLPHgURFsa0Hdph5dcP
 JdqF7642k+Zs7eid+yD15R7KnkgoSnoLxyVoTnvaqp+feC5HXpyqn16hFkXQgUdwgYOMDY68eFa
 hYaeGheo32dCD0XdeHBBG4gruHd2lhofAaiBwAAM32+I8dcF1ps1TURLduOC6uD0YHrykUjeg6+
 0ttqgCx1Eem6RPzY+H/Ih9FWGYsgOira9T2NrTxIGzNHEyTQRaaSjvz5ytncrkcv/kWsXL/PWYI
 dxJRaUUjFUZM4POvZXp9LVXijH+Nh+jZEK4rAsR+B4EdyVZxCZ/O6uv4Uxqrts2BEYFpTPaS3Kv
 4X7DniL1Mcs2cpw/N2wRa9kjaiuo0c9CrQXe6l+NwQ1mJ5CpHVj61IPvK+gP1hT/dbUeIFLuYNL
 zrRtKPzqDY7MFOtgspDImw2QLvnavEPi3LeaTWpLmSP84u6uHGaAwjZrgXa9Dcw4x9TsOCUGSSP
 kKNtoKqxj/ocKIaU9mBlGBiAgFWQoYIHqjLWQWdPgdM898/9xsIdJ9Esz5qD7HOEXyOLzkRbBtz
 ZElPdomkvmpOSvlz8CGDOOfzixnJ8vHLi/fr3zSK9sJY4dcChhWTjDc0YNetEUCcAldWlRdwR1/ 4ub3HTmQFrpqPuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Recently DT bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Link: https://lore.kernel.org/r/20250424084655.105011-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2

