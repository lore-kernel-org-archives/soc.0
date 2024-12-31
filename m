Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719771A00ED
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651080; cv=none; b=tfRJb2+x0SPrRZpSAD9jzS/FPbK+hVxM1bYEo+5rVcD5BkqIXQ1TjaZaLEY/CRvORI1K7tdAYTC2NchsGmazyHKX3IBNt9NuIHNrHCs2A3+AU5+jY4U8GBdeLWFb5AKnStJE96IHkKOBTjjOrwugA17GLWTon9Ls8GMLIMi3E9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651080; c=relaxed/simple;
	bh=XOB3DdxLeKQT7B3j7VApKObYv3yCbJNATZfIvtjOFHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRMDD+zJUei5tbE3umKt4nooKd+NyFsGtIBLxVAJCF83+zS6s7SZSYaPID6DAiaTREhwvkvFHYx2XXB/Ckp15OLi4RLPH5wHmusFxdrlo0u2H4WoSDTeIofiKlneUmjuAyEJqIiCxEXHc6o8niHwZwhUIcy0m+dhQuwO8qiqMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2pcEIyW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2pcEIyW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so15107475e9.2
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651077; x=1736255877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=v2pcEIyWs/gRKU5l6Cmk9TMSt3O6YnA31qbFEDN1QnUD+Sqvz7v32txS8ehalb4o4v
         wcMQpumicBXIHgkk9owRXigd9G99iJiGEAdyJ3QtWWFuvg2cFzp96rC447x/hTCiQ6o/
         axa80zGk8g23QgbbF1xxFL8V7YxKIGv0uCy8UIeuS5AzjVMTcZhJu3QMEyZs27WBpQNn
         idQnI9XmHQGBtc7ma/3mp8SuHs3tSrPu4K+nkfFAz9cePg6Gpwilsgujfpf1RAvI3gzK
         tNLg5oWopkrVwUJxjVClhmmXcyxSUJNRpuFGF5LUQXn8ID28RfI/VZ062SIs9+LNClsC
         t2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651077; x=1736255877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=VGezuPxbraq9oKhCvlHk76X7TTu4JZ1N8kltF6PowG3ng62ZEnQAqdJT0A1w9v/tEN
         T0Oz4NNsZDEuq9puIAWZ1m7LObKWvJlG02jta76mSRs+kyZaxegzUGQgwMkvCGyAJmjK
         E1I9B3gTfpuvYNDSy+2knFTWLLVuDB3d5nO1p6EcLneRMse3Qsy5LyMtSJ0GW9ujCHsS
         lOf4qurRWZHsP2ZlmmAjwhzhJ0m6hjYKfgEdcfOHt6bIyokN0Qvz7FbAzbUnQoRbpT5t
         yKMiedAGGd1IsUGwWXsZ5tqlcX7j+qPJY1dbPYSbG4T/OhY22bfeSuSel3qbtVxAJqRQ
         ZvuA==
X-Forwarded-Encrypted: i=1; AJvYcCUWMrV48eDiysJ3hsmvpAcLWcYhF0Iv5+qLX/pOUrPWgGqT2iAOpKNNEHsC+N0CYw+sQyI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmKgao6JQgUSAeDFqSLw6Gs1UNqPH8JDKUTUsactUGTwMX/UB3
	7p4LjL9tzkrbvv0N8kyWdgADrxVVV/jrI6EBuHqiuIScalDgvBjHpMpNi60m164=
X-Gm-Gg: ASbGncub3alDkenImamB56r6WOqCIXiVb5a9ZLrL0O4AF4A9/hEoiL6mktdYZiTUjAp
	utirexuJfeB+uuCUJBsXAyXVmLCHW5WsrTJ/NkcL40CznAq0yvUXbe9Cmi1ZzHS84UhsKD/k86d
	rVlgQi5QsX2hTmWZdzp39ppJ370K3S44hWoUhBNoQcsfVnix41X79SiVYhKY2vJw5+nZJV19oSL
	9XcT0b6/Nz6mb960aXt39fPrx6be1O0kQ9OVANzzUjPDwR7eLS2QK1/qmzPK+jKBETfsJY=
X-Google-Smtp-Source: AGHT+IHw804talOfXWk2gKgWu9RUYC1DfOft+MhnzFGHwJeLypmOC4OiQ+wNsLYlowqo/W1PfUYEHA==
X-Received: by 2002:a05:600c:1d1f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-43668b602c1mr129738655e9.4.1735651076746;
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:40 +0100
Message-ID: <20241231131742.134329-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.14

for you to fetch changes up to acd33b48ce663c7e293b11cd77df7ea702ca34f6:

  ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec (2024-12-29 11:05:46 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.14

Few fixes and improvements for sound on Galaxy Tab3 (Exynos4212).

----------------------------------------------------------------
Artur Weber (3):
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 31 ++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)
