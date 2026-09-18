Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D755F495032
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758323; cv=none; b=bzNaOSj1+o1RdZ4N303xnByE2r+tVVo5xQ2iLINVFhQBZh13DzPy828jziqyXVcuapXvjcB5bXLSUyTFBJYaAfGn8XtiVPg317vBWpZNXVyne/pHx7L8KokRmhiu5Yfd6QUizDXLT0UA4yfSGWqbx0kcTV7DHB76zg1g2GBl034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758323; c=relaxed/simple;
	bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cVY8rZM+fc1cr+AS8DLhuXWeAEEmKZ63OHVgvx+M+YedVV4g36G/FICj7GnbCX6qaUbPXUSApFH6Kul7c5CSzjteVteor/u2MZnj2M4gBlMRDp/cbve0a+IqyYSi4HLNDXMNAnmARUApSt7SaBsb2fytHcj+9SuJPypLByqmDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRzB99mK; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRzB99mK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so1616015a12.0
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758317; x=1790363117; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=rRzB99mK0ad749jUn+1LXwRDH+is1FQiaCs8rHrqDvCpzGCyjxc8pyH8180UdX6JxH
         3X4U3LwcA4IwqLiaWJohqDc1kff6EMAvV+PUcUdW9I45l1PMa9fmyZ7t4f2wxtnK0FUA
         BWyz2+16PIXtZ7KvS9muuuYONe+j28QkA5pjliNuqDcDtM3OJoHu7uodTUzhhlP56v5U
         zozUtQg//QkN9R698v9UoGV8jSqp4wIcd/ROl88uHzIn65jrIlJvHVMJ0MxJtq/GTAD2
         dGB0nxtyK+0e3juizZ2d11r+OHrunZ13N9OrXKKwI/rGDL1qMaKmqy58fRVlwDtA4kge
         kKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758317; x=1790363117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=ExGCt+8Nziaj2NjPX+FkWabIfwXiojAgvY9qAeYDCL/IjPJyxq+FOjc2VlzxzhLG0S
         I0YxFdqAx7iXiwAHnX5xqM9klXkWrYat4nDLBj8sE5xtXpfom7qZ0FWHmMD73ajlP2X+
         SL7ng7heCR2O8WLa1fpklvRqmcGpk65cVw7ek3Ho/won02SqWB94gapSWrjzFZ3cyWM0
         IT/OsxDHnponWgJgrqr4t+fDA1DwfwyLo0Rp81m/bmyBb9e6MW9wuKyxJXWaN3L+2Yij
         VQc//HjyKN6gzH1xLgfzBrvgiKLVSFDzCYusEeXl/a1+Z6xUyRngCmNMC4kMPcioXDEm
         KxtQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7HtO4VeUGO0anH7G9yOZe3mmz+aQarLOaw+35J7H1MWHGP89vJttdNgUdmg0/0hiothg=@lists.linux.dev
X-Gm-Message-State: AFuF++kJ+TVUuCY9+Ag6x2yvYKN9YHLM49Pb8pvJJI+CHiezpuxuXEtR
	8G/9eaYh4Yxol3oEkfrZUkXoVhdE90pvTok1WXDJEnvvbVF3hFhb0B9keWpxkAdw8Pw=
X-Gm-Gg: AYBFou2qFCgcwIgHieiYqYXWNvVI+ffbc2I5QrXmJQndINwWs2blmW3/uD0nFgBjFwd
	FIPVKyXr4ihQ5KRn6rLc9fuohcxdTxGVN1w3Hg5RgcFFNig5o8IzrSNEA37iqkcWoZtsYwZTBzw
	Ffu7EaaacaQhs1LBNPdQldv+MMEUQM5jhkTsy5IXK1U66OTYc825BqXAYSv4r2cX7Cin4JFcNy0
	PkhoWLzVTpvHn5SMrFUt4XyjFqTJHzZGJfczr5/oUPn1xayYzyzBqVsGfBDFFCcPumLL/u8jWZm
	x1MWEuj6OfbP7q4i5FFHE1sAuz/fnistE2bD6vo+R1ZoG3N48gElRdnk7wcL4HHREvFbxCdcmoP
	hhCftfxgum+YV5MhacfcgXFBBHg6fxtyPECALvacfPBUtxNxhgjYilofv7WNkZ6SbN2a3bduAg7
	J0WrsbDXDw1co6DftLqrXk4RGrxhdwtW/lNHhhgeIiOS9PwW7aATUNuAGEYy6gvDLUli6ZCxcKy
	16DH5guRqKBcBUloFnHnkIrbo060OyUXKBvuCMPwbX52szM5LUYa25nY1mW//NqpQ==
X-Received: by 2002:a05:6402:24cf:b0:6aa:f0e:a150 with SMTP id 4fb4d7f45d1cf-6aa531dfb4emr1718023a12.42.1789758317393;
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:02 +0000
Subject: [PATCH v4 1/4] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-1-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
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
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtqI2pmcS8DDE15Y6kLwU7Rls+/1BkckMKPo
 1Ot3huXeImJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LagAKCRDO6LjWAjRy
 uu4WEACH/64PfEIPtlHF7mRZllDo+OtwGJokTDnXIq9Qff9FceYZHWhpnrIij79Q4IvnqLKQAMJ
 9QUNwYM2QD0AZBVywRUMXoKcJirUVT/6tAyYdVRGV7opieMmVo32VGG1FKyManKxe0zDeJRm4cn
 idREK2uVNNYklZ7J7ybatWZFSNS0qzuwscARZkDGkLidNnX6+lxus8ybyQFNKLIphskjcNLMn5X
 QsYujQmfx67gvId7QtqWa5vd7ty8NJpqV2AuRe3Qt1KfS3DRrmAb0ItUiMA0UNJ6ufUD44FVeks
 BLTaKdHhb58fifcbNqBW+9C9gj57kI6baTkNQcMqUxNIMdhT5hgDc5645uJrMxQZjqqwMS8P6yT
 Ti8fIfIMiAvm1zMf6KS3IrpmEra10kft4rXnxE+ZIeCBhZd/OOgd+xukNeDD9Zp+F4mEujCcKwY
 s1aldXmYHXtJn5AeBfH/9FYfGRMnfTQU64UCYkWh2BVZrn+Uc87+v98hBKMKxdSaMdYEer+FHM0
 fVoKJS4hzL7FVvPOt6gj/J0rmjihNrps5PwgPhaMd2+hCA7PqOvqydbUOVGVzp5+QX32OjNG2Ew
 4Ah9gStCKArRUewp6eDUvgZcIkA/cHm5DGckYUKrqHC5d1KGpJJh/YofOhaGOR4I1smCLyuIl9H
 AsrzGSuaJ0q6J9A==
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

