Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E314C48BCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 12:14:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5E761153
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 12:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5E761153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:Subject:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CR48dUAVvhH8piCpvp7Q815bi7i6BL+pzj+/LxbKl54=; b=DoESAWPvtqWsXEkdVj2EEGPDku
	3RkgUsVJvk7rn5xgm3GCMUQ/8wuWi2eGEnLirkR/BwfCPrdwDI4YQoPzKGGPH+idD2auTAYB6iwhy
	P85ZsBsCYHSJrJYzu6Zgd9rGS88UEXQpdmGgDzaurpWx9gxZ1HSQCiXCvbOy47TckfptGnJYpvtdk
	5w9WxKgd/Dcyn2WNC20KiNPsXUb6sKTv6Ma2MOy1Qvj8nSveV5oev2wTHWny4QTkZRlJG9QqdYHNC
	I0sgCOLIXX8GT/C14zuQhUva1W74v+5FCGGNeoO9rl7YDWspErKY2OBk26tDpAsIhfpYX9y71d6ig
	r3RNTA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOz6-00AP4X-7e; Sun, 13 Jun 2021 12:13:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOz1-00AP3V-Rq
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 12:12:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id f2so11207934wri.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Jun 2021 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=MSBzfhNHhCZmKOAtF+feGhoOQgIox8era17UjUTrjUE=;
 b=l2Z1PgZ3TRJ86BB4Fs7L1ANwas3gPy9RlFUkMaQBKOB+gn/9IYQrEoF4G/L6Ndaeb1
 GzGwJIvQtzlZfa0izIRGGfQBWm609L01TBKh17QvkTT9uAl9lmKBIauSsKllCrnCx3kV
 5cdvOMfVjhCw/7OH+3v+cUI1tRqTbYPLM4DYShDFC1U2nUriGp1caHofZDgbhbMKRGUJ
 vg1/kshURdPlBksQMkNYy5nQPH378E3TC3y/TyEK/vOH4YYc+Vx/3qQVZatGxq3K9zxN
 NBo8kJV0lJXyet4BVyjT18OUtYPBsYjSh1Nm5P4tEg/fwgGMLNEAOX8iKKkInEbVPVuF
 OMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MSBzfhNHhCZmKOAtF+feGhoOQgIox8era17UjUTrjUE=;
 b=lyUQA8w4ULOB5S5YeeHGWWm++wcDJpEaFur95tBKpvd0nfCmsu4jqnawa8941wlja3
 7JOidYuoFJM0MunLGnKBX08/AsRCQz3FVsHDXmxUtmM0bBNNsIff+2PFrT280hzxpzi/
 maxlHtXGwpT6I225ylPjePzFwk7FWVXEZag9nPr4PvbZVpW2nNWj21q1wTpCOYoVWSKc
 kjVGVuSZlm/j2kTHar8v/K954Yb8KtV40wo7nsSv9vNPWDpP5O3wMMTm1RFBpjWkYzLx
 2ZmefckRmN8qxJl92d3NUQVb3fDfRNKgDzKUvMEsTbp3RdclQXQfUuxomCjjT857jR6M
 ypYw==
X-Gm-Message-State: AOAM533BV47N/ObR8I4SgHKttGEm56S/57hI3UrKZzFf8Y9E8I42pkND
 CcYh0m3XvGf0RF6lf2h4gXLNlarYl/zghg==
X-Google-Smtp-Source: ABdhPJzdsWlJYmHLVODebMS58JP6dspsTQK9rBvzCp8jXQPWPraySMRIFTEHeE+dz3xiXhHRJhSZXQ==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr13753573wrs.304.1623586373945; 
 Sun, 13 Jun 2021 05:12:53 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id r7sm22167353wma.9.2021.06.13.05.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 05:12:53 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
 <20210613101658.3242777-3-mnhagan88@gmail.com>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <c7dc1a7f-40ed-2b32-f581-fb5793003e91@gmail.com>
Date: Sun, 13 Jun 2021 13:12:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613101658.3242777-3-mnhagan88@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_051255_957994_B163C698 
X-CRM114-Status: GOOD (  23.35  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210613121251.4SNqz7Hx8rZ_fJVV7HwSnizjv0oGkr3XDvEnPrqiM2c@z>

On 13/06/2021 11:16, Matthew Hagan wrote:

> MX64 & MX64W Hardware info:
>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>   - USB: 1x USB2.0
>   - Serial: Internal header
>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
>
> This patch adds the Meraki MX64 series-specific bindings. Since some
> devices make use of the older A0 SoC, changes need to be made to
> accommodate this case, including removal of coherency options and
> modification to the secondary-boot-reg.
>
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   4 +
>  .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 165 ++++++++++++++++++
>  .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 +++++
>  arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 ++
>  .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++++
>  arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 +++
>  6 files changed, 307 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..83560b05f797 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -154,6 +154,10 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
>  	bcm958525xmc.dtb \
>  	bcm958622hr.dtb \
>  	bcm958623hr.dtb \
> +	bcm958625-meraki-mx64.dtb \
> +	bcm958625-meraki-mx64-a0.dtb \
> +	bcm958625-meraki-mx64w.dtb \
> +	bcm958625-meraki-mx64w-a0.dtb \
>  	bcm958625hr.dtb \
>  	bcm988312hr.dtb \
>  	bcm958625k.dtb
> diff --git a/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
> new file mode 100644
> index 000000000000..107c2167a113
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
> + *
> + * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
> + */
> +
> +#include "bcm958625-meraki-mx6x-common.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>

dt-bindings/input/input.h should be included in
bcm958625-mx6x-common.dtsi.

dt-bindings/leds/common.h is already included in
bcm958625-mx6x-common.dtsi and isn't required here.

Likewise in bcm958625-meraki-alamo.dtsi

I will hold off on submitting a v4 until the preparatory SoC patches
are sorted out.

Matthew


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
