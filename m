Return-Path: <SRS0=Z9zH=LF=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MISSING_HEADERS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED88C48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 18:05:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46204613D3; Fri, 11 Jun 2021 18:05:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A45A60234;
	Fri, 11 Jun 2021 18:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A45A60234
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso9094783wmj.2;
        Fri, 11 Jun 2021 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=bN6nTLxY4EsdLFWLAWGteRiQWDdS+7C3QFVM088ASFE=;
        b=MM4COoLSA7xG8EChlBEJ5B1a4kKgW8GYL3rFLe6rgXd6dn1J+MOxxh8OBahI8Hf3qU
         +IJVTL1QnCphHj6oaxN+dt+SObRs3mRxsjlRmjvRxbEArc50YKYVF9yHU0ZvZO09yMwC
         znDdwS39pU0jkxg6Js37O8sxuwXXTUBffOZuewsnqSGzGs+u3xOVwfQ1iwXHo+aw+vIV
         YDP2acm0m9nDjx6LypqbhkCFNS4twy3JWewxVb+u/uVbEpyNkTPgOxeNglCF7gpyh+jQ
         ANxc/c0GKqCQBa7u0xibwBT4hYPzrrcqUlWKf4t6IAh92oXBzAr9b/WiHYtvOhw0bCAe
         uZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bN6nTLxY4EsdLFWLAWGteRiQWDdS+7C3QFVM088ASFE=;
        b=Jor4bVAF0mpjsKZlP3PExtgUGlgOrvZeMM/xqgjdfUS0QYV4x7SZ8pykFY1QZgIK8R
         cH02BtrSplVSDfpf/LtdHRcfEc/kUmT0Z1/O2dCVlwGKNENgRPb92I2LX+Ld++0/OtYC
         Q3lzE7GzwUflaOZ2uVORqf9rPT6XLTUeF1LVhjGScct/sQCK/S3aBO9In/7NV8L/6l66
         zhMGRNwrA2z/uCBB3oGO3WMIceX7okGtaM9sfIZw5xCq15lPE/uDGHQRSKXXwpcmpJyu
         mwX/eWRdERpP8UMQmF/HQLMoxid/5lgDSNWx19WHpg0Un4JdvnFh0B7rIaCNOw32Gi5A
         4acA==
X-Gm-Message-State: AOAM531ijlgJrSFV3xRr7P/xGHsDWHBpKjfzs2rCfotsK0+AN9gF+YRF
	ZhnFLxmMD5NJmNy5PIaT9ho=
X-Google-Smtp-Source: ABdhPJzIrCFOo0eiP8MxWhbZw3VV3cxplb7U2Gsw28q2AGWfsBBjPEgKHks424+y3z36m1ru4TB1Ug==
X-Received: by 2002:a05:600c:4f09:: with SMTP id l9mr19610113wmq.114.1623434731861;
        Fri, 11 Jun 2021 11:05:31 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
        by smtp.gmail.com with ESMTPSA id a1sm8888617wrg.92.2021.06.11.11.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 11:05:30 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg
 <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-6-mnhagan88@gmail.com>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <15622641-7689-551e-3e56-35a9eed62828@gmail.com>
Date: Fri, 11 Jun 2021 20:02:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610232727.1383117-6-mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/06/2021 00:27, Matthew Hagan wrote:

> diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> new file mode 100644
> index 000000000000..0045a33055c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX65W.
> + *
> + * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm958625-meraki-mx65x.dtsi"

Should be including "bcm958625-meraki-alamo.dtsi". Will fix in next version, subject to any other feedback.

