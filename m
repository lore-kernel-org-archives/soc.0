Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC29C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 22:23:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF19760E05
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 22:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF19760E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uMMHMtlXrSrMMkEZTeFH/EhYBJB5KPp08Y0su8vLU0s=; b=xZsAqx4XsrlBygBh1qT4WFzQ8D
	pKU5uNLwE6x9aGZyv/fBVGLH3jpoihADUZJiIDAVF+Y/CXQEi7vNkxPfCHlwnhgzo3a3tqGe/9rmH
	adzzYWRWaSf7wXJHNXKYmP8mx5x2+jBtqpCpW0P3TZ9rD7lO0rylQO1EvT/zNQEVfvIt4CUCPc1ZF
	erDqX1U3GN4iY/Y/DgHwKAo2pdjQGvq3fkk3j1RB1P08l5jXkwutJc4Uq3DWoxy88UchDbTs76Dxa
	eyuEwH6C66lTVCFTJeRgRE+ATga05NmY4MImXZJNVX4YBUHX/G4S6ol6XrFc425359/FeyMTVLVhJ
	QSjFVHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1melsU-00EiQ3-74; Sun, 24 Oct 2021 22:22:06 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1melsQ-00EiPj-1n
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 22:22:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id a13so10016412qkg.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9ncurX3TaX2r+KRIahQhViZWdSQLGqym5eYqOGdMFmY=;
 b=dy/qQaSfalOC797IGCHjeiHIGgOIKYRtzs+71nz8jiWATJK/JtNHcnKC2GszBndsRz
 DxCJWVUAEE/Jeu0XM2ZWTFjWCb6fBbhGsUrxqnR6vtUhzQ5oOOXYdR8Ryy9zpYxVlrr/
 GLVRyy6V1NMR6FkqjlbZqJnPHRrYkiiW6K+3m3vKkw+58uBQKQN7i2Y3+lT3pRYWNkGG
 t+NphDwcGy9h2FcTf+uuN8s64sn00pVbe4dopWeSwQy7gHRYLZifrc+kDzH1rJMIbrEu
 f+cd0BQpCmBOCzqk8GRUlLzVCj83HbHK+dA6hqJzZi/XjeaOw6jT2WSUxKjwrVzIe0z3
 pGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ncurX3TaX2r+KRIahQhViZWdSQLGqym5eYqOGdMFmY=;
 b=i2EwAXW+BLoKhx81HgfHU5P+QVJ2321f288vxUpekiqILTE+aXj0KVmMiGLLPXqwwM
 uVlZcgeIy0gIl/zvwWHgRaIdATMVzWACGDU2JmWDc/GThNh0jElFLgaTZucK+FMXyWJp
 vBpxfAII7jc9tWnsXqEs6x3NyQP1v6kGPTNHP8CEk9LGlcmVyEVul8cKfdNHgP4GQhO8
 +9R76aUws+Yfy0ZJlH0oqUMhIIuivwEEm62XoPl8hvuQ83EheTZpZAucLpXmmkg1851D
 quMg2W939lcVf/+G09mLC1jkRX+5jXtIof/pLQptIATZR7tmlr+cqZqgoSMf/5C/vNx9
 neeA==
X-Gm-Message-State: AOAM533LTxdf7oirXijD2j4AAZTxSQE9QOeTmHl8ZlGxYcEtVDBc5Xrt
 012tOmV++0gA2AJLkf4olRI=
X-Google-Smtp-Source: ABdhPJxH3dXajawJmgGedUFt/0s9RkSQOpUZRanfORVnF05b6MtQzzbf90iWYh6sgaNjBabsAL6DrA==
X-Received: by 2002:a37:9c57:: with SMTP id f84mr10900583qke.16.1635114118201; 
 Sun, 24 Oct 2021 15:21:58 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id i2sm6030226qti.92.2021.10.24.15.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 15:21:57 -0700 (PDT)
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>,
 gregkh <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, giulio.benetti@benettiengineering.com,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com,
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
Date: Sun, 24 Oct 2021 18:21:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_152202_167065_D6AE09B9 
X-CRM114-Status: GOOD (  27.88  )
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
Message-ID: <20211024222156.1bvP7k679VavsR9-Rj9c0mv3WBrlq0hPABztdFBX7Q0@z>

Hello Arnd,

Giulio is in CC

On 10/24/21 3:32 PM, Arnd Bergmann wrote:
> On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>> Add initial support for the i.MXRT10xx SoC family
>> starting with the i.IMXRT1050 SoC.
>> This patchset contains:
>> - i.MXRT10xx family infrastructure
>> - i.MXRT1050 pinctrl driver adaption
>> - i.MXRT1050 clock driver adaption
>> - i.MXRT1050 sd-card driver adaption
>> - i.MXRT1050 uart driver adaption
>> - i.MXRT1050-evk basic support
> 
> Can you expand the description a bit more so it makes sense as a changelog
> text for the merge commit? It's fairly rare these days that we add support for a
> MMU-less platform, so it would be good if the introductory text answers
> questions like:
> 
> - what is this platform used for, and what is the purpose of running Linux on it
>   in place of the usual RTOS variants?
> 
> - are you doing this just for fun, or are there any commercial use cases?

The purpose of this is for learning and fun, as far as we know there are no
commercial use cases, but we hope there will be.

> - what are the minimum and maximum memory configurations this has
>   been tested with?

We both have only tested with 32MB of ram on i.MXRT1050/60-evk.

> - what user space are you testing with: any particular distro that supports
>   this platform, and do you run elf-fdpic or flat binaries.

We are using Buildroot[1] and that only uses flat binaries.
i.MXRT1050/20 have already been up-streamed to U-Boot[2].

> - are you planning to also support the newer i.MXRT11xx or
>   Cortex-R based designs like the S32S?

We plan to support the i.MXRT11xx, but unsure about the S32x, it depends 
on the interest. 

> 
>        Arnd
>
[1]: https://github.com/Mr-Bossman/imxrt-linux-buildroot.git
[2]: https://source.denx.de/u-boot/u-boot/-/blob/master/configs/imxrt1050-evk_defconfig

Thank you, 
Jesse Taube.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
