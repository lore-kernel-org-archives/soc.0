Return-Path: <SRS0=+Dvu=VB=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF8C433F5
	for <soc@archiver.kernel.org>; Sat, 23 Apr 2022 16:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF11DC385A5; Sat, 23 Apr 2022 16:11:29 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC554C385A0;
	Sat, 23 Apr 2022 16:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC554C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id d198so7960612qkc.12;
        Sat, 23 Apr 2022 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lQVbIb2JtzfXlFMXF5sUujmihmQB1ITOpgM0dRlM/bE=;
        b=ad8l34Oy3g2XPQbKV5BOfbYnWHL9BOhdVLt8MCnK6mVOd/h1q9YEE3evE+OIlHSuwn
         CBUXm5m0Dtn6SYBy9VqsDnR816pbRFPcaDZKm30baLR96P80nZX5xyx8IJ36I/IxFO7s
         YDuwaQyZi+6VnxE/QcF3+tqIFx/UWV0QntEDQxYGdkwJfAPjnulsvber14U5RK46Uio9
         kepo/Id4gojp/BwtMAOqZpUXaYG+utfJVHyHwiOivbnEnLJqXNSNgxUgiO3uDMycnfPV
         8mMXhvikabVraP3RqpOS+e9PVKZx+G1Zp0zerh1E+q2CWz05Xaqn7UKS+7conFkou/1Y
         nrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lQVbIb2JtzfXlFMXF5sUujmihmQB1ITOpgM0dRlM/bE=;
        b=dBqTaiOcozW8o+v3AFiQCpiyuLD2rfu8g0X1AVr6VPUC4GJMYl8NHmZDk4kCex3z9R
         t3Rnov9iWC8/2XRmnXfagaOCsrkC6pwesUa4j0enMD66ED1nqM/gSiqZvlo6Dau+sVyI
         fSgkH5qhWcl4W8E+hKhNXiDFQexowIy+eV4555rA1pZxckE9HwYsZqnper5ENcSqq46p
         qA8F9tsaUq4/Pv1zlHgdBwDJzltwtB7nqxQpCCFQb3Ijw2Sj8mRJUoqk8HkhUrgbNp0M
         ab3VZdKmaQvaRqdE0MsKhdLQF1XHTCCEqEjKXh2vbvxJ9Jlrc0C4qJ1hufcvSdAaOvW9
         pGvg==
X-Gm-Message-State: AOAM531sTuNRfUenagSx0ObfjDC1jPfhZE69iGET3RxRnGRHKTwRdxPS
	wEo8evd0I+Qq689LbrfI34ku7RkTOeY=
X-Google-Smtp-Source: ABdhPJyEa8wserA/9fHwGUzW4LPvUsGSMRtuwkuiUXVL6tdG873QFklMkWNFcP5Zzqyv413p0LJh+g==
X-Received: by 2002:a05:620a:bc6:b0:67d:1870:8b35 with SMTP id s6-20020a05620a0bc600b0067d18708b35mr5751141qki.85.1650730287404;
        Sat, 23 Apr 2022 09:11:27 -0700 (PDT)
Received: from [10.4.10.60] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x20-20020ac85f14000000b002e1ee1c56c3sm3047852qta.76.2022.04.23.09.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 09:11:26 -0700 (PDT)
Message-ID: <b02942e9-20ba-4407-4505-adaeea887d9c@gmail.com>
Date: Sat, 23 Apr 2022 12:11:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 08/12] clk: imx: Add initial support for i.MXRT1170
 clock driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
 dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com,
 leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-9-Mr.Bossman075@gmail.com>
 <20220423030331.0E85CC385A0@smtp.kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <20220423030331.0E85CC385A0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/22 23:03, Stephen Boyd wrote:
