Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CEE1A5BB8
	for <soc@lists.linux.dev>; Tue, 25 Feb 2025 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509310; cv=none; b=GXWHdPOVhwx6VsY2sfqD3/+Ydz/JL1APjERhgAivD74a/LOfhTHBgnv0tn+RkAS4kNmor3AZxSTVACV0dKJXRsKrl2u91kfb9L9wNmClD0CQDc1B3tWstJegP6df1oCYy+JkVPuOE5YrNjqHwnbRovh/N0LCxZwhB1kS10JxtRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509310; c=relaxed/simple;
	bh=w+svvFUZeh+NUVQcPgIj5rGGXE1ylyMV4ce0O+x3V5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLegMVakefXZJR8mnADON0p81w1+QbIJFN1ApJCUhhGDqcMsL2oPnI2YojZOO622Kcw0sS8EIQR7UGUs6Fg9nOeYxWbDfVGYg5UShEC/+fIQ+FiyhTPm6i74JtJbIOdXb113uaC/KHuiDTONERqrjKamr3eYn27JKIzF7hlpqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYoDRQxs; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYoDRQxs"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so106967166b.1
        for <soc@lists.linux.dev>; Tue, 25 Feb 2025 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509306; x=1741114106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=bYoDRQxsKCRY7biSr9J0JC/S/75IRO9ODCw/PRt17LK9/GUIis9CG61O4PAhKkT/Pp
         dUDV19PVdcg5JxHo//IMAhyXRDaOLjsVw13Hw5f8/A8l+t0+Y1ZALrrWb5hkeBiH8az8
         IbnFT6jsCM5jP9NZXdVLKGlR6p8RMK6IHja/AzLpgSlsmmVY4a3StsdavxlgcCxLtctr
         4V8m5kY30Ryb+wrM2xQMIyOZ+HzbKfARR0mdSXv7YwmEjjpp/2vxRhz5kyBCW6uV8Xh+
         H3t/TlDtkFNeM8GFXxQSPDABfB8HQg8MJ/+KllatNnVHSs12ToMCG6wwh68cRzaYt0Os
         3u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509306; x=1741114106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=d2aXS1w4/NKOeLtrj0wlSGBqVZf7+Yga9OrZC4FoZGcX3dvR9LgKneTfdmoBo9kWnT
         9DA8q8xJCjAcW6dRMNlbmEAuLV3+1g8LqVfuJcHsNtZQ3vZuprm5Is95BYCXYFttBJpD
         AjS+FSPc59L6xyf6T05h/NCrtQSNka//qpBXzkvq1iuZZ97fHAbpCXpAoJuw/pJNEe3p
         CT7fNREgt4NYBx5AzPf7w8178HVO45mx1xVzyIJVmz5kvIio2QcusC5+5ilZD8z/LaHJ
         AWXXt91rTJIPgVeudeSJn6KOSa+HDYqcALz+11z9cL795zU/hHEZMaYqg9jGbhNsf9Iy
         qzVA==
X-Forwarded-Encrypted: i=1; AJvYcCUVtNmTJv+gu4CaOJb2t/EWuFz3FVtCQTA+3gFT12gR8XH3lwvZfMnMQl7uy5Hx1pzQx1I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwqtYQ0rPuf0X7GAW8gLBZGgUr9NoxAkJx5lQqtyp9p5wJdhj/
	eVaRXnCtRodFjJrKirgWGkUN0C9vqKOK9O/2U/1yTmM76N+NAb4vbZTkSNBWRd4=
X-Gm-Gg: ASbGncsPq00pHlOxZ1FlYcGyRekwhvEJeBoMVfw/Zq0Fhi2xl/gVYcb1hG1xPGgvX6M
	/8ZS4gFSTl990SS1yZjcCxuSybBfXXuM2O+A05+R3fiWRNLgNOyDKIruJGIF10d7c0IxoimGWZi
	XJ+STl5gfytfWfC1hXhDbT1qbIhtTjPRENVyjqd6w3dN8VzA8dTkwOldzgcQgmA3LGjlnewrzfv
	I2sTkpum8zxzJSf8SNvTVpirAPRmnRpruXndg2hIJFDoenVUa9o+Ome8vTuGvPltVaFAt+94MWu
	ZtcKxWYhrVDRq212zmatDa7mfMZwAycjzPGPKlNf5/n8Oiwj2kSWA4F2/fy1ZKlzr2yZh15xFp4
	=
X-Google-Smtp-Source: AGHT+IHgg2NfoJNIoVPeDVM+ZICkn7h+QLq/e1GcetAUMNdHAqmG1KBd1VC5Ah7e3zEn4CVbWsAd/g==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abc09d2deb1mr534837166b.13.1740509306244;
        Tue, 25 Feb 2025 10:48:26 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS patches
Date: Tue, 25 Feb 2025 19:48:21 +0100
Message-ID: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document two rules already widely used and enforced by DT maintainers
and SoC platform maintainers:

1. DTS patches should be placed at the end of driver patchset to
   indicate no dependencies of driver code on DTS.

2. DTS patches should be applied via SoC platform maintainers, because
   it is a driver-independent hardware description.  However some
   driver maintainers are reluctant to pick up portions of patchsets and
   prefer to take entire set at once.  For such cases, the DTS portion
   should be split into separate patchset, so it will not end up in the
   driver subsystem integration tree.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/submitting-patches.rst           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index a64f21a5f299..f3e23e69a638 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -54,11 +54,22 @@ I. For patch submitters
      followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
      ("checkpatch: add DT compatible string documentation checks"). ]
 
-  7) If a documented compatible string is not yet matched by the
+  7) DTS is treated in general as driver-independent hardware description, thus
+     any DTS patches, regardless whether using existing or new bindings, should
+     be placed at the end of patchset to indicate no dependency of drivers on
+     the DTS.  DTS will be anyway applied through separate tree or branch, so
+     different order would indicate the serie is non-bisectable.
+
+     If a driver subsystem maintainer prefers to apply entire set, instead of
+     their relevant portion of patchset, please split the DTS patches into
+     separate patchset with a reference in changelog or cover letter to the
+     bindings submission on the mailing list.
+
+  8) If a documented compatible string is not yet matched by the
      driver, the documentation should also include a compatible
      string that is matched by the driver.
 
-  8) Bindings are actively used by multiple projects other than the Linux
+  9) Bindings are actively used by multiple projects other than the Linux
      Kernel, extra care and consideration may need to be taken when making changes
      to existing bindings.
 
@@ -79,6 +90,10 @@ II. For kernel maintainers
   3) For a series going though multiple trees, the binding patch should be
      kept with the driver using the binding.
 
+  4) The DTS files should however never be applied via driver subsystem tree,
+     but always via platform SoC trees on dedicated branches (see also
+     Documentation/process/maintainer-soc.rst).
+
 III. Notes
 ==========
 
-- 
2.43.0

