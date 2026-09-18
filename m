Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B144A8421
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752797; cv=none; b=bwX5xlNjvQ9ejRGUpgqZlU6sQjEb+CpuBVZTSnAl2fyDKaRZhk4Yw1/g6m0CZwWkqav3skI4bWOXOfU9FGvUdcZ194PvPjtragGTzPHDdnYpvVALKjNkUEUfHx1ju29jmsWGlExB9qi/QkrSdwJzDxVD/8QVjdS1QeKlsNYNMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752797; c=relaxed/simple;
	bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmMkX+R7DeH6BPwtAK5rVVFRM2y6G6h0CM283a8kxMZRt1g7n4aJGUO1mz5HUpd5rm6d+6mNHyGF2qllAuA87+DvpER04c4rMWUSiBz5yL45P+YXkhaWQQ3g/luHKxfItAAvQgSUBMjEmBE7JwEhpkaEAAIsxwUTOAS3uPWydWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmVSoGDu; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmVSoGDu"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1816790a12.1
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752792; x=1790357592; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=rmVSoGDu1+QvD618U/dba5alIM8PTHrmGkYP+osmDyCZTDSZCWMeQsCagChRrDpU16
         1e/v8MB83WeZpghzrSkcNueBH/mPtBZG1DrCylhxj6+OYJkvpS/qLgBpLYDIuqx/ApFG
         9BjtueRWhG07qtthhK1z5IfqnIa60ZTfe3atmlGnI1VljI8KKNItNgUyVBiQLZYtyFD3
         gMll8eK+OKh4YKzL0xpnsLb/J9s4y1QWFHY07kw3uHd1bqpK/JsxiUmDDZ89cng9bTPS
         9w6RHwjOlf7odHLq31QsQ/Kk/tepO/ykzbcSsFWiZDGIb8VFi7SaE5MisYrRkyiPSknl
         gewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752792; x=1790357592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=aMYRT4fkEm7LOs2oaelerYcSJ8ijzY2JqGiQ9zI/sUnNYrUhg2UGU3kzDOLmPgxjlW
         NJFrOVqPPE0+6AjShan4dyFJr+vYdsHfSGIyNSo45YgB20FkKtjOiRct1icXFfFxEF1g
         ZTjonTMwOu/kBWnil0Oj+9fprXr/QgLNXtzobuO3Xer0QzidY5TNDEO+OGfV4NlZcQa7
         Z/GFpSZz9clkRvuiCyOWaxBeId6+YKUHsV94j2+12KfpQyyF88zYprkCKs8cgKCFRYG5
         l5IETkwhsup8HndRkrPtxdAac6vtzW910DHPsxeBE8eIPENiysNxH0jtyN08yea8aVs/
         slCA==
X-Forwarded-Encrypted: i=1; AKwUvBxzfIspQEd9TBnEZcAYCPhlUDLsHD9560zwTnyQIfv9SfwdVdW53MIyqYyfgM4eg0TCNu8=@lists.linux.dev
X-Gm-Message-State: AFuF++mf+0H3QlQzHoCnfy+/REd7Mw2K/iSUmEB+bfhFUPMeDis8jgQI
	xxUHKmREVgQv2/QuwBf5FYWCZsXkMl3yjwHHl0RYUN/JhJgXYX5rcElH3I1237z9bZ9fq3/F8mU
	zavrPWqU=
X-Gm-Gg: AYBFou31x0/QfvfzoP8hygrcmKP5E5zgpB1mSyKVFxQGTVw929kvYSoR7RkpZRZzizV
	aNE3R5QNzTdpJtvwCiFUdKgR7YSCIqMeuqscTfrIqyxLtnubRw6MMg/t9xuBv4SwNv8eNOWYQUR
	W3MLK7in0Ik5xS8tihGwFCLinkRlgLI7Bve54wJ3fjLK54wIdUkktkK2e+Zo8+iZi5V93FPTQuy
	tM1u2Uszi3kayK5Jv/KEiv4DecNsI5Q4cCVLCimktcbL3915XXRiWJ0hJJnDjuThqiDGEiWVAjl
	s7gWzSu4Ph1hD5dR01JRnl4hGZXvtVyZJma0ZTxILwt+uoL3WbxE2jbh7QHfBmv6a/s/dckJBMP
	1+XD+RXdqyAVrC2AorIx5y4L+6TWQC0o9n6drbDQ2gSPolHyORDSTSk9HMTmGbFa0pMPgURgR5N
	G2buWfSPLrnNGkhGSczm0/uYF01stP5OYuRE8zBzhYy+odOJ6RihmMU677H3rYffObWO40uuhPL
	3jozHAfR1Ge7k7SDrX0H0OFeuntiXEkgLwPjxEVXcAQrvc0okmOhfYYXOa3gjGY2A==
X-Received: by 2002:a17:907:972a:b0:c29:59ea:5bf9 with SMTP id a640c23a62f3a-c2a1584d0c3mr348855166b.14.1789752409709;
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:34 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-1-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRXzv2ubpfgFzjRAOY1RgWBr71XsDwLoS9hx
 9EJkqiEJ9SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VwAKCRDO6LjWAjRy
 uoxOEACNW73L3XepiEmszEXR+097pW2CyPuEVZUfEl1WFOxXsh2s9eREfKoQrvGdelmSZRGPO3f
 Fw3a8grTgAuHA5Ffm1J2bFTpozcO6nolBLfQAQbxkO81z1ho4nXHIRPKjfts5/Ll7vfwo8735tp
 S120by72b/v10A+hPdPTqSKYaCTfq8xmE7XRjAYB6syuE97GssBdyNv5RaUeCxqYksWWQhLzeSd
 kCzW2mRtVsMHcVe0Pyytdf1k+LQrWMf9TDqZF8lm5kPe02eEv7ASqxzLDbaAoRblPuQ00Y0fU16
 kEXEZFKABxaOFoR6j+FypBuZ787lHgw5mD/a3SNUK6ItYyE6ZaRmqQ+EBsrfmLDgdVoKQDQidE8
 QWRUAbY5zT2IQq0irMXNN8yggaBfvOaMnCHrA4IpaT4GvY/SqtM1KAZ8Xbf+Rd3X9xxja6k0Lz7
 zcv/99P/DEnP56aFQaWi04uhwMn9P8mjUDBAwxxd8X9EALxvRJRHPlz0F3iPL0Wrbfh9eg9e9Ef
 UTsZYYLhBP3tWluUYOMMaZ8N9lNEk1mWUVQK/WTQTt6C6uc1W5hGg1NP5KnP4YIR0wEVidgSyg8
 MX3/R6blspUuCSfbbFv9F27lXKp18SH1J4zmtN9ZLwuThYmtPNXDm0a/on/Rvp9maHZ3UGsdoHE
 vSaPuqr1RVm7YMQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add binding documentation for Tensor G5 SoC (Laguna) which is referred
to in code as "lga" and three of the boards that use the Laguna SoC
Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel 10 Pro XL).

Additionally update to use a more efficient and scalable way to express
the various names a SoC is known by.

Co-developed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Brian Norris <briannorris@chromium.org>
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
index 99961e5282e56..b5977e20f3937 100644
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
2.55.0.1082.g2b9226bbc0-goog