> Quoting Jesse Taube (2022-03-26 07:43:09)
>> diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1170.c
>> new file mode 100644
>> index 000000000000..041aea3d4b02
>> --- /dev/null
>> +++ b/drivers/clk/imx/clk-imxrt1170.c
>> @@ -0,0 +1,391 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright (C) 2022
>> + * Author(s):
>> + * Jesse Taube <Mr.Bossman075@gmail.com>
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/of_address.h>
> 
> Is this include used?
> 
>> +#include <linux/of_irq.h>
> 
> Is this include used?
> 
>> +#include <linux/platform_device.h>
> 
> Need to include clk-provider.h
> 
>> +#include <dt-bindings/clock/imxrt1170-clock.h>
>> +
>> +#include "clk.h"
>> +
>> +#define CLOCK_MUX_DEFAULT "rcosc48M_div2", "osc", "rcosc400M", "rcosc16M"
>> +
>> +#define LPCG_GATE(gate) (0x6000 + (gate * 0x20))
>> +
>> +#define DEF_CLOCK(flags, macro, name) \
>> +do { \
>> +       hws[macro##_SEL] = imx_clk_hw_mux(#name"_sel", ccm_base + (name * 0x80), \
>> +               8, 3, root_clocks[name], 8); \
>> +       hws[macro##_GATE] = imx_clk_hw_gate_dis_flags(#name"_gate", #name"_sel", \
>> +               ccm_base + (name * 0x80), 24, flags); \
>> +       hws[macro] = imx_clk_hw_divider(#name, #name"_gate", ccm_base + (name * 0x80), 0, 8); \
>> +} while (0)
>> +
>> +enum root_clock_names {
>> +       m7,             /* root clock m7. */
> 
> Is the comment adding any value? It has the enum name after "root clock"
> and the enum is "root_clock_names" so it looks very obvious.
> 
>> +       m4,             /* root clock m4. */
>> +       bus,            /* root clock bus. */
>> +       bus_lpsr,       /* root clock bus lpsr. */
> [...]
>> +       end,            /* root clock end. */
>> +};
>> +
>> +static const char * const root_clocks[79][8] = {
>> +       {CLOCK_MUX_DEFAULT, "pll_arm", "pll1_sys", "pll3_sys", "pll_video"},
> 
> Space after { and before }
> 
>> +       {CLOCK_MUX_DEFAULT, "pll3_pfd3", "pll3_sys", "pll2_sys", "pll1_div5"},
>> +       {CLOCK_MUX_DEFAULT, "pll3_sys", "pll1_div5", "pll2_sys", "pll2_pfd3"},
> [...]
>> +       {CLOCK_MUX_DEFAULT, "pll2_pfd3", "rcosc48M", "pll3_pfd1", "pll_audio"}
>> +};
>> +
>> +static const char * const pll_arm_mux[] = {"pll_arm_pre", "osc"};
>> +static const char * const pll3_mux[] = {"pll3_pre", "osc"};
>> +static const char * const pll2_mux[] = {"pll2_pre", "osc"};
>> +
>> +static const struct clk_div_table post_div_table[] = {
>> +       { .val = 3, .div = 1, },
>> +       { .val = 2, .div = 8, },
>> +       { .val = 1, .div = 4, },
>> +       { .val = 0, .div = 2, },
>> +       { }
>> +};
>> +
>> +static struct clk_hw **hws;
>> +static struct clk_hw_onecell_data *clk_hw_data;
> 
> Do either of these need to be static global variables? They could be
> local function pointers allocated on the heap (like they already are).
> 
>> +
>> +static int imxrt1170_clocks_probe(struct platform_device *pdev)
>> +{
> [...]
>> +       hws[IMXRT1170_CLK_PLL2_PFD3] = imx_clk_hw_pfd("pll2_pfd3", "pll2_sys", pll_base + 0x270, 3);
>> +
>> +       /* CCM clocks */
>> +       ccm_base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (WARN_ON(IS_ERR(ccm_base)))
>> +               return PTR_ERR(ccm_base);
>> +
>> +       DEF_CLOCK(CLK_IS_CRITICAL, IMXRT1170_CLK_M7, m7);
> 
> Don't have macros do things to variables that are in global scope. It
> makes things very non-obvious. Instead, pass hw to the macro, or better
> yet make a static inline function and let the compiler decide to inline
> it or not.
Ah I use the enum name as the string clk name so inline unfortunately 
wont work. Thanks I will fix `ccm_base` and `hws`.

Thanks for the reply!!!!
> 
>> +       DEF_CLOCK(CLK_IS_CRITICAL, IMXRT1170_CLK_M4, m4);
> [...]
>> +       DEF_CLOCK(0, IMXRT1170_CLK_CSI2_UI, csi2_ui);
>> +       DEF_CLOCK(0, IMXRT1170_CLK_CSI, csi);
>> +       DEF_CLOCK(0, IMXRT1170_CLK_CKO1, cko1);
>> +       DEF_CLOCK(0, IMXRT1170_CLK_CKO2, cko2);
>> +
>> +       hws[IMXRT1170_CLK_USB] = imx_clk_hw_gate("usb", "bus", ccm_base + LPCG_GATE(115), 0);
>> +
>> +       clk_set_rate(hws[IMXRT1170_CLK_PLL_ARM]->clk, 90000000);
> 
> Use assigned-clock-rates?
Sry left from testing.
> 
>> +
>> +       imx_check_clk_hws(hws, IMXRT1170_CLK_END);

Thanks,
Jesse Taube
