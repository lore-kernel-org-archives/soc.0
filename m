Return-Path: <SRS0=7NJY=UG=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFB8C433EF
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E42CC340ED; Sun, 27 Mar 2022 19:12:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A44CC340EC;
	Sun, 27 Mar 2022 19:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A44CC340EC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id p189so7184224wmp.3;
        Sun, 27 Mar 2022 12:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n3bwU1bJAcV9BPDZv4hrQrplN/wyo06SzBsnNMfVQPU=;
        b=k2+YM4uLdBWTZJD44J9p/B4a80tdYRHlIP1pkzmU0ITUDo92Of1wGMvBkBajudA/yD
         BU7pEFENnrb/7YtuIlfkh5QPuOXvcxa+rn0XvfmEQZAs1e2CYuXHUlLzCS8Dp+oS8ghK
         IahfB9YqZNfX8ZCvLpGsF8jPJ8+PYWHwGnNF49+1sZ2M04OeB9MuWvmn5foJkqy5HSiP
         a7R3hKtx65oLrSeJ9tT7KZOJi2y0Nz0J7hlPI3a5caHbHGohrhjZkqzDzWkaNXTHCquW
         DatYfCBOioRzS57g5Pmi1+9MG+ygDeAuNcDJPr9ykQjGqNBk6x9Xzu+X3/U+FPxeVgQK
         qqJQ==
X-Gm-Message-State: AOAM532EwZpmio+Uf5ZwuQn85CUUWQFPswELCvAURtrQG+WsFjsDMpfX
	tiErIOFp5hJGE+9R+e1MnUo=
X-Google-Smtp-Source: ABdhPJxyiNqZfifLY42W3G4xiGzRnBg+OY+Fe6c4P7ZzawiMiaTLtqZorCZiFKuNaPPkLqbTbOISYw==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id n13-20020a7bc5cd000000b0038c8b1bd220mr20639807wmk.118.1648408335713;
        Sun, 27 Mar 2022 12:12:15 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c404800b0038cc9c7670bsm9776860wmm.3.2022.03.27.12.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:12:14 -0700 (PDT)
Message-ID: <84c2886e-1a75-1c65-4eb4-737588fcd497@kernel.org>
Date: Sun, 27 Mar 2022 21:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 04/12] dt-bindings: clock: imx: Add documentation for
 i.MXRT1170 clock
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
 linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-5-Mr.Bossman075@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326144313.673549-5-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2022 15:43, Jesse Taube wrote:
> Add DT binding documentation for i.MXRT1170 clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/clock/imxrt1170-clock.yaml       | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml

Missing vendor prefix in file name. Add "fsl,"

> 
> diff --git a/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
> new file mode 100644
> index 000000000000..ca0f9ba8b3da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imxrt1170-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock bindings for Freescale i.MXRT

Really wrong name. This is name of hardware, not "bindings". It's not
for every i.MXRT, is it?

Just like you did in patch #3, so this could be:
Freescale i.MXRT1170 Clock Controller



Best regards,
Krzysztof
