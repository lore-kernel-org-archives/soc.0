Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DB48164D
	for <soc@lists.linux.dev>; Wed, 22 Jul 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714177; cv=none; b=hIP53LHQhco5V4WfiX2Y4/IC1YF9KKSrt9KyB0ba4M7yenEKKhB6AoYl7Bb4NQ7ZRpV0Wh0p/SEqcmO52ojA4N/bSfj3sSLLzTQ1l92oTHzQUpS4okFE2um4Es3OcYiQrcksoh00+PB9hgvJ3LLQfhqImw5gXk726ncmfwKso0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714177; c=relaxed/simple;
	bh=Q881r0Bnn2xtZj7kXY4jMzmdVJCSlmZ1bP/u+L60wrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbarSQpSnj7sUpkXBcUct9v5wXetKSpNyQ4Wytnvii1woNpDSWt1yRGIGeR97tq6DIsthI5ZH6GvpSnLMnXVwUxuW3JFX7BUx3CpmEwiBSsOmDHL4rSlPXNmGyLzMmyv0FJ8+b1lMkt7yOsPJwbehsNfZXxMKUJFgoNM8HXKJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohZWTj7/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohZWTj7/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso39380735e9.3
        for <soc@lists.linux.dev>; Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714172; x=1785318972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=ohZWTj7/Nrn6tF7x8wyCaliKcmp0cejVs/16SfN9bL93FSYWBGOSzAPZVFu/kkbyW1
         nXgIlkgoCxOUzhzvdPAeNYESMAZDn9nN66AfaB8PCx+KTiA8PKg8mR+kmimG8gTC5jLj
         dP/XkoJ0gjel3fMxEfynJH5fH3qDqjydxjWiU8PQw+fL+slKurpP0AmRWrskncp0OR/R
         UzV1f1yk65HIA8/aFEw8HE/NjcE5BRdgJozZtQ2Q/MEYhJUor2Ly0r87+vi/CCfIP6Xs
         8GDxVCKwu+w1nh9hjv/ItGfGhvYWLXdKtaPU4GSrNBJtQ0wys/4Kpf/rg3DfFxdWcN69
         DstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714172; x=1785318972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=oj+mFIc1xAvwuF9cetY822KAQRPQWIo3Cl9MmrHND3qEPyXbo1gJW7LnWpbFGWBNDq
         Vv6M4dqy7MiFpkNExkZyt9fSlBelIdtm8wguJuFuN3w3fd8XHF3kAcnfDQ5+nOLtyxjc
         an0XgRTmf2o4lEjAS7HGcVRkuP78J3l10fjaB9GO7VQaR0Orvnxi5G4h4+ew2Yk+YsS2
         bmBIe9Gd8/3XXbLB/HhPJEW0QlEiQr0AQ2/1nI32YVs7KGGClhijK1RsbLJoKQ6Lc8Qf
         D9xR/pCRLE5NgQe3fl10PaYGT7fed0mS+6bbwGLZc9EdGON45CFNyB8RU/5YlcnXVHfk
         L3iA==
X-Forwarded-Encrypted: i=1; AHgh+Rro6lPqlAT8shD55aMYO2TyssrmaDHdikyg12ZFaUxao33IDipFW4NAN4lpm/lwEqFHi30=@lists.linux.dev
X-Gm-Message-State: AOJu0YxspW6nix7Q0FhUi0lwPQTFSdZJZYfCv3N3Ek5gu3NAEuYJqdPz
	Axv4gCqRDIfbB0rIqqAmxzcaDptOLitGNsLiD++OeBsV9yrl211ld+AeQmfDxmdZcYE=
X-Gm-Gg: AR+sD110jT1UVz4V8sVPd9sQKTXnmFaPHEhsXrKAjVeL6dSYSLGnfqxYwWiUgLoAuIc
	9ZTKU6E4QAFP6MLI2RJS0ocK/M6Hkt6ZJGHa0xlDHI5NjFl7SdBCTPZsukeWb99PX+1sb5oasJx
	1WFFqh1ClzKl4mbNv6wcdtb4OACStkfLELbDFbgR5qvPfaQRBzvwOU6ThAS+7X21MFedUyItDxV
	UGtUmWPWKIJs9AXMXZOV+fD348Vjpqj39PvyA/vLma8fcifhvbpaLOwGaKPbtqwuFLPMTgmeRKv
	AYXmMXHze2PbCKsaQ036CWZuF43tR/sQ8X17EGJrx/pH6Rs3QFz5jNoUIsrIA4rvjw2BuPRr9Zy
	3CFhQ95AbmZXYusMHlBcCEQawkSmKezBUd5cMXMGCx/8n+EJLspZaxG1DM/3ey2KQ3/2LdFRLvY
	EzxPe4UOwR2/Wrjxvh1SiH4QdOzVhrc32RqvathgL7Mgm1
X-Received: by 2002:a05:600c:2156:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-4954a411570mr205769225e9.23.1784714172235;
        Wed, 22 Jul 2026 02:56:12 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:54 +0100
Subject: [PATCH v2 3/5] arm64: dts: google: Add dts directory for
 Google-designed silicon
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-3-3abae9717feb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2691;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SHnnOHycO1M3KzDLgoFhcyeeohmukEIp6feU5iRFhhM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO2NOwczhyNRIb4wdxPQ/5deipkuZ22m7G6C
 3osSGVwLVSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtgAKCRDO6LjWAjRy
 uoP6D/9xSTEuwM0zy6yW60c2SdWiUsBjFzss9dmvogtPOMldBMfPCutZSeoZh/UMm7wb8dfBGu8
 wSUn1z9D0BA9VaE2oOtE6wgKfjEhJ+liXJbqwGG5rTwcGOBAyKItpqBNuKEH1JoAbMuQ3JY/m23
 61bcf2dT3PPPM8C/MVaIeII1H2NO56X4HTEq/LQEULXAphVi6UX1pSTS8MYoBzhTpNjTAG4Nfwu
 LFxEnqs12faS/yylh9vn+m2W0jPUpThWUCsmysRf1lVnV70iTP9Cvfli+tJm8Evonit5/zmCPgF
 uAWoJTAv9vBY8tHVneok2tVV3W0a5W5ky6fWntstAZSLTTLjb5OGx9OGaMVUovYhvFUb/KsDWIS
 ItlfYpSSzbfV49aBqxJ4LG7B+NlR0JesXlCbvDVOks0b3/CRMBuGmcgUDXZAZkGu02RNsfFlt6B
 ynDfop26Vyu4+1I/vg+53vcqwCaY2vVOLgrwJ1DyxnP40V42AgPjpGWgkrfO5F0xBS5gG74eA8a
 mIvMoqRXD4tY/DciX6hWq6jNso6V3v12ijydSKmHs5OMfLB2tZdjw/BW79Bj26SmiLb+Ut8cyd4
 ncBUPXYTfujc1RQIC5N41vL/IdnT/KHI2FME21v9mCxdd1yKjQj9Wa8b0B8U+xgvuota8afu2/r
 0a/92dGFDVfSitQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c61ef65d71ef..010d4de81a1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11012,6 +11012,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 72c812e76b0b..f83eb4ea878c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -147,6 +147,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 98ec8f1b76e4..566f0c863d55 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -18,6 +18,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..a6b187e2d631
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.229.g6434b31f56-goog

