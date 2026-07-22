Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381649551D
	for <soc@lists.linux.dev>; Wed, 22 Jul 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714183; cv=none; b=NgPPeES/DWjyRlJGO8nDqNNsoUiYuO7z1kEponmWKQ6rxM/hLn943B+W2kfYLD7kBcsaYGyJgvCGSQIid2k34fOW/QauI49MXfwGstfAQqAYWK2ZVf4SsMYfvHeCxRmfAUcY/tDOaQ17anoTOpYYVZtTB/ifBAlWyJvJG8P7eQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714183; c=relaxed/simple;
	bh=oIzmlAN/xUiGauIafN2ymeVSPRAXQ0H9cGKuE1HfPGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOd3wwJBMKQg8HTYh7FNLxEYyQ3mY5Q35uBNgi1a8MSPLh5Ft+0aFMyX9RikkJMaMx+k0/FPpCqnJIQugnGaCu3fF5E0RSC/aifRHPsr/j5yg54MfU4Ve1luLynjVBb3/rzz/rEDVQ3UyShbEI0tuM9wIvIyxO8fp3e1aDVouy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dh3k6OQT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dh3k6OQT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955de8797cso19596765e9.3
        for <soc@lists.linux.dev>; Wed, 22 Jul 2026 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714175; x=1785318975; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=Dh3k6OQTFx5cdqx0GLQKAZ+oCqBPDkexPgy2pwmGq+okSPm6V9+KV31ORRZSaaxqbl
         ubiBDwW7LziPkxykCOQgm8S7qtINXOTaQ0v2OoHya66Kkdn/KJLl7WAIU1iFxmFJp9hy
         SNypNaSx815LN+4Ecu6UNaNFxwAIPAJ+lEV5ieJ/Ty3xW7I+oacq+V5FND12vMt+jHZ2
         BfDK84ST6Pdj933pEdsJ7VTXbLs8tquQ1RLAc5jVeuR0FUcYFcFC+EbAwgJsT41lqaML
         qtunl7HfrQLcueEe6Cw1+iens0N+fvqzO0QR2dO7BenALDMeeblfxCOhXbrWn9PmFe5a
         WoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714175; x=1785318975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=hd8gLj+iz6GWmppqcTCl92EwyI+w3iXnS5w4bgLsnhPU+6GmH22/jCYka/q6YVkpsw
         BN43y20j15BluqYNYdBe0f2muDr0c/7MO+Hy0Fgg/r/JLbXWolVblKWhaF8ZQMl5XMX3
         ApnyQuwP3+YHWj2E4osuvmCy0fKkaIWuG39lYe13emiSMoM9bYxmT1LN8Vwv6qtb/AEG
         r6CGUYZy0egq5iHs64jzLVq5rLv8eOHUhF40fG2Nm+2gOgGv7nXKSCrIDGYM+Cm9eiK+
         PRDL7NnZ32Ssy+WvGPoDW+os7KKtzObNDkXUMf1GZvdITWfokt0woiLDqLJ6lMAQB4q1
         5ChQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj+rjSdyOmRdTf3mIzUQ2VzR1KR3xhcIKuigQOytpaQMROq2vsIKsPT3nE12KOSdTPMMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGWWWs6f7nFoFMaejAfJg5E9Sj4oYzyWelUFmToX0vYc175JfV
	7eSXu7Y7dNi7h/DMGL4UlVARZBHN9vASDo+iVe/kpIQahrYzbMUYpqJ8LaaWQpL16RA=
X-Gm-Gg: AR+sD10LMPI0PScOBsjlnbn3LexmhIxB7bzSCSdujisQ5KdcBefbU0esaDVlN24QmbO
	qimR7H/SBM9vmB0CEr86c8Rc/fQlVG4EQfr2m4KU+bkGHDGFkNfU+8a0jA9XocQCW6gZw9rvppg
	0nx2Vys09fYMPjix/Ja2B15aYPc9fWS3JhWuqBGWM9r8LS2SovONlFsb9t6qL+8ZZ/m0GMq/Lnd
	/OBQkcapDK6aKzmqoOAfzzsUgPy7H+vUBplF6DXjcy3ShgH7MYtAm4kUuJWSWPA+zwG0nO9pNm4
	E/aqgWOVhvsrqfChs2toguBbOWcTPCuORi7ks1j6a5NtxE7acPbb7aAPETgpmfL7zajritQkpAA
	ae55vUggjvJjuU6zi8Ar4bjmkgkZaP6d19pC96QBiEOB9s0cp7n9ZUnvwCVNGIljrGw2Wt1YZBv
	vnLgoTX4Vwr0cLdVoJbGkZNO1/W2z6hZjcKQ==
X-Received: by 2002:a7b:c054:0:b0:495:5172:661f with SMTP id 5b1f17b1804b1-49551726896mr145313155e9.19.1784714174726;
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:56 +0100
Subject: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=677;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oIzmlAN/xUiGauIafN2ymeVSPRAXQ0H9cGKuE1HfPGQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO3DxirCREaSZRzg4By9L4oe1J/cKMZY4ZRt
 ZPqiKTOSPuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtwAKCRDO6LjWAjRy
 utGoD/sGLlwsGbwkdHEoU3rAfAkSpRk76WlD1svFDSQzLco2bqGuiTMl95XleeZ8dmzd096IdtW
 H30hsxlgxBJYlta1JVJ9bJ6Pr4QZdcqUozZHu014CLJPwbUgN05bdvIPEo1PPWzxmqU5Gh1nwtS
 MRQWy4EGtgrITrtH/nFixj/0hyF8ybyszDS7TXB+pJm8PJO0zpKs5afVVF2laknXV/aIwGCtl35
 IrUkDWIFLztAUmtjRgQ48VRHKgUoKVaGpyh2BKm9DfBDWwBn+wkHL+ReniPyQZ/ilLOx1XvjhnV
 7NofygNm8k8wD1uUtqLpWjZyhLipwz9A2eRG9r8wz2y1zfcNxnHb1yBtIYGbwQGGzE8aY2z+3rn
 gfTc/LZywh1O7NMTE0Wgn9tdfHTJCQSqN1l1GR4bL6eZzIZB2WJu6LMVkaaPsTLRRWF04i1ScrG
 UCLELmalD5o44hHK0IRMwgbCgo3gZqGtTSTCDWuLX+vZArU/FJ97qZ73VJUkUmWpHPg2ZTNuwyp
 IhNuRKnMPh66HGyXCx34fj76bLz8dm8zeQeSKWLl9GbpVKU1/fBilq5BoSsG/wiQ/ianK2TNYkZ
 fVXm4MVq//TvqkvYyLr8o8co/LJT81FTfF5gRCU9Vm0hAwz0zG81Q/shtwCJa1ZzyOAhK0Ei0/9
 WKg+qry3+sd1fyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f4dfd0cc853c..930a4f27ee56 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -50,6 +50,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y

-- 
2.55.0.229.g6434b31f56-goog

