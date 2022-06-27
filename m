Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B5DC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FB96C341CB; Mon, 27 Jun 2022 09:16:28 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 937E1C3411D
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 937E1C3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id c65so12038686edf.4
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qsr1FlLpUE+oTnmXUwcy6BnE1qyFeqIPJCLey9SG+As=;
        b=C8ZIE3MDLv6pruuNUtXJZPSAmjy6YTA2c5G+UUd1/MGqU3aHlmuEi/9RP0p7u8UO8M
         pKiy48pA/+TIXwaOAKdUQ5VYZ4a4rYxIunZZ3OCKDUef6CvSP9kzjaLKw5hOxXYYqAET
         SCNyjqxGRqtmKcL0Xo/t/ctqEG11KRKziTckkfwPBBTki/rEBWh/eU6M8NCPHxbh0XB7
         TJq6ZI9KX3Vyy8pGSF3rro5FFPVAsXam0Qrz8R8+kj0r/86anur5Ku/Brrq6+DKEWmG2
         xikm9rkXWAAY8QJKobLGgucftI0mrb91izBGxPiR3vW64b/QVP1PN4P8EaH53Dt9zhZK
         /VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qsr1FlLpUE+oTnmXUwcy6BnE1qyFeqIPJCLey9SG+As=;
        b=gd2Xo5050VpHAyybxmp1lDId/77LWyTeAkGF9nJRAPCt65jnWFNGqT7n8iMSZk4m0/
         u5raPJEVZee6sSdS3/KuZJ4LnhuYVUra7eaWzHQSAKRazfxtz+XjRXgEqmEW/ZUSBIYT
         E5WduochF0DSF1Hobg1aGPIiLxfVHGDUuz2oy624sNxXOgforCojyi6LtNGZFgYM7j+j
         PuSjPLyS52lvWmbJWWqsJAXkg+qN1bvIvH+88WniBGm5ouWewMwsp4RfIhkPIPYswV8a
         FBPDyd7GCsdu0lA3otNAq1TVqGJa64Nv5B115l676wbGu7sVYHjEGLnc1F3L4q8iqu1O
         V0sQ==
X-Gm-Message-State: AJIora/St6JO/titZOzBcOWUMb474r2Qti4Bkge3Jlr4YKhCI7e06HLb
	17xDv0R7w3W0HmqjW8DETxlIUVJwIqGYGA==
X-Google-Smtp-Source: AGRyM1vf3++B9U/STCuaVWvJvJ1tUX93/d4AkESqtHqEG21q6AG3lq7KBBh477coeyvaRta7SekIrw==
X-Received: by 2002:a05:6402:34d2:b0:435:9d8f:3328 with SMTP id w18-20020a05640234d200b004359d8f3328mr14916816edc.88.1656321386675;
        Mon, 27 Jun 2022 02:16:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@microchip.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH v3 39/40] ARM: dts: at91: correct gpio-keys properties
Date: Mon, 27 Jun 2022 11:15:59 +0200
Message-Id: <165632135506.81841.11437380975129537903.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-39-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-39-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:32 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[39/40] ARM: dts: at91: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/fa8cc83a3bffaa868b789a424d5573b7901edd7c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
