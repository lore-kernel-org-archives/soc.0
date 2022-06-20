Return-Path: <SRS0=5Cdg=W3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E10CCA47F
	for <soc@archiver.kernel.org>; Mon, 20 Jun 2022 11:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88287C3411C; Mon, 20 Jun 2022 11:14:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F4053C341C8
	for <soc@kernel.org>; Mon, 20 Jun 2022 11:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F4053C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id mf9so78679ejb.0
        for <soc@kernel.org>; Mon, 20 Jun 2022 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ClzjJShbVFx8TaQxCfkeV22/Wl7HoeIA99LoGmKA+g8=;
        b=JbBGfXGBvpV/uk/dk4gI9PUkSHtjiE0n6+v4S+HKY8ZkglzgWdAERXCGgfP+Il/ckR
         tENuRnPpbnOIl7roKYNXVPtDdEkHS1LGl0H0oy+Jahjjhc5d3+sEyzb8wA6kk39sMpRj
         1Hij+r/IT9yIrpYmjZaIFauMUOR3ZHdg8NI/txVus2RPesI8MnkiHEGcJcEmRzhA6uo/
         JpSxS+ToNCDSQgmkYQlL5Fahxk1rbnnotErqGYbC3jvBTit02+oNx+xGCiW1FYaRQY2A
         hQRBSRjb7y8IKFI1ddSrzCy82n0d+Y4j13z72UIo3IIgR9fYMk6qB74PuqgTVMWR85Gm
         QEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ClzjJShbVFx8TaQxCfkeV22/Wl7HoeIA99LoGmKA+g8=;
        b=05ZYGe88et9COqaPygBzjQcO9k1zEiwQxPJYWMH5jDiVwcZCOP0PmQmqRaJTNlOCej
         cSngjnbRw3ZwFXQGJ1hTehs50np02zZV9hHwrhq8aD46l0Xdc/njoKBjcoy1+FnB6fkH
         mLVWQ5vLHMfsGbYKb9tJe1DquJyUf45YCL7r9GHxjkRqR5NGzuIRXKfU99lmDE8YVo0F
         6dxaOSyUORksfAZn7NsDnihL8mApJbGXbWqo/QadZcB+BIFwL3/PHoqzn/LmCz+rdMq2
         xZhqMlYBqPox7sipG1KxGvqPG+ZLWFMsPkY1+zD0jvziInO/EB2/Zxti+oLzfe1uHcCQ
         UrlA==
X-Gm-Message-State: AJIora/dSaXoN4Ind+lfWAjLBuqLi/EmFKvhkYcfSLM3V3bbVZ3fKHA2
	aPPgXeI7KvYYmKznfLZdWV3O3w==
X-Google-Smtp-Source: AGRyM1s3OCH1IXHmN9/QkFae5Zxbc8cFd2aL5mfxKeMADz7GSrTDrB9hE+rWIu/Wws4tYGNcmbhvmg==
X-Received: by 2002:a17:906:730f:b0:711:db1a:fdb0 with SMTP id di15-20020a170906730f00b00711db1afdb0mr20529013ejc.54.1655723683183;
        Mon, 20 Jun 2022 04:14:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906171a00b006fed9a0eb17sm5699969eje.187.2022.06.20.04.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:14:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: (subset) [PATCH v3 10/40] arm64: dts: hisilicon: correct gpio-keys properties
Date: Mon, 20 Jun 2022 13:14:33 +0200
Message-Id: <165572367262.35195.3017202631161821565.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-10-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:03 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[10/40] arm64: dts: hisilicon: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/717b3096da2ea205c6f31b4c2cd4485671d6ac79

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
