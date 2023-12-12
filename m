Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F8C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79BEDC433C8; Tue, 12 Dec 2023 19:17:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B454C433CC
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B454C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a1da1017a09so733407266b.3
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702408641; x=1703013441; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q81f6tvuC/62M26cD5+zhpnHZ0bvi1DcQhgd2N8HT8g=;
        b=gIVad3oRenr5yA1SjB/8dHjiTJR/m10exfeJux3e57STlIpmLmL3ZW/u3hiYwzCHS+
         jhuE9f6nj/iBxW4ZwBa59vqa8Ee1ikfpS0qbPfg1UJ3tnmYnNUQ7hCSRkqMWZxZdNg1R
         bSObMuGHgWvHGGTwRG/g8bUqUk0Uof2nsdmGnwmUJzNqnNnVK28Q7B8vHie2B1LwSJX3
         fMh+x5l+YBN4LZdliYXlfvZCaF7cBdhsuE3p9UMqAfJzWl6mFgJQvESwrwUq0UqCu/NY
         Vo/dIhJnb4EJHGm9aJHns3DMSPRTdaRGAUWmC3kWipMWVDPNSOGvmxZU6EMrZ3E6tr4M
         QrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702408641; x=1703013441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q81f6tvuC/62M26cD5+zhpnHZ0bvi1DcQhgd2N8HT8g=;
        b=gLokAcfVFtwFDJ3MFxB4HCjmdqhwf2U8y9P2acVG9HLWhqfxEnt7u6vajjfaFc3F37
         JHsmu8WDUYa8ueS+qxpYY2NDsUOURhUBgxRbl3cmJnQCOrTlAzxaZTFycubkireshAVu
         QUHo0X4boVcRuCM2Nath8ly4H/6YhSxGNf6CjBFA0ZprBz7UqWSx6CV6LLpTLIKcF0bJ
         b2P2rpULmp6zLcSRPVm/3+XufiHYeIGgWX82P33Oy2ToDrz4jISMjAiE56lMXWfjVH50
         R4R2Ndm7NaB/uz7xWgiArQK1fhTgPlapArv2rAnEgCbCW3VNxWgPsQlfW+PU3MH2SvO1
         MFQA==
X-Gm-Message-State: AOJu0YzGUqAnn5iganM3gfAEFllRjgMfznyD/cyMWCpXLgFGRiyNR6ga
	nGH6wzplsQRf98QTLPC9s2dasQ==
X-Google-Smtp-Source: AGHT+IErxwGD3BlZkSUookdNqWVQz7uPq0j3jdF2YUIwZl8jPuzuYHu/C9CZmUM1+hb143ssA3PhaA==
X-Received: by 2002:a17:906:6a19:b0:9d8:78f2:7ea2 with SMTP id qw25-20020a1709066a1900b009d878f27ea2mr4682806ejc.54.1702408640691;
        Tue, 12 Dec 2023 11:17:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id sf22-20020a1709078a9600b00982a92a849asm6739126ejc.91.2023.12.12.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:17:20 -0800 (PST)
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
Subject: Re: (subset) [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date: Tue, 12 Dec 2023 20:17:15 +0100
Message-Id: <170240862865.229534.3131999037082419524.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-10-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:24 +0000, Peter Griffin wrote:
> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
> 
> 

Applied, thanks!

[09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
        https://git.kernel.org/pinctrl/samsung/c/4a8be01a1a7a030ae7b6138602d2e060cf7a0946

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
