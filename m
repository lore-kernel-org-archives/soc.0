Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AD494A0F
	for <soc@lists.linux.dev>; Wed, 22 Jul 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714176; cv=none; b=f4u2E95wXEX7ObUJSWtqm/BsRqpTx/GjliayzFGXX72E/Y4X15D0ZjpLHUCM/elW3ZMCAELtWBt7q6BJYUrTbT9ixH/Lvs1JVY5xEOwoIOG/qybTrK1MsOsycuwRzQN9K2uD1xMhkIfpCAs64yyPT4vHOrtF94925Y3QVAf4+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714176; c=relaxed/simple;
	bh=jU9hEfZSLyLN+jsh1uG4a2eIaQF/rbTm9P6jCmxJNGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daJP5/5u6yi9WSVZ3+Sjn0bPYUjgw6kZdc3oisHyMaTyqOn1mSQgH39mNgpcKi3V5yAdiTgkoeVzoVYlWjvQ6JCxvYioYUMo2B20/TdlLzQCAiqGr3Qz1u7g1DR1QGreRukokCIM1NUiqPBGl15OXKr0K8Mi8T7yoHmA8kKDEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+BIAULv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+BIAULv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so8330437f8f.1
        for <soc@lists.linux.dev>; Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714170; x=1785318970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvsDY5HKT6nEZUT2FM6RXMH9QdIzz7LzrZlfyQr+KB8=;
        b=U+BIAULvaVsy+tONvdCVtvFaR9D0TV6RtMz53yp4A1EpoQOx1XVzFgtcnhm6iBWdKm
         GiCJ/s/Hpolh2DE6zgE6yUpqJSOKfjBYJGxZmQZURznl+N9xhJN8n5s5KRSp1LAY+A2k
         vUPdIm61jWUUhO5TV1cagXxs85983EnewI9xA1N8aUon2wwm5yM1xtwkm2Z1RdSvAFIO
         DApmYj/CxxNpRII2iBkWlW6Tdh5fAGAQ/UmrA3rtWmGi31c7xmAhma1DycJz42+wD4t/
         5gVTbbuCdOI/8ji0//eGVEmHoDZ/JMBIOe8Uq2h3eQ9+prNm4KL3GRp3n4Xy1QXnbk9h
         0Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714170; x=1785318970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvsDY5HKT6nEZUT2FM6RXMH9QdIzz7LzrZlfyQr+KB8=;
        b=Hp2aCGDLiE8/z4Ip2wbuFEbKmH+CuenrHLY0w3pdL9UuL1WHkQ6Tlg7/kdymPQqqzd
         gWoKNvqobcuh7EEGPKCNwedSrDDbP3yEgNPCFV8zUiaiCoUGRf0yS8Z5yBuIpfvehx6S
         v/AQDUKtvt3FF8gkJD5m71HTIsrqFdwlXVBt1Ss8ZJe4c6eSfuTk6vKT7VV2Kj6EcfEu
         VY/Q1vMgoZs87jOPRY0wtv7L2zytsIANr+lerR4kYowNWqjzF0Rhj5FE5KY48xr53Dh0
         p0+h0i5gKuJnKKHbIskYMmq3ZhrQssInbKWfmapShhd/zs9GNEB1QoLuLZND7mQnqP1D
         IKug==
X-Forwarded-Encrypted: i=1; AHgh+RoMzywel8S1lK8xR3Yxg+W47CLxn30rRQenuYNHP6xONiNttIl8D25Npi7Uo33Kbyz/6Qo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ0vhBTuVNx0xXDi15QzAjNqJkYSje7WLjFPQF7qV+gL1z5GOG
	E2/V+rPytc6hM684fnxpMgtZLJgHvxR6ZckbFv/gS9pdlKZWMyIPfmwDA3wctoaQkxk=
X-Gm-Gg: AR+sD12z+wmM5SlljSBen4Juz/VTkSq/OPEPDiAepEFwmAFB7L94Xb4u8rIVflJ2jBZ
	Oau9nF8aEcDR1PvcgWIEHbkEvTSKNmrFXsPDgIb80t+zS0lByCfy2EcMDAQ65e/+E5eOqfpiZU3
	Xp31gAmSUkUrZVHhFGkb81R8vwVI+eB9atXaa7Mxu/80TiJGoWFEdMNnDY88DHWxZAwoq1tLiqp
	ASzKnDLzXndxRp2H9sUqQK4290NsZfWxLETjFNq5PxJ1J7e46ug4qScq8Q0YznAbXfCfoxn0Xa1
	Ydt9Al/zvi8EHpPI6F5vlIcUOOh+B0yY5zygRM9Ahd1RoI8M3yS9UEVNbjTIhIUTJCMPIMA4Ptd
	o3W9jLDR9af4yTpKKs8eyKLl4IbpA4qbP7Fv1twYLCFlJRia6c/UnXlTnCWBUxvk515SWVuwE+I
	WFWNTs0s87XarCRhHMsjlGDGNcNnFDgRAwlg==
