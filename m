Return-Path: <SRS0=EP60=WF=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B670BC433F5
	for <soc@archiver.kernel.org>; Sun, 29 May 2022 19:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70DAEC385B8; Sun, 29 May 2022 19:19:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAB5BC385A9;
	Sun, 29 May 2022 19:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAB5BC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f53.google.com with SMTP id jx22so17165722ejb.12;
        Sun, 29 May 2022 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wc+EE6uFclfQj0Z++trSIQDhAONqieaeq0cvRbIdEio=;
        b=BlHzcGTrKIpNrIPqJBGVqSC3Fmx0nmtG91acp41+I2sSr3UwjOBg7PTUW2jugiyjOS
         KV8gAeOQp1DF/XZ9Pooh/305TP+Doq4JtQ0i8yC2Av2Uz2LdEKbs+j/83L4p2STY1KYx
         En+nLsDLwEMuFHglSNpbCLREVZyMiC0ZGljmE6AXUHKafD5ej5j3ZPMkpy6pzasMO3IQ
         YFcV65NJBFwWCiRBCdOIGxUgh/6rkm9bY7FuQkIDBQxHwPesIXk/xjTinHFakSnFUihs
         TZY2FgsN57eQPwg+TpyxneWO62ff16jYV2HpwWXkdDu7CPj6cTmh9S5XEfpOm6bfxalB
         r1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wc+EE6uFclfQj0Z++trSIQDhAONqieaeq0cvRbIdEio=;
        b=1kdtj1/sCC9LQvogbpubnol+5/HVZ9EMAaHBWwJAf9axpg7WcZMFWJ6aZR3DKG64VI
         w8e7/+4djaAhJDbUIopvGkKVCQfoWv+XeYTNq5wknKHZnOW2ukzWulEvYC82RgYAedBy
         /wwpqaO13wka4e54lStni2//7syODDe4k446kCRDJFu/V5WOMOm322uT5MgU+XT5bWtR
         GAVkVzbFdmIl6/edyVQLrb9vSOET+rh3AFzA5EweJZbS0yHhkEvAG+4GwOylMv//5Oal
         EDlDbeOFK/ZFWeN+EllDg1o6G0kIJSEKkOhOf4zeaBDG4vCE20g3BmgoNvtOAZXg1QWC
         sHPg==
X-Gm-Message-State: AOAM530R7MBesHovIY6Rcr4YBjICwp3IBcyOwUdMpBt147Yi+/aC5ueD
	f5mXfCcxxsuhcX+RD2GipyLVgHsprQPayKz9HDM=
X-Google-Smtp-Source: ABdhPJzCykqQ15vSmNqR86SAPkvkeK17qhqbNMfKxY3rcmoGgzF/riVWYcYCENQrz5Q479KG33OuWkNZXm5nuyzqvrU=
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr25697803ejc.302.1653851944022; Sun, 29
 May 2022 12:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220526204552.832961-1-krzysztof.kozlowski@linaro.org> <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204552.832961-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 May 2022 21:18:53 +0200
Message-ID: <CAFBinCA=VXjR99AELCnV8nLbt=DinWhcpmKnC1jN0p6Dpx83Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: meson: adjust whitespace around '='
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

On Thu, May 26, 2022 at 10:45 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Neil, I have seen that you applied this patch to the v5.20/arm64 branch.
I am not sure if it's supposed to go there. If not: please add my
reviewed-by when moving this patch.


Thank you!
Martin
