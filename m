Return-Path: <SRS0=rwNa=3R=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D01C4332F
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 16:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92BAEC43152; Thu, 17 Nov 2022 16:00:44 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BD5BC43147
	for <soc@kernel.org>; Thu, 17 Nov 2022 16:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BD5BC43147
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f180.google.com with SMTP id 6so2341406pgm.6
        for <soc@kernel.org>; Thu, 17 Nov 2022 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WeXWqGLnMnk6uS6XkKZbr/nN6eSE9M6SqY0Ycssq4Dg=;
        b=PUS4jdB+kqWabwXwuFg3VjIMIsjSVWnik9vZDbsjJ3S1YGa1A0mdY4EFcfp/b6wuGh
         Ie1KuTrSGuy3q5hBbBuzlvOccif2bvxxDOc9HUdwaZGkJ/m1FCTNU/F/Lwur7sySFogt
         7bsxtUyXBWZEloqP4EJfIpcUMlwYfpoUG1U809+jrJJz0lEvRuALyH5zjAtAFay7O06m
         C0sXM/5WIRNwcqda38DQy0Nt3Q4fXMJW7YCBbgJnJZq7O8oHh+X9nOiCXqBLFBWm5A5l
         nyTMBLMX3J4q2JJRtZPFlaefYqgthHcxCByWo2u+7v+ulBnCHcFiehT/7c9oJxUU6F38
         ykBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeXWqGLnMnk6uS6XkKZbr/nN6eSE9M6SqY0Ycssq4Dg=;
        b=0NTIWnlTZTEp+jZxYhrgPw00TLgqxhd+2apdNOGqZEbrQwtSx5d3T+UyN4Rr4DKge5
         +MWRo14jTRm3HXgt7Jr1SIU/5jyCwT2FEJPaFTP+ajRdDZpPadHRNu/Qbgta2KLGpq4x
         eUAAE575tHC94+3AWZNu0/v3VKWi7yXM9PRXZksZy0GKZM5RjqPdNZ/1xIZjrr9DX/k9
         PgAFDDnVsD5aqC9mhO9Sf2DQoaRW98KEYrBszaTCryENItYuAZMzhFfBE6SkqaWwV9c9
         gzi17GEbB7kaDy9+TzyGH9aDq8YXNxh/BQVwpAHraPlVyy6GBgYustHhprq/EtxW/Yd3
         UZVA==
X-Gm-Message-State: ANoB5plpCgcl/dcME3QlCOT4UImjeNYhQuwuK/KaYK5zoTXg9dYYF166
	LZ/NTvs0hS9rBty7xtrXUF7NWb0bt1jYfKQalvk=
X-Google-Smtp-Source: AA0mqf6xLyDPJpFM5ANLVXCIXp6GJqaL+20inLmVRY8uVTrkvctosjsvdu8xHT0YU5iw6N0lZNtYZw==
X-Received: by 2002:a05:6a00:f92:b0:562:317c:2a8 with SMTP id ct18-20020a056a000f9200b00562317c02a8mr3664989pfb.49.1668700840241;
        Thu, 17 Nov 2022 08:00:40 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b0020ae09e9724sm1040623pjb.53.2022.11.17.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:00:39 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Jerome Neanne <jneanne@baylibre.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
 kristo@kernel.org, dmitry.torokhov@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
 will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
 shawnguo@kernel.org, geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 marcel.ziswiler@toradex.com, vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 arnd@arndb.de, jeff@labundy.com
Cc: afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com, j-keerthy@ti.com,
 jneanne@baylibre.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 6/6] arm64: defconfig: Add tps65219 as modules
In-Reply-To: <7h5yffamcf.fsf@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <20221104152311.1098603-7-jneanne@baylibre.com>
 <7h5yffamcf.fsf@baylibre.com>
Date: Thu, 17 Nov 2022 08:00:37 -0800
Message-ID: <7hfsehbmfu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Arnd, Olof,

Kevin Hilman <khilman@baylibre.com> writes:

> Jerome Neanne <jneanne@baylibre.com> writes:
>
>> Development boards from TI: SK-AM64 PROC1004 include the TPS65219 PMIC.
>> Add support for the TPS65219 PMIC by enabling MFD, regulator and
>> power-button drivers.  All drivers enabled as modules.
>>
>> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Could you pick this one up via the soc tree?  The mfd & input parts have
been applied.

In case you don't have the full series in your inbox, it's here:
https://lore.kernel.org/r/20221104152311.1098603-1-jneanne@baylibre.com

Thanks,

Kevin

