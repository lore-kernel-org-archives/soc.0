Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD5FC4167D
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1701AC433C9; Wed, 13 Dec 2023 19:16:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C41D3C433C7
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C41D3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so71932825e9.2
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494981; x=1703099781; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCCBoGTTagMUmsTWYC8ydPGVizeqgOl7xeRy20+SMfY=;
        b=dIaxmPnMnwbT9EkAl3QCoot5WiLpvNhloGBjQAduhBReBXB9opU7bZGElIAjoQkU/z
         rnhvW7qxUC/hwfNH3b7BrZ0IqtbWCgEQ3t+6j6q1j2Ow9hVskobmsJXJFvXRgKKOL6nz
         XwSe0g7fZuBFDvBZiHPLdSHhaKhN9GK43rcjUfnuUFMVyLUDWSm7fgUthssuaO0tsjXc
         jFk1unNhevy8Qq74a/Qh0cws1Vf2zOnO1OWCV7dHl6JcJ4e0Z6vKLDET7+NcjGFuJb/c
         JnIETLlpKgoWEEg4VUmGsx/8FU4dlD1YvimIbR7RFjvC/6udStPeyMae/x5NVN/7CvLu
         +p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494981; x=1703099781;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCCBoGTTagMUmsTWYC8ydPGVizeqgOl7xeRy20+SMfY=;
        b=osBtOnMYav7O7Dg85XrePnFy8rewzgAIxSgYCp21D/Zpai0ot1HB4fJacJUZb/Goa2
         o8S1Z9//YBZtN/yA4ZyqkerCzBs3mN3gL1rnyYB2I9DQJjP02960VRBsteShjA8EeuNO
         AjCdDBouy/oHa02VcGOwJsAioAxVIRqQDW4rRihSbvfsunfxb81xt8+LsQXU9gouOc/8
         zrrhwFKdz9Yl1nYIsqqnrKoWt8f7n71UssldFOQV/A1tiNPn/cmjuZvgCT1p2zDCkS55
         35Yca3m8Kb/6691zD9f3p/CXS/a8VELm9HL7Yg/k/UiSnd7UV1lDRDrlkJzV+LBE2w1E
         18yw==
X-Gm-Message-State: AOJu0YyV2+97QzZ3bmVGhtQZTaUBKuZCBDsbYQKrXvRMGJWIg3z2gGJN
	iaJ1n+kz4ajgxk1MmYXvOgqFlg==
X-Google-Smtp-Source: AGHT+IE3AK9RG0WLGmInBceE9RcD51sWdzqOKgsz6eeydNkXttfe5yCZB5W1ZQUwSLroFIMEtnPKSg==
X-Received: by 2002:a05:600c:3ba6:b0:40c:909:fdb4 with SMTP id n38-20020a05600c3ba600b0040c0909fdb4mr5169234wms.90.1702494980824;
        Wed, 13 Dec 2023 11:16:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:20 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-11-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-11-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 10/16] watchdog: s3c2410_wdt: Add support
 for WTCON register DBGACK_MASK bit
Message-Id: <170249497853.308886.14491280069451216694.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:25 +0000, Peter Griffin wrote:
> The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> (disabled).
> 
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk. Also update to use BIT macro to avoid
> checkpatch --strict warnings.
> 
> [...]

Applied, thanks!

[10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
        https://git.kernel.org/krzk/linux/c/6584cd34901056bc12e015781e4adf03b44ba485

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

