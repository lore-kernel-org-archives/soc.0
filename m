Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC551B161
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752417; cv=none; b=L2ZngoK9RQSAX+9e2Xk32+KJ82VI98emSoFSp65UtymYm8VhKnfUsBKEk5MU/7rRD57MQ2kZQYZ8VMshHdApn10Uf2HuyMvkiQIs8zmK2LnGsB8AROpWPkFSByIT+AvKM1y7JFd5SQ28PzwJFXBRUcweLvGZKKUBt6tosgN3Y+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752417; c=relaxed/simple;
	bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uitnLvjZdH0iufKsVk3tQIFlDfhcok5hmnVbE3nGjb+Zk9Yhq4ECafpBaoaa3hqXwJFyBqwGF3P5puUHzq4OgmbftMMvvuzLMXVHWawN1U2qZSX+To3fvNeUNF19zgEyqwsd9nwv0x4MYNG+ILLzihcIEH08BMDd151kMXRj8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGt4FEIB; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGt4FEIB"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c264788fd58so161938066b.1
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752412; x=1790357212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=NGt4FEIBTetB67sGmVQLnWzG89Sn7PBpRgWcHDIhaLPUEO0WTvEN4/XF1hktKjO/kx
         82ydJ6zcqPotfAs8fEy2U7jeSeqOH42Yp0jizD17gN7w0L9S+1Yi+uUo5aKmY0WyblPc
         z+cNj/PtkHprjJfik8gRjVHNmkWXICzyP1AUGhCyy5X09GGKGMqSOwpWKLYhDpG+WoVG
         e3V5Ee+0Eym8VeQLaTjuIgtHxpISwa5N5QOaS7Z7M+sUd+nkD/yB28GZ1Q0VNxqZnoQa
         /5Lo4NOTvmhSXJzdk8GijRrkKGtLia6buhmLUNCFBPoOk0Kv+p6Ym4qENXALETV67i71
         6RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752412; x=1790357212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=fLJ5laSjbAH6hJKTpZ/VwBc0NKEN4M+lfWwfcyU/rqIZHw9yDWozEK0O7JIQVxX9YL
         +yPwEH2r9YlE30fZQBiPMsb5QxDMdfxn0bLlUA2IWYmHJz/JsdNy49MBIqWVcFI6QQux
         Zrbt498gTZ6Qzce/ompZHkakrGsU+R51gVr7Dn3i31NYwtjQ+vKnZox1dA+0ZOBJlBYT
         IJoD/+e78o6Py4iI2yaoSxpOZtNEMzwQA4dqwd4IbeyS/F0sJsYhLeWW8uQ+x6XMbBW2
         A2LV/rNmAGR4+QjOYUfmA2gDQ+1/Hc6+ZFYLT4YBbg1oq0jdJN7HR3c7fFifx/oesF85
         UOeQ==
X-Forwarded-Encrypted: i=1; AKwUvByncBf9jQnn/tyF+vPBmAj+F7J3JzrlPRwbDCoxtzfRsUk8f3ZTQBWefV6mPalMClV9BS4=@lists.linux.dev
X-Gm-Message-State: AFuF++l+8K/2SMJIDlwqBmgiKFFN1psKXq5L7BlvfpwkgNZlQmZQ35Wa
	S5IhopzuKgOdjoC6VQCJsJWjsq3seXwVzD2+OK9U1rSsbfwumBIGU3NI34NEXJi2rwravwe6BIm
	HJzmU8Ww=
X-Gm-Gg: AYBFou2buqNmJgFUMXneNvZszurroHP+H92Ad9ucLqxgXfZ/p3EG+ogtpY9XsyVTJ+a
	CBCtD7GBF6TQELmwG4I3260n17nXOcxAf9teCVLUim5VtLyNyXm9GmeDvQXX4hKfPdWgvZgUm2o
	5BoRuE/fjkGPdLTNNIKDozpWSFftMltMs2U1x4OPDZVXsxt0tvzYQ89IWAWFQ28l1PXkkHkqBZc
	0PUEcJK+sqUP+pMF6GLnII0oCW1rCgbGMQRfrF/XYUK19KXG/1WrGxDVuKAjqZF9f5M4My4XOKm
	2tttl3qHRmrtKE271eO+xksSOQkVf9eMZFaqOu6FfS03MYyY3WUT7jGLeaHnhM2wKzpejGnEYYG
	I1aVwI3sE+jlYBavLsQPVCnoq+eDdUfZwFLJOPvKHvvX7vV42VazeiSt2RxvJ9CqWocyC4K5qZw
	gbp+FTpkjdUkaqcsma+JUuirty5Eh9GjckZ/hR+b0xKgSTlnK0B3qbp7am9SpLEFf91Qj3a61+p
	pKh1o1KWLQ1QyRlF14/Msl66+Kl5d7gcE2yzXWCeuHxM41/P0l3tqlNiXWPev4+Jb4=
X-Received: by 2002:a17:907:1c91:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c2a15e1ff48mr321275466b.38.1789752412145;
        Fri, 18 Sep 2026 10:26:52 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:37 +0000
Subject: [PATCH v3 4/4] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-4-c94e51140509@linaro.org>
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
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRYGuQ5/L4khzKLHRvREUl1l+2lwJGoJSQiY
 SGyFcbuWBCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10WAAKCRDO6LjWAjRy
 utArD/9uj3S4/40eqQyAQNg2mrd8YRRLVD2a+iFnXlDd04AKI6CyH9Aw39xkFrcjJfJ4hkBGr+C
 bq8pFZNwJu3DH6NN/ZgNqnsiuxemOfw/aUIO1dpSTeW6BvQla9JT3YBduKlaAStNeV9HLWE0cdK
 FGDB8mVSVVJ0j/jYlX3BOmNAium/Ewfw9PI0ALpuXmOJ60HZabfOMYnun2JV43MuRmmJx+smUde
 15IsHXU6GQ15cwQFp56h5tCUisTYD31g39lmK7iD0Qpwd6BC7U3SEFO1LiorExYEECyq9C7h+Mm
 ATP1VxNycE8kVWDXVD5BlcWBgeQeyqFLUcp0wexvmyoxLICWQGWrCCnipjciOVlKfY4Tc6OyEbG
 vrlzf1SPtQJMDhH9y26QfsrMaVvnVHHdMrhtrFblU/rHj/mP0MkdHSSktmN0M2Zw/iXgUpfbzBb
 Sgiz3ymLwkb57NgSqWh4ZEmseH5HGA1gI/D7/tMq3a35ZQZsASN2N8vyisAjaCNPSih+SmS0mfT
 RnVnZKuvriyPYy0oGMaosjltQVaBzFjx9Ok1WALSvawKVkVkIzo6Du0GkfXaO6QcdiwsAHRhkz8
 8q31d2t0PWWn05xdNQ7eM6h+2MYYbGKpYmzkwJcNXA6ObhSV2vGM73rn7RO/wrqM0hT1uhF5d2E
 A+fovbmpX/pet2g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog

