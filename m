Return-Path: <SRS0=6JUn=ZM=linaro.org=naresh.kamboju@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6EFECAAD3
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 12:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81A65C43142; Fri,  9 Sep 2022 12:24:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6478C433D6
	for <soc@kernel.org>; Fri,  9 Sep 2022 12:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6478C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id r17so3549988ejy.9
        for <soc@kernel.org>; Fri, 09 Sep 2022 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=a/QNA2ugiBfj/JrsH5nr1chbYMfF/AQ6Nq2ohVefuQc=;
        b=kV/tDS1JyHz3VU/TqzB+feXF1OCVJcIc5v9iVYTFXzJwqOsH1FakFl2RNzNZCU33Lb
         jxemN1hOMw7PFj5I5kdnA7JEHVDvGDuFc53N8df9RFwJbWlqadh9HasFEvfh8p9Cv8SH
         A1YFANiXbANkckWpFZsZglWHxFJlmRFYj7FnrrKF5tR8p1PgznfXlVIwKEhMAjuDF5Do
         YvyOhVgDcFa1JdtzDi6+mhqOxBq0MpUK4fz7Ok45dkIZiH2P11dhFE24Y//RD9CD6nrO
         gy0bn93/o3wP0/GchWvQ9yrVMIYKM+h2RS7XTfJlpsCWctbGH4yKy3p1vWHBaML6YlHi
         zC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=a/QNA2ugiBfj/JrsH5nr1chbYMfF/AQ6Nq2ohVefuQc=;
        b=vZ2HTnNDH3ro1zSrnfYTtPpri2ZIPc6YwpWFGxk+cHZA9TiMOyZXFC/rYAYJmRy4sO
         E3xRRmmQ4oFoNVpYsFv+lbFmxdpZfQ6w1NsxkdFfVhCd9dm5wcOzs1Tf0ioXXv0dAj6F
         SGxYusMTjFQdeRtx0Esx+NAd9N2l1LE/rv0aL8eBvI/oEs4uIM6yICOfP7GGGXBxWbrs
         jUkYTrgyk8nFbCFqCgJgJRJcM1LKXRHUYuhbsZUEqNSUf+zxMuXoMl/SzcKnqXDl0wrR
         P9lzqrVtcSXhHbfMECN3dDGJjp7g3OVGJQs6hT0FGUq5nwQYQ4ym3sDptwDy0g2/qP09
         SfSg==
X-Gm-Message-State: ACgBeo2KW9sYw1Z0cKS/DJqjTZhW013ARnU82WzUi/YnrGywcODepQJC
	9p2d8iZ2xFBG7fModvKMRP2pvfpAcUMK2LQHuIWT+A==
X-Google-Smtp-Source: AA6agR4bp4ordUFJ9GfA6ar/9KhgIrwvHc/u68mfz0ax5EIwsCIWX1EnWnS0FZ9Qe2l6IlTyI52iyZt+TCDrz/uUXsg=
X-Received: by 2002:a17:907:7f8e:b0:770:7c67:f522 with SMTP id
 qk14-20020a1709077f8e00b007707c67f522mr9648310ejc.366.1662726263875; Fri, 09
 Sep 2022 05:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220906033957.4377-1-f.fainelli@gmail.com> <20220909073509.301363-1-naresh.kamboju@linaro.org>
 <51e6ea21-8af4-775d-1561-6671cfc50ecf@linaro.org>
In-Reply-To: <51e6ea21-8af4-775d-1561-6671cfc50ecf@linaro.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 9 Sep 2022 17:54:11 +0530
Message-ID: <CA+G9fYv79_BrWT28DVfu4JHasiOKMeL-Wr_MJapU5xeB5VomBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable ARCH_BCM
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: f.fainelli@gmail.com, andersson@kernel.org, arnd@arndb.de, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	dmitry.baryshkov@linaro.org, geert+renesas@glider.be, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marcel.ziswiler@toradex.com, michael@walle.cc, shawnguo@kernel.org, 
	soc@kernel.org, vkoul@kernel.org, will@kernel.org, 
	lkft-triage@lists.linaro.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 13:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/09/2022 09:35, Naresh Kamboju wrote:
> > From: Naresh kamboju <naresh.kamboju@linaro.org>
> >
> >
> > On 2022-09-05 20:39, Florian Fainelli wrote:
> >> Commit 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom
> >> menu") introduced a new symbol ARCH_BCM and made all of the Broadcom
> >> SoCs Kconfig depend on it, but did not enable it in the defconfig.
> >> Thus, now the defconfig doesn't include support for any Broadcom
> >> architectures anymore. Fix it.
> >>
> >> Fixes: 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom menu")
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> The patch was sent on 6th of September. Your report on 8th of September...

Understood !
Maybe off-topic,
Testing Linux next seems to be a bit late to report the regressions.
Our testing would have build and boot test devicetree/for-next or
devicetree / master branches to find early regressions.
or Any other well known maintainers trees.

Your suggestions are most welcome for improving Linux kernel quality.

Best regards
Naresh Kamboju

--
Linaro LKFT
https://lkft.linaro.org

>
> Best regards,
> Krzysztof
