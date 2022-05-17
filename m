Return-Path: <SRS0=yR+V=VZ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE258C433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 20:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72878C34100; Tue, 17 May 2022 20:15:10 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81A0BC385B8;
	Tue, 17 May 2022 20:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81A0BC385B8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-e5e433d66dso36046fac.5;
        Tue, 17 May 2022 13:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zVxzIKBldB7H+d2gLC8sHVniZQZdEucrxlMRnxV+Lrw=;
        b=crves8P2JsSrk6n9mVVa3H/M2+O5fO+BJa3tvBisof9hvwK4MqhNYpXoqpZuBHmAvb
         ycefhxXx7ELKjRTsH7TO689GsQjim7mFR3Q0lwR4koh8zpxX7dJ/xQ5mCwndn/wsfFiU
         ekViVK2YHDh6whUPj5vMJvld2gvV5npgSjINo0DJXvN5fj8x30108QpipgoksaxhYgNx
         OEEKhFV4F9KdIRUAQK8FdMqpAYX8ZsB9dDXjVVzQDMnigBFQneR1zyx+rqv1NGs28RmH
         lI6vjHvNSSMYOvbDZbgII2M9ThoNjqsR2loiOz/ENbSLOywP4z9Y5hB590lNvWBQEHCL
         ICAg==
X-Gm-Message-State: AOAM532w1MWNDUwWj7F11KcWjY3fNeCk3zs5+FJh+Z586Is+Amg3HlUh
	26gzO6oUadCbeSJVdq/Xhw==
X-Google-Smtp-Source: ABdhPJzFUsEA+/8m7Vt2h7qqa08hkS087A/4e01jKJHs+oCPD701NibEd463NoBCEp+WxJgfV6nozw==
X-Received: by 2002:a05:6870:c598:b0:ed:a1c0:f810 with SMTP id ba24-20020a056870c59800b000eda1c0f810mr19702119oab.289.1652818508545;
        Tue, 17 May 2022 13:15:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id em11-20020a0568705b8b00b000e686d13872sm188097oab.12.2022.05.17.13.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 13:15:07 -0700 (PDT)
Received: (nullmailer pid 1553344 invoked by uid 1000);
	Tue, 17 May 2022 20:15:06 -0000
Date: Tue, 17 May 2022 15:15:06 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, marcel.ziswiler@toradex.com, festevam@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org, tglx@linutronix.de, giulio.benetti@benettiengineering.com, s.hauer@pengutronix.de, linux@armlinux.org.uk, abel.vesa@nxp.com, stefan@agner.ch, soc@kernel.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sebastian.reichel@collabora.com, mturquette@baylibre.com, daniel.lezcano@linaro.org, dev@lynxeye.de, leoyang.li@nxp.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, linus.walleij@linaro.org, olof@lixom.net, clin@suse.com, Mr.Bossman075@gmail.com, cniedermaier@dh-electronics.com, aisheng.dong@nxp.com, arnd@arndb.de, sboyd@kernel.org, kernel@pengutronix.de, tharvey@gateworks.com
Subject: Re: [PATCH v3 10/15] dt-bindings: imx: Add clock binding for
 i.MXRT1170
Message-ID: <20220517201506.GA1553283-robh@kernel.org>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
 <20220517032802.451743-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517032802.451743-9-Mr.Bossman075@gmail.com>

On Mon, 16 May 2022 23:27:57 -0400, Jesse Taube wrote:
> Add the clock binding doc for i.MXRT1170.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Change to GPL-2.0-only
> V2 -> V3:
>  - Change to (GPL-2.0-only OR BSD-2-Clause)
> ---
>  include/dt-bindings/clock/imxrt1170-clock.h | 282 ++++++++++++++++++++
>  1 file changed, 282 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
