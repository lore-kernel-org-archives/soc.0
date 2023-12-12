Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C6C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 686EEC433CC; Tue, 12 Dec 2023 19:39:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A66AFC43391
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A66AFC43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c3f68b79aso39913535e9.0
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409974; x=1703014774; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIEVZua66dJf62hRcdu5gWR03a1O3YurjttfgMhD8K4=;
        b=yNKwdS82Up68RBdUuvqhVujZJW4mPhQ8o8HGmkIK17EKz4pQldAGfVbhL93H8Mtlpz
         DBsvHQko42rSA5Cnu426/t6d3aDtB9xVl3PS5S0pGh82FQi3bdKXjWp2lslJ0kxmkL2N
         +v+ouuYEmODT3Jgazbd8oB2s+KOBi+U9KoL7qsha126wtw0hgYJB3zfcfdokUoHtdZ4q
         tyYqfY/XpaIid6/DVBFhwW+UgsZnP26IyBKiR8FGgFT04b+8vr33m8+tZkTb02QtxBe7
         htBduI9W6BJv/M1FuJ1hTafO/DvQFveOXD8ahgnQj0Lblj81p+Tay0BZD3V1WSrv3H/Z
         UxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409974; x=1703014774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIEVZua66dJf62hRcdu5gWR03a1O3YurjttfgMhD8K4=;
        b=nhPVAWDIOmjZiyONn7l9EmlBQTlpm2qwX2N++K3IdAmpjM89SGxGhZUiXZCCxbtdK7
         G1WevlghQS9+C4ELzVcIvSkzzEk06H7onIFR+KASoStkuM0vSrna5f96BlgFANsLxVao
         cgMEtW5W04VA+m7zGT5QttDY0cy0XWHsaKb38ZNLr4TiSt4kDy7Y8K6AYJFLua7tF+l8
         Qqm5AwvBQONH5pqrwudLvZ8fR3h5WklDPIqLwlYUPcbWEFY7sZ+DWXnOucmppllm/Dm2
         XUrnh4vq/r9HX7q0AZuMvoYHvkVPbL0l3SKja75za7oOrwsaQYcMynsOSvTFnpwlSzv4
         wZTw==
X-Gm-Message-State: AOJu0YzcLQ3Ss2zyFP62cFmzi1r9BKN9mvxZkne5+gzdVsLxHhQD/DZg
	X0hh8K+XjKsrtkypw/M+YJ4JqA==
X-Google-Smtp-Source: AGHT+IGV2FkQnkPssClmhNRgr/I23fgepxPzCfthBrS9nBE6X3J9ouT2HGSEDP0oGjZiIEJ5kFG62Q==
X-Received: by 2002:a05:600c:9a3:b0:40b:5e59:ccd7 with SMTP id w35-20020a05600c09a300b0040b5e59ccd7mr3643839wmp.184.1702409973988;
        Tue, 12 Dec 2023 11:39:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:33 -0800 (PST)
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
Subject: Re: (subset) [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
Date: Tue, 12 Dec 2023 20:39:15 +0100
Message-Id: <170240988142.242356.6771839605538323982.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-7-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:21 +0000, Peter Griffin wrote:
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
> 
> Have an incorrect DGB ending instead of DBG.
> 
> This is an ABI break, but as the patch was only applied yesterday this
> header has never been in an actual release so it seems better to fix
> this early than ignore it.
> 
> [...]

Applied, thanks!

[06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
        https://git.kernel.org/krzk/linux/c/5b02a863ba502482f25ae3a1bfa259838793785b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
