Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3B30E82E
	for <soc@lists.linux.dev>; Mon, 10 Nov 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776840; cv=none; b=PKnv3ia9kKxSgkMB8dKaCCBQMkp/pHKsnoa/+VhRfFV9w3Ht34GtJwFDA12fyPVKgcLK0EarFOVPgeNUjjbH1nUARE4oUY367KCShhiyLZunHYjTG+xGTY5a5Xm+c9WIFon5577ZMEjqnwI3Z1h5uJbjlXv7OPWfLEakecRsuDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776840; c=relaxed/simple;
	bh=/iPfwbC+FC8ePlc+R2aZlBP8mfESEoHeMp2+5WX8iC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8WfxVk8Jj+2bzkl2jtr5THrt+kebU+AHCutMtWEwD/Yb5k1wTWHNQLrAKSUSsxooWUCodJAHkI3X0H4arca3N5QiyDA30Z8gg4DhWi9e8hu0chp4kSNASaXLf615lud8aB7FwFcTLdI+zK3Jinr6DVMDXsMV4N2fUTuXxGhiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbtt25mn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbtt25mn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4777a96d817so487745e9.2
        for <soc@lists.linux.dev>; Mon, 10 Nov 2025 04:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776835; x=1763381635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=lbtt25mn3S6lyc8dNMQrM71TwvG2fi1P/8zLBuJfxCNAPlgvbf0+zIkqaZP+Y/Ibpq
         WBzN4lmt1NYA1u5zxjiOZOwmwOZqCz0KjW2aW1ZpROQicX0T3I7NAdkvqwbFMNNf2xRV
         1treAQnp6EE6sLTreQ6UxgOdVbvOVPrjA84H1Hor6d4zmW+UuvX4HF3CpUTXxiDMLr8Y
         7wGEECl/c4uif3i7tGx/Gqrl2C53wQrbQfhxldiYzxy6ch/bBKT9dFtlJMBbXhYmKQ8p
         HH3B7g1fukUqDUtXB2jJMVGSIfM2jtNMWgqu7eLLpx3tRzDSBUNX+t+yFLu1gO5x7E9G
         FOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776835; x=1763381635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjmbME1436pSDYkp3aIgIG33gCEKBJTvr+5GarnqYuM=;
        b=w0q5sTUw0rzAjgMlkVsUsJkMYaejDmQjWo8qrwj35Ol6l1LE0sV0Zq/2UGNPe9Frdp
         c1ZE2SevAavZmU5GXMRnCn5VE/7UmRFNN7WWHDp5gKhAf6TcAtyQdXiLvxmk8ty0BCXb
         sh6Xw6p3f4rVKaTIdNk/bEU4HlrJbfVyUNGW8h16swalI6euaAPopYBJ89xEOLwSdmNj
         W0rOtFZK+8rVr3Jq9vh5MGaNF4ypjofycuNvj+gGelpG55AB/kXyMO+vmxO5leqpt/4O
         kq+WWwNlNg9MFgHTkz5ANrMCw7DiqpdtxOndXX34qC0yYU6aRn2jpIG+uOeqnlG1dykD
         mXPw==
X-Forwarded-Encrypted: i=1; AJvYcCUrRp/YQcEfyenUaKS3Nm1DqlgW9Fjf8hFwuhZhi2FsYiVbSJ3qfeZdcGxOfiLU/Fp5Cbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YymsPGI9dbacGhigM/kvsJMSGxoLqJi4+goLXyBtMuafe5cuZhp
	3lkmOpaLKGiy5hC6MP3zrNHzcVrey/U+VeYKsMiPH5sN8ymi5AxEFHA1v72ARdoD+rQ=
X-Gm-Gg: ASbGncuT3juI5XIH9AMLGzNrt1OPRuzqPUk1CBLQ7G+x6QTx/HtrFpjBZgmDYuWgXTR
	NXnYTXs04hDxT9mhEct318q097JlsT/xCH0SjKb1/4vgGbTx0l3W3yHTWmTklL8ZxrZWy3/JoZa
	x9ho6BGhCZZy+hp/tUIMLSCb6n8c+xlRcn+Y8tdBIulipZYRkiN+Vj2ro0T4YUdYAmVzT9BpkTM
	4KaEyj3yeqr8UYuREWgoZJKhCk4Qhv015QMzufTTuX8I+LPtVVvS9HVUDXM0pFryHAy1V6vKS2O
	sY/2aumk5eRSJ9Pskz4nPsIN+Q5DVqWAh4YOijB4je6QtAh3XvP6pppKxpSx8OQTg3lW7wES6SN
	6RPXCcjPTjxPd1WqfxazLCokARQyODSKvul0Mvi9EuNEp5hAiHjXVBFB8noYDNimYTTCWPZ8oHM
	Bwr/qp63dJxsXGBSnYqUZwSg==
X-Google-Smtp-Source: AGHT+IHbNuArn8C9DWSTKYZ7LhUSvorI++lgVify2RunMzFZSAkl92QQgyKvse2NSni9jyc11HIbCw==
X-Received: by 2002:a05:600c:4f89:b0:477:563a:fc9c with SMTP id 5b1f17b1804b1-47773236215mr36141105e9.1.1762776835461;
        Mon, 10 Nov 2025 04:13:55 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: defconfig: enable Exynos ACPM clocks
Date: Mon, 10 Nov 2025 13:13:39 +0100
Message-ID: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=1RuGJhko7Tg/2IZzsHP76G8AT+Tj/AWNxpQIu6+goLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb46cR755V6vYrD6XaAJ+OSnAKc6fvm/6jTB
 xiiJhbvE0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+AAKCRDBN2bmhouD
 10KaEACDLPQR0FrZpAjYo5Og1ep/uckTjcjFC+xCzOXqOEdkrzcpDl037REM1q5jViFkjhTPpXN
 SrcT8a/d5hhSfjHToiBEaoYwnPfJ9jRk8xdAeQotkzc3dCqUznEibLkng8olbmhebHJFB8Ry+Vk
 BPdygN/QaIjOVtyQ8CzlIFatPlF5AFkr/3lOUvqukBIXmWG0Iis/flbwcTR2/cRSBh1KCrx//WT
 8vaBkth4y9WjLiYCCqbheWjzD7HbUAkfV5t6ysaq9OBpOhHzjluW1fqFWr98jJXzda6FiDRWlD1
 TdhDDLfTWyrRTPwum+lUHGJrHjPNbcO+1npr5MfE5tOntgnu4hCeKrxRnoipk1eRrB1/MBWU1zP
 GFQjaz1w8dVPenwryczUMq3vNTVpAFmbPzGkvJWSuW3X9fh+7Al8vvsiURFB2ZuYf8pvS/IUZjx
 TDH9rq9EH5rf6nzBP7+wdNxIQ4rHsVY183B82SmCHrknOBF4KA043+Klx4m6FSgj2cogLngqZl0
 K1Hb8lOSiJ+jphwHeHFiIr8qeSzpJWmITsaO3uA+pN+Cx5y0fBUJy3kKtOd7BnAoxK9QG+bIGkU
 Yyt+4Kddltq1mXkDymUIjL7HnCxfeqMKLnxxQ5XJWeWHpRTrRg9qPy8G3QQ4als6oTKvOzSW72H AYWsXO6gNunbeBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>


Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
Link: https://patch.msgid.link/20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..646097e94efe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
-- 
2.48.1

