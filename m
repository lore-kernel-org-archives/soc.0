Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD178F2E
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152301; cv=none; b=LInhbA5oJr8an7u+PvioG+bLaElNIJFSVrS5RlT0XRb67Bfp7kyLTZXLoHcgUEE9WRhK4ABhxJfPqKZh/r1mtaXKND4GafNLvP3Fl3hleD+/uu61OOWQwDXy1O1uzAkHW5b18Inku+oJ/g6AthvSm05lFFvGNzj+y6AO6Nl6DWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152301; c=relaxed/simple;
	bh=nfi4X8b8jUDopLuQk5Ajzv2GDEmfsvIUfaXtQYfIxYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDRUZ+XcE6Ed7dcW1w7m5zGTj2IBWwKRH8jt5QupNTuWau3WWEsGcYpec5aGoOjEqzU3AL0jDnNxDKcnKSBSeUfCckxReZJPFlACAgkSP1eTCeSZ6cWGS/9/bcrZhJraFs5Kv/Z1OFNXh3gpfp4iabJG4YZXeUef2+H76iKIeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Yh0H7xwd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Yh0H7xwd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a29e6110so56859395e9.3
        for <soc@lists.linux.dev>; Tue, 14 Apr 2026 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776152297; x=1776757097; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiVB1nUUaTgLHnOiDu9/3O5El3WjSoq5GjXvTnCDSVc=;
        b=Yh0H7xwdS1ajbXeOWh3pe5noPjsJHauiKohYGqKZ8H3LthQxiEnIHXegCYco2kIVqR
         3t2SnBD1k7E+H4fWg+LZKfQAtP1Ai4MM4FrBlNyKWmb6jyO9lmMJnscAsXwFz32itxia
         t7mHcFP9CrSMOtJ8E605fEGCUWMdR0yQ/5SyU+5oJnD4waw8zKUkSGxzilhIhKmKrzO+
         bRI3+O/DRAsW+nAYqOwx36181OjmSXey8ZPuzSeWd40tPaPQAnz4jPH6v6hQ5pxtfBNS
         2HsI99RGsSvwDX4xKC6d1PPPjohQxOFyP5jSwpXiDjCYpKXcQ16fFQZzAgM1LKgJccbR
         HXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776152297; x=1776757097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiVB1nUUaTgLHnOiDu9/3O5El3WjSoq5GjXvTnCDSVc=;
        b=HAFMSPzPJafVKQ7X14qfkd6eG0x9NJx3uGDTOge3MnNMDVI3WS9GRg8/ek9KE34DI7
         qdQln7TqF+nygEm8VfGXu55LWCyNAdLEMGRd+0BOqNVHk40+7ldHKe4tN6GWIjbqwo63
         Ay8RgaKf32ZU2a3xLP0+NCn30dn98ZlSUEG3EZNP6QWcxctVcDAKCfliaNhik2tEE3MQ
         LrQx+v24PRpW43xq0NuWJ35ckZbuON0v86dfbnwk/oVMHx968McP3DAB3oExSySUkyUS
         ACUw1JSaVnAhKy8erCkkNKoBV/LuMDeYlk7uMnYvP4YeW7NzXPU8rBsAkdB9axr0q8yn
         J3yA==
X-Forwarded-Encrypted: i=1; AFNElJ8hlHURRIUgxXcK0UO/qSYnTmkIeYVDhPme8hG0T7MNfRjcPNB0OOc0MIRBtbP1ainZMwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YywGZSdodJr9IoMbZbhivTW9fPHDUi/UOQ7WIXX/kutsH9KkYSJ
	CK8CZro+skde1SsfGW39ux2uQ2kqZWnIAsvnhukZo0MnPp0KtPS2X++CirqMmHxCpMA=
X-Gm-Gg: AeBDies2pieI5YMAulBwyfprmqqdA3ro1Vn6ElCjPxo2klMl5Snnei68H7eJ53c6GZG
	U1NVxRWKQxqP3IbR4FYswE2ppjLK/n20WZWs+Xw6Ea2vOgHNJVMYk/IaXXrq3AnXkXAsWsXFtPH
	mm/+fhM1x5P+akhn2R51BDqWxbu80WaxgYyzwbl8sJnwk9vcrzaH/s6OXm2AyWRy9uigKsKda+A
	DcIoQ7uZYarPHApMj4GybxW3CMvnWZTw3+0MDpFwmrRIBB6qEUT8cfLrg10FfSYJSwYUyriGSIj
	RZb7FEALBrkuQW6u65A/pZb7xI+GyBCgw7PQE/MhuSzrg1oADUCCCKRjL10azqs06dBIcGT0jPM
	CeqbNNNR/7P2smgkFrf8SokXxcdCBNaFp1sHjVdXVSIxESeJ1mzpad8NJ890kEY9yL/HiPRWGVU
	+sV+UARoOreTKDyR2+nV48g7m+6Hvg3p8=
X-Received: by 2002:a05:600d:d:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488d67eb7a7mr170044495e9.1.1776152297303;
        Tue, 14 Apr 2026 00:38:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e826sm64458585e9.6.2026.04.14.00.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:38:16 -0700 (PDT)
Message-ID: <09085eff-ed71-42a9-8806-a9748d2fcd61@tuxon.dev>
Date: Tue, 14 Apr 2026 10:38:15 +0300
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/26 20:12, Krzysztof Kozlowski wrote:
> CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
> Standardize ASoC menu") and can be simply dropped without effect.
> 
> No impact on include/generated/autoconf.h.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
