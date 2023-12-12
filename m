Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DFBC4167D
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC7CDC433C8; Tue, 12 Dec 2023 19:39:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF64FC433C7
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF64FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so21052145e9.3
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409965; x=1703014765; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzatjt4r0YJeTezf0VgwrU2TmLicfYhSYlspY5uEu3k=;
        b=H2k0fI578rPg0h6Sw7CtpGdtxIOWPPcOspwJ/MY8JDbBkeB0nzwKkR2SwGqc7jvbk8
         ABFJ7DqVrcFBOiFa8lKYg5VQfpqN4bD7IxabRvPT5GprxLGSaxjU2LbPWD7tpGWY+o1M
         vjDflsJ5xF5TMDdBWBJruX+foOa6GtmEqLa1JkdN0e3ofudgpCm/vDDdluQEnYgKVAts
         MwolNq1BfaBD8EG5LyrIUSNAdSK+DrGnqmy4G4K20GOXNieLW1ctrGVRW/cru5+hsGLB
         IgvtWYbqSlQbE+k1MmSf/Fe7r/0qM2tlvQThskIN9Fd0ptM63b4P02xJQYE722UK671C
         5KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409965; x=1703014765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzatjt4r0YJeTezf0VgwrU2TmLicfYhSYlspY5uEu3k=;
        b=hI20BB1MLFqUK9ySZWuGrLuLZ7iusHzLTOxdskyWCMcN0Ddx6KGjz9RFEKdXKGJd1v
         vM2xcW1Mws+p92P9GsT6Xr9F/iDKDDnNM4wz/eWBKt6Tau3uMHaE+qXZB/Gw6cyoi+TO
         vt88aZBQk4Z5f4s96f7PdB8WDGfqt2BmJf0nZb72vGxYVym5mWcgE7VPXE7/02iB9zAK
         6Ff3oR8mLNC8AlQqVHbsllmIvUAQjg0U5k/GZC1Ps44xtjzEv55LjSYCTsuzZnkBXFI7
         IrVgtbKAmlqZZBsz510GcueNjZgQCxWrwibUEmwyCdk6EUEYTZHsZXhBfWwIsIVzloNO
         l8dA==
X-Gm-Message-State: AOJu0YxBCyrSmVTbzk7uElTKDeq5xmzYHT0SZ6F9V0PASKBVoe8ciZci
	4zWwVTVjJqqeZlI91ZPRAf7vuA==
X-Google-Smtp-Source: AGHT+IExqguIxesNEgHsaolxmotlLbzMQysC3FbvqaGIWeGrARbpAWQMYBHhwo+guartnGUfkSkRuA==
X-Received: by 2002:a05:600c:1393:b0:40c:4b43:d98e with SMTP id u19-20020a05600c139300b0040c4b43d98emr1834457wmf.84.1702409965061;
        Tue, 12 Dec 2023 11:39:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:24 -0800 (PST)
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
Subject: Re: (subset) [PATCH v7 03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Tue, 12 Dec 2023 20:39:12 +0100
Message-Id: <170240988143.242356.7915762427739298874.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-4-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-4-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:18 +0000, Peter Griffin wrote:
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
> 
> 

Applied, thanks!

[03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
        https://git.kernel.org/krzk/linux/c/bad3bc0a23b74e7b353978b6f58eed6c0f3b51a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
