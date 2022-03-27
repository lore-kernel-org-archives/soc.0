Return-Path: <SRS0=7NJY=UG=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4346CC433EF
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E84CC340ED; Sun, 27 Mar 2022 19:13:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B16DC34100;
	Sun, 27 Mar 2022 19:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B16DC34100
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so7299697wmb.3;
        Sun, 27 Mar 2022 12:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BVCp6R/bmWc9t+8wj8QpgDL3b81JxuDJTlmQAPj0K/4=;
        b=1kPt1prTL+FgXTxA2PRarV0bHsrFd4fAvnsskWmW0zieVvHME0inEuFvZ4vOkY7fra
         cdyHZPLRpjGegds60DD7YrU7q82b0oyOvy3jLeFIsFaxkb0P2qQ1JOi+RpElJn3AEISU
         RN+rwjGnjQ37Sj8coqMQY5fPBfwZOaz7tSNMxEFP7voFyVHlQp75pxHI378wASs7IgAF
         ygbPI4sDZr51qmUkkiXa7pbuDUNMQcoXo5bfNLINBivE4FAMvpk6MhvxMVONixDJiJxO
         xm4CQRl4f+ovfTbhkhVl8+zlMF9fTkrsFOhI0UrvykJfLdgcM63JuvXZmDe575WruQpH
         RPXA==
X-Gm-Message-State: AOAM531LSUGjwq/KT3ZKS50UuzFUE8WojXQVsthFDhVUzgmPbLC2lpXy
	PJ8TARQzDqh11J43dUJDbW4=
X-Google-Smtp-Source: ABdhPJz1ThdgV5jL/JaZHXiJEoLzVhLa5Jqgvj4nb0etRFVRMMo0BZoSi/gykc/fAulQXVpWCAFEwg==
X-Received: by 2002:a05:600c:34c2:b0:38c:6cd5:4957 with SMTP id d2-20020a05600c34c200b0038c6cd54957mr20928965wmq.19.1648408389806;
        Sun, 27 Mar 2022 12:13:09 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id t6-20020a05600c198600b0038cafe3d47dsm11047544wmq.42.2022.03.27.12.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:13:09 -0700 (PDT)
Message-ID: <2e00a51a-c408-d02a-e625-0fdcb6482b0f@kernel.org>
Date: Sun, 27 Mar 2022 21:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 07/12] dt-bindings: imx: Add clock binding for
 i.MXRT1170
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
 <20220326144313.673549-8-Mr.Bossman075@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326144313.673549-8-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2022 15:43, Jesse Taube wrote:
> Add the clock binding doc for i.MXRT1170.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  include/dt-bindings/clock/imxrt1170-clock.h | 282 ++++++++++++++++++++
>  1 file changed, 282 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h
> 
> diff --git a/include/dt-bindings/clock/imxrt1170-clock.h b/include/dt-bindings/clock/imxrt1170-clock.h
> new file mode 100644
> index 000000000000..6b94767c3a6e
> --- /dev/null
> +++ b/include/dt-bindings/clock/imxrt1170-clock.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*

The same license as bindings, unless you cannot.


Best regards,
Krzysztof
