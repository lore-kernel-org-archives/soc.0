Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BF25A352
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284679; cv=none; b=o16TV6dFvvgwu+1l48UJ/wQXd8qqLrmuyrl+YK5uazlk+IXGKfeovo6ghLueulBv6HviRkecYKb/zZSnKmAQW4WD3TSvKZpWV/LSt5gutQS5yREbMLHwHcoAm+tO0Ewle//DhltYWOdCkC7spSKb0DM+KfOB1O2iON+fs/bKdNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284679; c=relaxed/simple;
	bh=JbH8xjfsf6P7OmD9axfTwXfSPdYjRzKgiAuZzz5MlcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iA0vynEwudcsRGBjVjSymNyqN+9UaziYFfr/iNsK2eCwgiZZtXJRBfgv7mba+a2f6zS+/FxRWEg4/eNq5yUg0RqTBxoK6nLoz4t0d5i3g+dHtSJlB/x2KGbXTKKhTivAeKL4O0lHiaDet26DxEb5x5e/kA+KJjI3MkMl6gswkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWqQkNfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWqQkNfH"
Received: by smtp.kernel.org (Postfix)
	id 34AC5C4CEE9; Thu,  6 Mar 2025 18:11:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 284C0C4CEE8
	for <soc@kernel.org>; Thu,  6 Mar 2025 18:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 284C0C4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso87537f8f.2
        for <soc@kernel.org>; Thu, 06 Mar 2025 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741284674; x=1741889474; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=cWqQkNfH2Ch04fNf5YUYGaTeHqaHaPtOAL7o9/EIe3mc64wo5bY59ucyNKer4JPkY+
         HQQI+jJavCpr98VJE4XJbCVWJacwtrEsgT5Bek03/UWTR/M/sE5K8RxaCpv8iG52XcXy
         qQw2ZrIYTyDZTJ97tGZXqLeFf3jNxggkR/qqvA2m4ZmHLH9niiIOaGGdwJZv67n6g/kA
         K9Zfp9uteYcZY040BqsL4mZ7lK/w7NFIdYRF2yzcscy71ntmBk2NqNLpB3H54CVxUJ8E
         RcR4h4g1TM4BfcMUSJRMmqokicqKNqxUtq3wRHmvq91uIvjICetuNMaeQngp1LJHDbTK
         59Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284674; x=1741889474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AnLds6lWEOgctovP8rZZIFlWYH7eclRkLDrgHTySwE=;
        b=HwXl7+28jgtghz2+Qiw5ryCdsu1llh7+n7c6fAG+CZm0hdqUQARIRoOtYAs/caiL5g
         FQyKQD9EVPw/kGSSIQygIqTlYd1a05auIh86h04Tq40KE0GtN2S1rb56mf444K9tsUjk
         +mnIW0M3sgqROW2OtR7zakcldHwAME8AKaFJ5eJ3N8+cmhDBx5K6Nndg+k5awxjL5BZ8
         fM+YaXlihGeq//nZjnmA4S7GQltoQMI8VWQjZbxcrcVofs5OLGB3zFd9g0EB6fceyLUy
         Fj6pKgwa/HbzPfFXAVm5adowGpX0/AtJHmR8hMvDNSdUoHQRcDimXrw1qN0SKmAi+6Q3
         w2aw==
X-Gm-Message-State: AOJu0YwBK6cEkhTbAJ6nKHEzbZHzQbgIQemb8XRZTp1xp1D5LeceORyn
	45NBUzYMYQnxprh7Yp1vDctQZkAq53uSVcL0nbKREkpU2N8pgJpL0NUKWnwt6hI=
X-Gm-Gg: ASbGncttPI1XLb2cpcskfExqf4243SnhJDm9AlGcMAj4JH6AjWCB6NJ7E6TEg9LMNop
	tjiSiOf11kRjUMh7ZjiubGvFJM0XboNltAT5s02/1+MLXYCLcsCko4XXRm+jBtaRHwZawJlopEI
	aq1NKU2ohk9r7LVVeeGqqPKD2R579mHgCyoBr6+xPpxfT1nFX/BlXL0sb3t8JjWgfribXSLO3mb
	CvYR6MKlYICkjOJa11f0kgUPswN3Ja2KtDR4kCH2ViKi0vVjYMVaMbh0GrD1dVH5KqNJ9qjJ1To
	8d8B+IMvznH8pwdZRp14y8fwDOE7hGtzbz3CSXkK9VEMDD6QTiaDt9F+mbZX
X-Google-Smtp-Source: AGHT+IFFRvwmZacRwHe9yk3mbn6KEKhfILWjskick/fV1fIsJkk5zhEz8ZiB5cRx3bewoTl4Sqa/eA==
X-Received: by 2002:a5d:6d8c:0:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-39132d93f92mr48151f8f.9.1741284674274;
        Thu, 06 Mar 2025 10:11:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1027d3sm2716967f8f.83.2025.03.06.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:11:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250305211446.43772-1-arnd@kernel.org>
References: <20250305211446.43772-1-arnd@kernel.org>
Subject: Re: [PATCH] soc: samsung: include linux/array_size.h where needed
Message-Id: <174128467279.252750.12742713284242817976.b4-ty@linaro.org>
Date: Thu, 06 Mar 2025 19:11:12 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 05 Mar 2025 22:14:02 +0100, Arnd Bergmann wrote:
> This does not necessarily get included through asm/io.h:
> 
> drivers/soc/samsung/exynos3250-pmu.c:120:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   120 |         for (i = 0; i < ARRAY_SIZE(exynos3250_list_feed); i++) {
>       |                         ^
> drivers/soc/samsung/exynos5250-pmu.c:162:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   162 |         for (i = 0; i < ARRAY_SIZE(exynos5_list_both_cnt_feed); i++) {
>       |                         ^
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: include linux/array_size.h where needed
      https://git.kernel.org/krzk/linux/c/4c57930f68d90e0d52c396d058cfa9ed8447a6c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

