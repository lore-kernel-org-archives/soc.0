Return-Path: <SRS0=4zcX=A5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC224C77B75
	for <soc@archiver.kernel.org>; Mon,  8 May 2023 09:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90E4DC4339C; Mon,  8 May 2023 09:01:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F8D7C433EF
	for <soc@kernel.org>; Mon,  8 May 2023 09:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F8D7C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-965e93f915aso582544066b.2
        for <soc@kernel.org>; Mon, 08 May 2023 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=t40AGY5/zL0/XXc7pQ4Npisl0XqlgKQc9BM/f43pHyOgmLT7RrDqoFoJaUTQjSel5S
         C0hfCvVd2YeezCX1ZvEN4S8f+dCNm5R0iCkNKEVLWdx8Kj39qwAww0eq7SztqAeoKWW5
         GNipyl/sTouqc+HG67BH0X5Xl61zdJnpc6kwIIYWg2zSJKppGoghENY4OPp31mxr23Tz
         Ug+u3P37klL3iESNEiUTRQRcRZqTFA4IPjV3KWkMoE0N/5vQOBwneqBDF1YytNJHFk7P
         HwF3YwPS2hc8WhTkpkuUEgKXk+igPwAGHa7roc6GAuDn3tfjp4+k0Tkp32ehLyCNzFL4
         6PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=SPWtIClNxn01CF3kuGYNJa8UyIHTrImpMqpgP1tGosgOx2HUhlV1AU3CK9fisC7FzN
         VJWF6PBAiNIfIsgaXgY0E2PrT7TRhUCoIa4kAU4wzYhIHVvDhwE/ZhpMIOhjFZVmyhN0
         ruS8GKoeOEm5scqbf7hVXsvS3CM3wPF/7jq7JfI0idHZA7Z/LrmCRKetQswY0Y9xFBM1
         pNwsRzpcqKDg4navrY18fWZzGQLBj6Sde+N+wArNqWG1WuDB4uoSkF9LorXdTe1ug/9e
         TsBy0n8ExHcDpISvYJ8HmoCZ4Z+tFoOLTwhtAH/88c29Hh9qlfPg+zT+x5+mtn4EfWpj
         719g==
X-Gm-Message-State: AC+VfDwmtdHsYtKMI4DKBPIU/14SScrOfOXBfgDMxvT++Vn4o+hUlmV8
	wGfywzzMwtKsOLscNxIPiBvGhg==
X-Google-Smtp-Source: ACHHUZ4HpKWDjurqiqoLaDtN/lfcKNWSX5+AEn0mGRBLeJKV/5W39K4QrEkUfS5UpnPMpO6vpYpdLA==
X-Received: by 2002:a17:907:5c5:b0:965:9edf:f0d0 with SMTP id wg5-20020a17090705c500b009659edff0d0mr7601374ejb.13.1683536466403;
        Mon, 08 May 2023 02:01:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709063a0a00b0094b5ce9d43dsm4685758eje.85.2023.05.08.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:01:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Date: Mon,  8 May 2023 11:01:02 +0200
Message-Id: <168353645813.78617.10247256011505870361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 May 2023 06:04:33 +0200, Lukas Bulwahn wrote:
> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
> no effect and any further purpose.
> 
> Remove the obsolete config S3C64XX_SETUP_IDE.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
      https://git.kernel.org/krzk/linux/c/9d2edccb154bd98baf7f1e21d23f799e4f5e8359

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
