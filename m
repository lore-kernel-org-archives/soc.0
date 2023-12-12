Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FF4C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 518FFC433C7; Tue, 12 Dec 2023 19:39:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE202C433D9
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE202C433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c55872d80so4577605e9.1
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409971; x=1703014771; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbsTXFKXTrY5tLa2ITZ+RhWD1cGIYo+QvwAZu2caETo=;
        b=ah8GbNTMIRuBLKfxrqS78CZFAhhlqCfceyifpghJK8VhOYpm8orJvIoe7OnmM5O6hx
         dRzM6xuEHK4so7t+qkxKqcywnNzKsD8OTA3E9hDJfCoHC27Zxoff1aDu2tVK2JzgAFyM
         OHTPSL7IqUxK1DzuaSpyIhuohGigjfnIH+kqImk+moe9fS/n/DQo7TGy0XL9k39elmNg
         zB2p5kgvUxVyjfG2pCDwgUCWJZW1PqRKE9mIa8OwxOdKCys4hdcnGWB/3g6gGclJxn8V
         vE0jhgcPa31WDRBeDKHrT05flVMB15s2w0tiB8FZKK9c3ZyEKpl5WyT4d8eHLunIPFOB
         uNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409971; x=1703014771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbsTXFKXTrY5tLa2ITZ+RhWD1cGIYo+QvwAZu2caETo=;
        b=LLN6ims4gL+QfdRoKZg6Ni9vG4LIwDpbGVKApy93eViQ4/7+2qS8K6MQbCpqIqYOGb
         TYhG+BSqFQ1bFenMKlCAQxoEE4wcdjaPhiS4U2h0AO/CMqzy8W2T+0mll7MM9tqofqpH
         R9zZnze65oGJfoD4PL8Z8/90GjgtuSCT/HDxgGr4Y/gZXICxG69mVL8zfo9YiGFiOs8a
         Kvl7g1frzC+1TTt5doZv5Ri+L8+p1v+rqMf8Ajqtni0AwRpkl2t7gbVDg/jqm9ByjE+Y
         4cUiN1zcZtwsQjMmwcS7fMUY6BHtcfcnXsXWQD7UDd02K2l/2N4Tx+Wz6avykRd+FQnf
         p9Fg==
X-Gm-Message-State: AOJu0YzMSZEBAHxBTgty3eJNHDhUjMTHsuzaPSIhuA8Wz5R8o9LVEWqX
	FzUYT4k5GF8ibZTvME/k1gxJFw==
X-Google-Smtp-Source: AGHT+IECFv0mPrPqCAXunm7Vy99xWj4CTFmeC1IPksAqK1hsqYuerO0HXIHbmdgpTQzRxFSjYbcuEA==
X-Received: by 2002:a05:600c:1656:b0:40c:5822:133a with SMTP id o22-20020a05600c165600b0040c5822133amr254490wmn.69.1702409971213;
        Tue, 12 Dec 2023 11:39:31 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
Date: Tue, 12 Dec 2023 20:39:14 +0100
Message-Id: <170240988144.242356.15535258892382463057.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-6-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-6-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:20 +0000, Peter Griffin wrote:
> Add google,gs101-usi dedicated compatible for representing USI of Google
> GS101 SoC.
> 
> 

Applied, thanks!

[05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
        https://git.kernel.org/krzk/linux/c/d793f7c471fb1cc9b5cf5aee5484f4231ef48dc8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
