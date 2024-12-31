Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42919D8BB
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651078; cv=none; b=GXnDhZ5bCrAi6Db/LBKUIjArTjSmJE/bBemD2lrAWFi+ult/jL6E1BwOB8bDKdB33QUIQMrtgGtoAvV2jzmGTQAFjUNCGQuPuLdOwiDALlObMoBJFcFVhKkoncWcltm34eKMQVZpZNeiuqOMYoo6RHLENZJr7WGSWfHXUJPx3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651078; c=relaxed/simple;
	bh=lXuFYVatNyFJ4wB/b1+2Rpi5zJ331Okt17cFbvKPAro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM5WyRE4gJyqBi2TOAVfUlEzSo7BHE8uLRN5birlFwHQ2nWLS94imdD5hETVYetNYxHfrSuq7m8jpBG0+z/c3uuY8FYuSR3zgWcs/6ZoSmK44q8Gcv0QIVZPag0Nho9pKYBPxh206ctBSOvOSFHcBEKQxuznYxkLoScN1fNnqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9XUZw+N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9XUZw+N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363298fff2so14885065e9.3
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651074; x=1736255874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=Y9XUZw+NjNr0ywS6vrptJCs4sQGNgGVD4YnpBAbSsdlRR56movVYH54ePkp6Md07A6
         S3IJAFK6Nd9dqPoNSQm0fhtHua4tMbF6iRinbwgVGyMH1SX/cE38yzRJR3672CraWz5r
         x+gmMLprMS7PjiPUVypIUirLRzPYUYOEQXkiWT3DARfKoJbFlY4xl33ssNIL6/d15WpY
         mMZmSI4UQZiuCVdEoQoqg03uekTfaUtJB8uepSfeUMRNIO4HSYC2EUBKHbljbx+CHc//
         exScRj0rYarLBLkfWWr0bfnb2bANdqIMvOdkO2Gs0gz5ttXRlF6CE8xFa+buBeyJqRFF
         qbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651074; x=1736255874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oePPkM2EZb5KL2UMInv1q1keKuOWLPm8JuSZY3EdJrc=;
        b=gQ9+E1V7eq6ecqMTD5SGmVhVNfJddI6If+cIJFz3kkWBdDaIirtJJzH83Ldo5rn5ch
         wazSQi8xy+Sb+yoi5pPJyggTNNhW0rn8nHzFefbP4hejM5+q1b5j9m5iQaS/6EEhrG2H
         kjZHfuU9LmZzvAQ7Jxu1tjiPySK0d3g4oBYG/VU4cYQt89yBiAsH7NQuJT/gOwzUUNSm
         8j8xFrNLisOcpsB8Y7rUcIvXHDsDqyjk7JquQvQDH4JmUfymz7Ce4nNzxGFQf6ZEA8A5
         fSwagOfq/qvcUETndJaGb2Y7rGjBYt+5TAc3DLz1M97arwtchUtVbr5IxXg3w8EZcjfK
         o3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUwgr9TF/cwCHP0zhfbV4rTv6qQkPcCpa73MwMaYqf510MIvYNBcCyGbDbOFpdgzkoAtl8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxupLPoe6fkPIGSCWEgNOM0lLptF5EjPsMW4qYPLLGBkaj6iWyX
	5Uk59SAFuP/Yzj7VSo4ae0PRiugVuMpiL8epIfRHl1Q2bE2ywJ8BkHVYDtd0IUo=
X-Gm-Gg: ASbGncubiEbtvI075ESPEbdHr5KMaWNkUQtbU1Pt46vSXcjYiFXT6FQ04k1gwtHA3Co
	VMj5bv/9RWQ5+HETYj8QVB9atBTMCPxEW7rPC0oK7o28osO7YEn+rdPYS2HLYJ/i7VoG+34CYeK
	Al7eVoOXAE5VxgDhFk+1gcvB5zJ+vz704YIf7NAsSPT0Vaq0kml4+RbD7RakXyE/XSpQBgjtkCE
	Z04nCekcC2TjrBwlzlL3RYSmKj5DvoBklGXkmmVqGbIGm29nw6Iu/4eWw9CYb1NSXdj6jo=
X-Google-Smtp-Source: AGHT+IHwIcO30my8NO1sVZZTyNw2buq1F5yrDPPMvhxLCGfi0UoB+FAXsU2f2Eydww7uhdMVOiJeJA==
X-Received: by 2002:a05:600c:358b:b0:435:192:63eb with SMTP id 5b1f17b1804b1-43668644155mr137490065e9.3.1735651073685;
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [GIT PULL 2/4 drivers][PATCH] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Tue, 31 Dec 2024 14:17:39 +0100
Message-ID: <20241231131742.134329-2-krzysztof.kozlowski@linaro.org>
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

From: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Add a dt-binding compatible for the Exynos990 PMU. It's compatible
with the Exynos7 PMU design. It handles system reboot, as well as
other system control registers (i.e registers for the USB PHY).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Link: https://lore.kernel.org/r/20241204145559.524932-2-igor.belwon@mentallysanemainliners.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.43.0

