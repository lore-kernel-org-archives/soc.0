Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1A2686A0
	for <soc@lists.linux.dev>; Sun, 31 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646899; cv=none; b=h1tUYjGvSXBrudHeLXcLKMwb5cj5xyeVCX1gkR9cB0pSLK8xrIwoQ7L+RSFACgwIsb/mOT3fP14qXvBC9atgD4BuBCcgBdnFwdfEC9tHVOrSaNuSMHdTpCKGLKwENowT+qgQMj45k1sgssiPnS3pHUwyG9oRSdcprfLPe4FILKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646899; c=relaxed/simple;
	bh=ST8wHdef2LgPonMkQdZRXjWtFBeRH6dlNAeB4eL/Hmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ACfnRv9Y1MhQuh4OE8YM4w4UHYgrZ0RQo1vbSOOc8RuzP1LXPsktyMZuBVhavSDcYMVty8Q774dc8gtAcXIem6rRYsFpA7kakBRZYknb3w0vDgQKuN9INot4ljjj0M04V9MBufsu7VlL2S6mt22yUVItsOxo6UYA0k5mwM8wLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqBjhuX4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqBjhuX4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0ce15fso3809975e9.3
        for <soc@lists.linux.dev>; Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646896; x=1757251696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=DqBjhuX4so83NRUyDzcf5PRL5Vg7AQuOfK4czpctYZyMQb7Dzv9g9fm/SF/3d1afeM
         4/IWHLHQUeg4o8kAdThxx2A3sTZk/fenJ+P/APWwz0MlKmXMkW4IiS8UgvhifHazBKHj
         MynCJMDyD4f1dsaNOVhgrGmWbyZqxnUlJhzriWfTy3IciGJQt507YUCAjFc1P66WDC1c
         rJHOdI2/XyIc8tNxVU90A7Je+KnRrjf6A4hiclL451lDFZ+eKgD9TqeFVfzR5dDljMB/
         1CwrEvnFl1i3cwQtNwstP9ce5CZrzS+Upz0a66TKAk7TkH2nUfr3wxF9p0b0Ru/YuzIb
         8j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646896; x=1757251696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=eILVt+P+zQbMzZiow/KMY19xO60LYHwyThVlOea67pPFrb6jLAXfghrXyDsd1tH8G1
         +b5cH92IXipDJYlQUvnPYSlS4yKGD/VLgZcvUn0Up/f1F4H+ovK8tBOmC/B77YnnSY5L
         Xan9iBDKHt3JZfWttk0Od8sgufRpcaWaegm5eYc+41+KHDy0PWb1z1cu9Mddrg3j8FX/
         8KyQrs+0/YZ8ZWckIwxQHvP1ZLnSq+RAwTQKwk9uijvqlVEIsQk3FaJ6M4OoyPAO6wVo
         RMUQTYexuLtgJbH17oOF7LqbgKcAeVwvhtyteX9PH7XS1N9k+3dMCDY8GSvuzsks8O7x
         CFDw==
X-Forwarded-Encrypted: i=1; AJvYcCUEigStyHdAtenPsIcJOtwhsp5ft6XoX1GIU4FG2iupFiemkz0+9/IAHE4pN3+j6Lcf3BQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTb3bKG0J3VH6f2P6YWcidZeqre+tKcA62jplRes+pgoZ0Xjnk
	nM4W5nV5qCBNwB/X4XRlbGkaK0hH2taB10qyTGdvyrO9ml6bjZT1tKEOPLgja6RVnF0=
X-Gm-Gg: ASbGncvhJdUwhC5FuU3+fUBa3UoCKYv8D2A8kFAW82F8VafJIy1hllNpHd3eqcTzzi7
	/9LuTXd6NV14ganjR23MFzlWjc8VradJQv7VziGJLr+lNYCsRw0+hnMrFM1ek1PpwCgqY5jDkoF
	uDPM5FADPDYSancD1d3Fw3HayPcUllkjfHoBv5pOIb1Wb+eZ5j6cxEsvkWy+xeJiYYk5nz9gK64
	0cS3HeEsC17Xj5eydy3PpwKJt/Zx42/YQPH+BLdz51xFXeYITMsOFrDu0gt01KjNJgT7ePzLcCy
	gCY2C251y0/dTpJ7+XQ1dTwK5CBUmmm8Scr5hnqhYKZIhaxIDGpUfwLaDdf4bkQVZjVl5u25l8a
	sLagO7iGSTO2J+nEbxtkGud0D5oE1liOc4bEvPK0ZiqampDnW7g==
X-Google-Smtp-Source: AGHT+IHuGuVHHk5pZhTIqaJ6T0pRMpVLKOi+qYDhard/uCHRhDaK8a/HDroJFFPgp6qQQ0xTGeYLmw==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr32007925e9.0.1756646895694;
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
 Varada Pavani <v.pavani@samsung.com>
In-Reply-To: <20250825114436.46882-4-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120710epcas5p421c3c8169019599e76f782bb7086e0e1@epcas5p4.samsung.com>
 <20250825114436.46882-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 03/10] clk: samsung: artpec-8: Add initial
 clock support for ARTPEC-8 SoC
Message-Id: <175664689350.195158.6648344469963977673.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:13 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:29 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-8 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-8 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[03/10] clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/bd5336e3f7040f300b01702215b45e6267a400cc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

