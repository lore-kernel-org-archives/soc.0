Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3963EC4167D
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 280FFC433D9; Wed, 13 Dec 2023 19:16:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BAE9C433C7
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BAE9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c46d6784eso34519095e9.3
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494989; x=1703099789; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVw2BVonf32KOGcKItT5pWUVEE4nDhvDMvdCf22c6bU=;
        b=vREDKFai3F80VAOwT99wRNAHO8bO81ldaZstqn7UoP2cQgTJaTO9GYMR66vsiRL43h
         E8PUH0paL6cf59X1Yiv58Kd+6aZQJFIWkyNHgC8vH6DyMXTEuT0Nlmoa7QltgO/d+0HG
         BVCs6rlRxbXv6RKz1ObMf4ZRnXNhZ77fgO6trb5cSw4iD6kNFo87VQyI6WtZ/zR7m4OZ
         Bh7ioxuNhBklG3iLYDV1jPWDvxhsBNBeBUruBgUJuRqGcIcFUWrfmgpch/yzDH62sHaP
         zw5Jzfzm4o6MLJBQC4Fq54pwHU2pGFxX2NMyfOxXUrzvub60SymjP4u9PwZKO74TKeJv
         p68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494989; x=1703099789;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVw2BVonf32KOGcKItT5pWUVEE4nDhvDMvdCf22c6bU=;
        b=XCAFagYNGvapFurUBBc7nMc7JK022ax5UQsbhZx2OVONC9IRjg/VyvxBLwnxS95xu8
         D5eLy35QIJitEzxh8Fu0Wj+CTzafS7F1lDBuhRfAOAsTV/D3HHDKf4+oXr+NpCTy4pYM
         spvoP3yp6afdh+FnLzfS3En/8wxf6RO3YWOtiJC2JJmjq7NZMJh3oKOxBbORdyUgnCv0
         Irh5rY13MgzBlFcd8rbEI63THiQOfoXE5FNXOv+paJlPmXDZaZZiTIie+dR7TfXrg1Nk
         fIYUrTEmVfmgMQval3aWkNnuB2x+LM6fXtgcMeSikcFkEVTlD45Jm0B0H1MZYu/jvpwe
         cnEQ==
X-Gm-Message-State: AOJu0Yyfm0zmt8mrDSANsas+24nzf/HA8GuovKV2oDYd9QWg1JYCtRhm
	qpMuiCVqZGC+ln9PJKkb29f65A==
X-Google-Smtp-Source: AGHT+IGwAghg8wXV8vvka2M2jii5qfSHBwxTFPfU579NhU9vphZwOVpFyaOtF0ynqQAn5Xk3KhD18A==
X-Received: by 2002:a05:600c:19cb:b0:40c:30fb:60bd with SMTP id u11-20020a05600c19cb00b0040c30fb60bdmr4462530wmq.144.1702494989593;
        Wed, 13 Dec 2023 11:16:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:29 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-16-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-16-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 15/16] arm64: dts: exynos: google: Add
 initial Oriole/pixel 6 board support
Message-Id: <170249498744.308886.17508790332822828341.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:30 +0000, Peter Griffin wrote:
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
> 
> 

Applied, thanks!

[15/16] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
        https://git.kernel.org/krzk/linux/c/6a5713fc7853c3998c706cb809c5d9fd1c6acaa5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