X-Received: by 2002:a5d:59c9:0:b0:47f:74ea:2f82 with SMTP id ffacd0b85a97d-47f74ea320dmr17624942f8f.42.1784714169877;
        Wed, 22 Jul 2026 02:56:09 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:09 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:52 +0100
Subject: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=jU9hEfZSLyLN+jsh1uG4a2eIaQF/rbTm9P6jCmxJNGA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO12UR3M+7UC8CvEUp8eg465llr3PM/kVBu0
 3IVS0lprJiJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtQAKCRDO6LjWAjRy
 utBND/9BS9YFGnYwgx5BNfo5rWAgybD6ZbSVdu5hqHcWrvC1RSl8ppFqr6hnSqiLL0WI2ZdVc1b
 3P1k56Svr39AB4rtu8umDsSPeJJzT+9yR3TxpoAJ2fmC0A5oKGEgjcD9HBRTPpThBrxGIC+t/Ka
 l+lA5dDXcKbaAxb6GeYVOHQLQNTIl6j3fbNicDF1OV/hc0Uu/s5+1ZGsxYAXPqOft420r1zhWWw
 x1/reRPoVs8vxK+sY2qVipvx7BAH/cnGpnssel2EM7F4TPSzGPOLvR7Nn2zvTyyNjYPHKZzsIJW
 nY32CZtzwaJiEiduw67DGPuM69PyFFdqnADFWLmWqVInDP3R2MWcsSSq7CjJIKzExHZMtO5l+8Q
 NV2s3EoMnSkMDY6macBGnIxww5H7B7YBabNgM+swWhQ5+xDLMkwGJg6UNafVtfS/cwH4WLIGRG2
 NT56GJ6RchmMz6ZaeBcTNwgTogns+Bona7cNtJNayO98OdGGwigZ/UeFRa6oTd87HK7pmGyHZPh
 uBoO5FacLucnKz5GCp7D7h0yVr+P0Tuau3/eiH+xC5y+1BaLPGn8F7WZf3+vHEW4C2T0keHn0LX
 /GQTku/Sq8FMS1xwSvhXe9K0IcZ39rguhR975Xdha2J4ztncgzuJ0W1Q52wWtwi3nTIHsJFqndW
 8ULK6ahFXPlXK+Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add binding documentation for Tensor G5 SoC (Laguna) which is referred
to in code as "lga" and three of the boards that use the Laguna SoC
Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel 10 Pro XL).

Additionally update to use a more efficient and scalable way to express
the various names a SoC is known by.

Co-developed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 * Update ect rule as per Krysztof suggestion
 * Remove all the pre-production variants (EVT, DVT etc)
 * The equivalent patch in the previous submission is
   https://lore.kernel.org/lkml/05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org/
   but this is now almost entirely different diff. I've added the
   co-developed-by tag as I've kept the more efficient way to express
   the names a SoC is known by.
---
 Documentation/devicetree/bindings/arm/google.yaml | 48 ++++++++++++++---------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index 99961e5282e5..b5977e20f393 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -13,27 +13,16 @@ description: |
   ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
   devices.
 
-  Currently upstream this is devices using "gs101" SoC which is found in Pixel
-  6, Pixel 6 Pro and Pixel 6a.
-
-  Google have a few different names for the SoC:
-  - Marketing name ("Tensor")
-  - Codename ("Whitechapel")
-  - SoC ID ("gs101")
-  - Die ID ("S5P9845")
-
-  Likewise there are a couple of names for the actual device
-  - Marketing name ("Pixel 6")
-  - Codename ("Oriole")
-
-  Devicetrees should use the lowercased SoC ID and lowercased board codename,
-  e.g. gs101 and gs101-oriole.
+  Currently upstream this is devices using gs101 SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a and Laguna SoC canonically referred to as lga
+  found in Pixel 10, Pixel 10 Pro and Pixel 10 Pro XL.
 
 properties:
   $nodename:
     const: '/'
   compatible:
     oneOf:
+      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
       - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
@@ -41,14 +30,35 @@ properties:
               - google,gs101-raven
           - const: google,gs101
 
-  # Bootloader requires empty ect node to be present
+      # Google Tensor G5 AKA lga (laguna) SoC and boards
+      - description:
+          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
+          Mustang).
+        items:
+          - enum:
+              - google,lga-blazer
+              - google,lga-frankel
+              - google,lga-mustang
+          - const: google,lga
+
   ect:
     type: object
     additionalProperties: false
 
-required:
-  - ect
-
 additionalProperties: true
 
+allOf:
+  # Bootloader requires empty ect node to be present
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101
+    then:
+      required:
+        - ect
+    else:
+      properties:
+        ect: false
+
 ...

-- 
2.55.0.229.g6434b31f56-goog

