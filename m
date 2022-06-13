Return-Path: <SRS0=m3ed=WU=gmail.com=jernej.skrabec@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E13C433EF
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 21:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBE98C3411F; Mon, 13 Jun 2022 21:02:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40ED3C34114;
	Mon, 13 Jun 2022 21:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40ED3C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id v25so8883267eda.6;
        Mon, 13 Jun 2022 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+yaULdwu+rPL5G3MbWME0SaA5eeeXALvtNnWDC8wYA=;
        b=Z3Zp+je1tvgRYJne1HFf3ZU8TV5rQ6wVEdKi2Ozg9+v/gZF1Q7EdGSU49t7iJbACzr
         T60Bn+ddWAdg5eWnfRIB9uAQwPTuvHmXB917v7IPvts0r3jpZWWefU7QacBSK9uwNFZN
         c8GDDbZqjrTisqwCR/vGfpKSHzXLv/V+6/OyOkGb3CTI6/dQ/4ke0F++EiV+3On1WacQ
         mGnKAGI887a7ydBLuwYrYT6GHYTtqoYE77UDQ/X/KatV2tWb1fkYwcG9r1PuYSR9PBZZ
         /+aq1qaKfHXxUomXC+UZrSaEeyNsTVPKnZeOxKLokpF8ku2eturrAlCy4DJg5gNozN0P
         fAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+yaULdwu+rPL5G3MbWME0SaA5eeeXALvtNnWDC8wYA=;
        b=dalWWDXNgZGuVqTcFVy4xK1NF55OIFieVwH4YHEqsMhwjuQzmvR78+rcaNRFWsSEup
         JmvkxrY48zJcFzPbFBT32ozbobluN4Wob+C0hUdqmrg4MJVMdsUqqtrjmt/ijg5/A5sK
         LQFEmaycOCEE2a5Dkj9GujYCTWvdRaxO6pvJ3LLDKMRop7KsWRvNSMJK9t9iQGU5ZfLT
         N4FNZvhgY9HZgwxw5taf0DZ0sKmpufWN26OouSwOiEp3umjFWg4wShXSyE3sF6aTjcxd
         GP4u96+gfGofFcyHfMpTxK7PgQETG63yoXz+ut4q0uGENdv0Zemj7uubaKdvRuWVrZo2
         S1oQ==
X-Gm-Message-State: AOAM533LLTwuY8ibRADOtLeRZi6t9DIrThXiGWcDXeBI5O4UJGxfdjRT
	6kW+3mYnVN+NJyrsF7FHSgk=
X-Google-Smtp-Source: ABdhPJxQQjQlNd90jfnjQ5cdDCsNYWfxsyeGYqf4sXuU6zLN/1BV9Z4Vj7CJU7eESLv+NSnM2GcZAQ==
X-Received: by 2002:a05:6402:3293:b0:42e:18a:d6eb with SMTP id f19-20020a056402329300b0042e018ad6ebmr1871193eda.293.1655154148518;
        Mon, 13 Jun 2022 14:02:28 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id q23-20020a1709064cd700b006feed212f50sm874123ejt.184.2022.06.13.14.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 14:02:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 06/48] ARM: dts: allwinner: align gpio-key node names with dtschema
Date: Mon, 13 Jun 2022 23:02:22 +0200
Message-ID: <4743697.31r3eYUQgx@kista>
In-Reply-To: <20220609113911.380368-5-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 09. junij 2022 ob 13:39:08 CEST je Krzysztof Kozlowski=20
napisal(a):
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


