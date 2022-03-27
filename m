Return-Path: <SRS0=7NJY=UG=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D083C433F5
	for <soc@archiver.kernel.org>; Sun, 27 Mar 2022 19:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0401FC3410F; Sun, 27 Mar 2022 19:23:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B173C340EC;
	Sun, 27 Mar 2022 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B173C340EC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id r7so16308154wrc.0;
        Sun, 27 Mar 2022 12:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zgcx8aJm5CfWxpMNK/GioBCzvGQ41eUiuqee3qCSfhc=;
        b=Q8BAsK4yA+Q6MI6hyE/zaCua6kx8Khc5YuwN50Y+FBi4fUs3bzJJmfEqfVDUpdx9eC
         5D2g3yOgS+whWcNomUdl8cGkXiTmYuv+1YSihaQPo7HTRZp/CAYxJWLedtzkaFwk9fzA
         UKzh4+74J4rrvpqZpa6xCM1cBXrQe+BsIGK+2tcBV7S9TSR+t6SRnoBJomklkPUM754r
         OpFF74gAuiA84ieK9MQ0oitQKmXso7Eb3OuX0pa2PergDs6snYAQl0q65tuJXXZ1Blti
         M6PLRd7F1j0kPfv3acqkQxXW+zFYR3glLllBmXlR+02IKw5MBOZdGgHCTk7n+QE5+m1C
         QYkA==
X-Gm-Message-State: AOAM531u4mzfgTQvXmGMnZyFoYttIi5BbYCoBaDZyqDmlBtd9MaUbX7i
	drZtw3GyVnOyOL++UujzG7w=
X-Google-Smtp-Source: ABdhPJwz74EFMZa+aN8vziOQkfDg08cVKNG3OJ+6CvuTEeqEJYNYitYqQ29X3l9Zsc2s/FNi/3XGtQ==
X-Received: by 2002:a5d:6da8:0:b0:205:8537:af57 with SMTP id u8-20020a5d6da8000000b002058537af57mr18060098wrs.80.1648408987696;
        Sun, 27 Mar 2022 12:23:07 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id a6-20020a05600c224600b0038cbfb9cfbcsm11595292wmm.47.2022.03.27.12.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Mar 2022 12:23:06 -0700 (PDT)
Message-ID: <0ed1a650-d3e3-6ee1-05db-b3760b3cd245@kernel.org>
Date: Sun, 27 Mar 2022 21:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 12/12] ARM: imxrt_defconfig: Add i.MXRT1170
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
 <20220326144313.673549-13-Mr.Bossman075@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326144313.673549-13-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2022 15:43, Jesse Taube wrote:
> Add i.MXRT1170 pinctrl, clocks and USB to imxrt_defconfig.

You add many more i.IMX unrelated functions, like USB gadgets. Please
explain in commit msg why do you need them.


Best regards,
Krzysztof
