Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1482638BC
	for <soc@lists.linux.dev>; Sun, 31 Aug 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646894; cv=none; b=SM1FWFYSuE2xEZyNMRoZ/HP3Bw0jahJVSKUiABTzAURl8GjKoZ46Y2u1GUMrKNfGlcKvjXHWJCrax4N4db3NEH2Hnod33bT+99WSGCrQ1VJEXLRWyK4sohCBldXnwUn7LZb6BgIzLpnHqLAqxbj1/Dx7Wq4OYHUwFIZJazGPnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646894; c=relaxed/simple;
	bh=MEVeAxVhndT/7Ap1qgmz1gUcPCdJBlzqawgLrzkMB+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nl+6cE9NcrqMFXcbu7sqytmAh0QWrqSTYiFP67pshHZoXV2OXrMvLczUzAXBqrrfiJNAiqLVrLoRvAt3RV/8ouSjy0PUBEXu0zq+IB+WZh5Rg2j0anMtmhhS8Ab6EMhzUBzAM8qFH9WtkgdAk+VxV54rGdLNrxgL0sBpNoGKYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=loWGoyrL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loWGoyrL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3d323be1617so118377f8f.1
        for <soc@lists.linux.dev>; Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646891; x=1757251691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=loWGoyrLq6uPskAE3/LLvPjY/tCj15Mchn2ZvYM9tY966yi6KdExiuBon2Pmink017
         +9443nFBlCbEvFf/a15VtWHzXnlJIE8LyfwuPqU9tA8MPKB2ZKQ/wPII5ynJNM/IY1NT
         wniGqozEda5BqgGCX2P52bp/qwcq7JO/++aY/GN0BVmQmZ+Ja+DONzh/+NewrCQT6yNf
         no+LfRb92Lh6GPvH/JJdCsA70GhaVGbJRp0yZD10Q3600jz5NYDS0fO3NZSm8tab2Tlr
         inPvLg25y8uVJjl1sMrkeyK9bKfYERmZT+SDHkgqiiYGgv7ItVxS40oqG+cpfZjyVMAe
         V7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646891; x=1757251691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=WGL4Khenv37Vo83UoRDV1dgRbB7m/NqW8o/QlO67OPleG6VyRSJbV5gp/Lrnf3Rbs6
         vj4kkUFrTQXuxCJNwIySl/B3PDPjfmpQFLf+QOjms2LAnQ223vOOwrrhelEwQZ6nozTf
         7wfdxaNN9c7tNW4HSRabOAYEzm88D5qVIXoDmlWF6SFP0101qX4BKJerOUroYnj+xfkq
         d4Zr5Zr1uLL2jVp0Dz0yd0uZ0i2JQFgfNMePnyIaNyDl6PkU1rGqbNg2KMZ2Vc29DugJ
         /PxDWu9aNwzFtcK6FINfE5HhAS0d4meblxjwzEyn/ucgJZYxWW8CfqDxOcs19MGzJYAc
         5Cdg==
X-Forwarded-Encrypted: i=1; AJvYcCVZp8L7WKQBA2TltxPaXkzQaapybNDdbxDGI84PBC2rKt0Qp8toNdZ8VFUnq08x+XHj0Bw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCx/Mg68qHRwV186Y6XwZS0t+dSTY9hlTNcmnKqjz1SxKa/6fL
	xQC/qzVI4d5M90I46Vyrfn4/yD2sKdYkI1ZjXw++XEkz4tE3C5DCNXCmu7cgny7/Z2M=
X-Gm-Gg: ASbGncvKEUpx0Yd9Vk5pUYyrMQC83r8UMYGBHGLKx+VjP3wqQ8lvnECuc+bBTuQ/onS
	pu9GxNCCj1YbXvUiDlYWPdif6WUidfgKf7FRSDYZgC6MK0MDrLMHl2Xo6Fk8IzU6ZiASXge/WKg
	00OPPTNQ+vbGzd9LSJw85/xceM4kMsiWCJ5j6CuuFwK/22zjhoYNkkFl5VzuMXF1oohr+ykgotK
	d1dSSY0sv/OBtHWrQJojxNR5eVGfKWUu9W2LSx5lf0r3yTQ3BQIwskooFK76T9K+FjrRq8L1UT5
	BY+1+HrUIiSx1jjo64W4bHMsRePCvCTIvTRZiuc2iMEE4GWP2HdNG1DLm6/345olMv0q33Mvvkg
	/vuh8eNB1sVi+Eusq0iZvOmd40TgnW3iR+8rvl8Q=
X-Google-Smtp-Source: AGHT+IHkPBdwt6L3VH7t04bp7Le2oXr0tHCapltVXb93QgdyVU4QJ8bZvFGna7E4/zYnUQGrTwhkug==
X-Received: by 2002:a05:600c:19c7:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-45b802c57dbmr32352025e9.3.1756646891177;
        Sun, 31 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:10 -0700 (PDT)
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
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-2-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed@epcas5p4.samsung.com>
 <20250825114436.46882-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: clock: Add ARTPEC-8
 clock controller
Message-Id: <175664688891.195158.13270877080433356384.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:08 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:27 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: Add ARTPEC-8 clock controller
        https://git.kernel.org/krzk/linux/c/91f98de42310c70f9a23595b3b20aa305717d955

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

