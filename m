Return-Path: <SRS0=/6xr=NZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7793DC27C4F
	for <soc@archiver.kernel.org>; Sun, 23 Jun 2024 12:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D9EDC4AF0C; Sun, 23 Jun 2024 12:22:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 190C5C4AF07
	for <soc@kernel.org>; Sun, 23 Jun 2024 12:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 190C5C4AF07
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217136a74dso27935105e9.2
        for <soc@kernel.org>; Sun, 23 Jun 2024 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145352; x=1719750152; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb8ny9tIcXj6YkhCaKESC1JpcQVyglNrA+gup/lxwkY=;
        b=e6eDHV7c+2zT+DTk34xy/2Aq7+B5QyMjnFvxfxcGaEwRiYeTr10zRNQWKhJcF4Kqrq
         i8e+wHrQ+bDQjfyLf7+/zJ5GWqme4Dkautl5mwLoVaiBlwQA8JoITRh1wJDFOsfc1ocr
         TAmpBXo1kV9wGHQk1Otts42HOK+Uhgpk5YtWpR/zkFgwoKwqTYJCpFXmSjIPLU0hFTtp
         /JmhMxEjEZkNunqhskJhD2OResqKZJhnOP2romKUUDax3Jgw0vWpGgZP3hCfPLDacqhY
         9b1vr1BGojNbi1k0cfZHOj4YF8vhHA3CjZy5S3F0ZZdpit9JZ7/vKA5oMN9NOQDzm+sm
         ymGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145352; x=1719750152;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb8ny9tIcXj6YkhCaKESC1JpcQVyglNrA+gup/lxwkY=;
        b=Td7D5GDTUTMJJuD3evFSV8jaGAu+MiMiXRwDzE9FYRTMhAnaPT8RifdovsJdfhUfSW
         /u2WylbfJeidZaMUYI/TM8Ne+jy8QREoAK4jxgD4yWquQ/hocfwb/o8EXuVTLHSS+wnc
         HmxcGfPGnmZ7XFrxbmBHvkyMyB4IfDgDsCflkEkFU1v+PWYzxautGDooTZRfYHGjHdGY
         flv8eKMG7i6l4YsicqFxyr+GUFqcs/3T+tvc5yhCBcJbwlmRvMeBHJKN8N46/0AUWNVk
         cxEuPi1upDBUYHvoynFs2c6j/Fz/AIofq6JZNq1GUw2Vqjop4GUGFW2SVAJarVm0BSHJ
         CsPg==
X-Forwarded-Encrypted: i=1; AJvYcCUoz2dDI40maHsmQ1yQHTp3fH0IELkU+fFhhJxb4nXYurmov22PANo8hoH7hwDaEkIMc/eNzVNwowj69DJcTw==
X-Gm-Message-State: AOJu0YxUqwbb8WBMoqr4jKB0TEuroLeVhH+R92L7KtzZc4n46oAiQbBz
	njQ0pUFTWXNkUo8XnBS5dfN938u/Bh08PwwxaVNPc+5aCfRe/UDv4SnCdzX8MMGl/aLhNo+h9xW
	m
X-Google-Smtp-Source: AGHT+IEi6pdBP9htP3q8cAH2s+06i5LtrSmdWnhYi+tkfC+1Av2olrSw3T8JlNjH5jqv+RNrmHXLTQ==
X-Received: by 2002:a05:600c:2ed2:b0:424:914e:3e64 with SMTP id 5b1f17b1804b1-424914e3f43mr496725e9.28.1719145352062;
        Sun, 23 Jun 2024 05:22:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm136955455e9.20.2024.06.23.05.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:22:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
In-Reply-To: <20240613135956.8899-1-krzysztof.kozlowski@linaro.org>
References: <20240613135956.8899-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as
 maintainer
Message-Id: <171914535096.46985.6140109226251749754.b4-ty@linaro.org>
Date: Sun, 23 Jun 2024 14:22:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Jun 2024 15:59:56 +0200, Krzysztof Kozlowski wrote:
> There is no maintainers entry for the ARM MOXA ART SoC, thus patches end
> up nowhere.  Add such entry, because even if platform is orphaned and on
> its way out of the kernel, it is nice to take patches if someone sends
> something.
> 
> I do not plan to actively support/maintain MOXA but I can take odd fixes
> now and then.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
      https://git.kernel.org/krzk/linux-dt/c/4c54173d5965937b9e8280b7ec900fdec65d0c36

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

