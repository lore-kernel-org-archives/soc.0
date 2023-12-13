Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFBC4167D
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15E39C433C8; Wed, 13 Dec 2023 19:16:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FB13C43395
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FB13C43395
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so50877195e9.0
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494983; x=1703099783; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4iug0zFh+mKYBRJSL1NsrTxNd0WHpDbjTaMEVvHOxc=;
        b=N9uYwG6iwb9sBo102wMVC0+wHWR3gKjUEw5mSDDRzGZyMEwXumSYDFH08BON8BGzPo
         eI4q+xbtQFtw+Uhl9SG7INVSjMRE92I2JMcBLeQDljofOb3PZLpG8i1Ugb8B6syimA1g
         AnDKrmZVBPPpM09ToeDpDlR7sd2EPV3nJK1g1wmeV9rMgNqcYAVDSXo3gJXm8ao34XmE
         XI6Rw1c2JAd3sobuAn2OzXalCvyIScik5Y4RYbFMfx7DslK1LDlG2qBTXVFZKdcg34kv
         SbXjrnyRBSc9tktoa5zb4w4LCoowSKIZCpflbkPVhUQfsVt09OinskKcWeJXmhSRfIuE
         pCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494983; x=1703099783;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4iug0zFh+mKYBRJSL1NsrTxNd0WHpDbjTaMEVvHOxc=;
        b=KHlrJxrWc0IyMoUKQsrxi+L7TiUpy5sndijgzWrrSLUYKG80H2ZTAUISFmvt5Nfr2F
         J+6SRkkilbTxCwWKZ3B/17B0QrPhj5yUCl6IUm9sxJgW9QV5As8XzWQYic4KympSbEJn
         6WufY+INxfA1O+UqZXK1/K6xxw3MpS4kGl9apNEpctZSLKeaw8gPZ3J/fsawnUZHf+Hm
         osQ0T065MzLi9Ri70+uGqCO70bbFBN2VU/gW/EEHl2Q5FT8w4B13EHGWD+5RpfyKiInZ
         ETlWb3GG+SHTeojErwJ3E3hSTPEd1BlIvy9HCi1vTqXuiF7Px4YSdIo0PVKpKk5y4+27
         defQ==
X-Gm-Message-State: AOJu0YywQLuhLORqwMUy3o87BSsjHCoMFSeORlM7ATZUxKeXB4o8xQXU
	DF0xpsexagS5LrPfDLxF7aUTmA==
X-Google-Smtp-Source: AGHT+IGE0R8vQQvj4WfjL/xzOFLRT58TLoAHrMBvInW9ggZ3ojMXxT4TvwW3aE21hn0dgGiWKbIvCw==
X-Received: by 2002:a05:600c:6907:b0:40c:27ae:e5f1 with SMTP id fo7-20020a05600c690700b0040c27aee5f1mr4319869wmb.41.1702494983029;
        Wed, 13 Dec 2023 11:16:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231211162331.435900-12-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-12-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK
 macros to use BIT macro
Message-Id: <170249498093.308886.1000238484233229719.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:26 +0000, Peter Griffin wrote:
> Update the remaining QUIRK macros to use the BIT macro.
> 
> 

Applied, thanks!

[11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
        https://git.kernel.org/krzk/linux/c/d429928dde2d7e3e98cbea5f170d089d10a45c39

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

