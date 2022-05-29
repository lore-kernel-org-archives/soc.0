Return-Path: <SRS0=EP60=WF=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7892C433F5
	for <soc@archiver.kernel.org>; Sun, 29 May 2022 19:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F037C385B8; Sun, 29 May 2022 19:19:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE59AC385A9;
	Sun, 29 May 2022 19:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE59AC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-wr1-f47.google.com with SMTP id q7so1130823wrg.5;
        Sun, 29 May 2022 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ztQcdyrzloMjbqIddHmmicr8ARqs6zTnjkcVf2TU4I=;
        b=lZjEbcz5P5VLsqhwarIzO3bmV0L0rbhkAOTuhs27gAeZN0rdivc1naIZgpg5RLr0jP
         2foIfDWE1s3rQL/Id9cESnt78kPsjE+YrbhkdYDPvWf/jI1gcXIX/2TfQjW8r5mRfeBC
         fRw5PjKE46bGhgnmYX2ddS4ShozeO5WFv3wIRssT0zTsD7dbEOX9TD0O9BtsrKiKURWr
         pHxgFZAMqKGBpUlChO89Ap+czIbvXabealiPgWhyx6VQIXYlbZoHriYgmHiVOrYNNgjm
         dBu+uHViyUrhGlqTLkpzd3AiFNvq/S+22v/WcDiALV1yZUCNwQuAsDS/i2MjjTuLoKqx
         zoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ztQcdyrzloMjbqIddHmmicr8ARqs6zTnjkcVf2TU4I=;
        b=CScu4ReiHltPr/aHC5/hxL1acGfzhQWVB9aEgDkxbxVBkF5hNehbqBp7ZNqPzc5dum
         kUOzy/Uka4hXbi8MaGRgS2EqT+NAkRRxt/Jz4XZmsVIOMEQXh06Iuq35Qv4qBlzWFWuj
         eHaVnK8+AsQ23+KtHi0lXryMDSVgXncF1Slgaysf2xdvTzskI15CA44WhxIOwTJ+MP5q
         oRuENIPp47WVQB14EMgE145+V0s7gt4q9s30LPo9uZquABEM69fDpPwpkwH8TgKZ1xzI
         shThD88LISOe1Y8tSh6EPGMR2ExoeZSKD8byrgLt/yQE2fJm0cYvxhWHXrfiWWvE8loz
         FX5A==
X-Gm-Message-State: AOAM532A80DHCXOOJBfrznOPxvYJ4dXs4zDYpJSfWpieNHT00MfCbaBI
	MeZ201rnyNAiSMKEEkE5M42o3kQcPr3dfgd4Rn5Z1jhHgNw=
X-Google-Smtp-Source: ABdhPJxJUW72TCf8hhpo0SFKrfjyWkvZ98QG5o00eQvgVLc+gRAu2Akxu+mFKrJ26n7cHynR4/W0tlJMAjP4z5QPWt0=
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr44026736ejb.147.1653851957385; Sun, 29
 May 2022 12:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 May 2022 21:19:06 +0200
Message-ID: <CAFBinCDhyY-ebo-JT1gAPSn7nOoX7ZoePsEe-2NviMhyiDu+4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: adjust whitespace around '='
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 10:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
