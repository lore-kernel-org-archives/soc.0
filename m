Return-Path: <SRS0=ZaKQ=TZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A56C433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 10:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F025C340ED; Mon, 14 Mar 2022 10:27:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82AA9C340EC;
	Mon, 14 Mar 2022 10:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82AA9C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MmUcL-1nu0GO1y77-00iWXk; Mon, 14 Mar 2022 11:27:21 +0100
Received: by mail-wr1-f45.google.com with SMTP id t11so23070364wrm.5;
        Mon, 14 Mar 2022 03:27:21 -0700 (PDT)
X-Gm-Message-State: AOAM5324ft1pkh/4VALI2xrnHfvHTrQrF40zLFhkA2nEnc5MXuk9QNF3
	HdP7Tv7HDKhzKPMz2mnamWMaV/gAVpV20A3g5yU=
X-Google-Smtp-Source: ABdhPJzEqI1LonVZ6bGY0Zc5X1CtCNLufMa4XfGQ0mQSVCry0VjHQXsTUbzVOBx8Utrgu6D459mOK3Qcxj1FOdSYpI8=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr15782141wro.317.1647253641105; Mon, 14
 Mar 2022 03:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-2-singh.kuldeep87k@gmail.com> <20220314035118.gbjbrwbsywxljjti@vireshk-i7>
 <20220314065434.GA43329@9a2d8922b8f1> <20220314073102.l6vokyookzyo76hj@vireshk-i7>
In-Reply-To: <20220314073102.l6vokyookzyo76hj@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Mar 2022 11:27:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Go8xiQG=BLBmqoQiVqwkcR+T8gi0WLijzVfa3A_WuKA@mail.gmail.com>
Message-ID: <CAK8P3a1Go8xiQG=BLBmqoQiVqwkcR+T8gi0WLijzVfa3A_WuKA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1IBHx1hfR4NE9siIFW52xRE+h03VEZIupmx4RBHu5kYcWYxdcuR
 CunICejY5uY6Xq7AeRFYFhn2kHMzUMcwgsEhLhOqVFfmv+k7WRVmlcjy+ScLgJZACw9GTP5
 LDOXq/FgJQV0820X1uv+WO2C0Ly1R+kYiUFibJhVhpjI3zg9JutxmWDvyL/fnRSYqZk+Ow0
 PeRoUhl+rCg4enVQEPJRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lUNbedHtYIQ=:3Q1oHK44iH9cs1gsC8n7uB
 EtpHbVjjmWiHZj+vFmotPG6870Bgso/M8YfKtFw0AjBcD8M1xmj1xuwB0YgaUrARmHKKquFgZ
 vw4kl2e5vCTPYYVILojhU/38RblQq6Dg9KhLIzHzz51l4aGHQXlcFYu4zYqnmkxDX90po6W2s
 tSe3xQgjsxURpU+1YFHMdJIgsfXEhcdvIJKnCVrvkSLZ/xir+wPxe0c/83wf8YZ3rzP4xZH44
 T6u7YDigAUJq+BwbDJiuhj9dCUptprCFyH5zQQvvO42CAWgWL4PBni4FUE287eNHyNRuBSfT4
 oG6xVAoKFPdmADKTZ+uAEOT3nCg546ihNmiRqSAhR1f29TMlUOEt/a4bdUqrwPRLeAuep0INP
 Qs4mqZ2E1WxKCYqG8hdDWdXXnOSaR1lrpwOpY8jr2fJmLJtpQFYoNvHTEAvuTVk4eygUP9BMa
 PjGUmd9WBI+to9XujtMijN7NL0EDk5iCWxApTpNCuz74wrqLQjCWO/rIiTZKKRqcw1oxWjGQY
 sYG/ReiILYzjW/SAUO9xBjDu/QDgdb8a3EsUk0LUXiN+ZFKISFaimNltPVSXeWOhXyPxg3LUP
 FB3TSD9sC5u1U/x7CPTF97S+ykZO3VBwlaN0jQQSwckE9QX6H3zQHKtN+m2dJusFxs68i+SXD
 tnVLXOk4keIwLQGWpk93KZSqCRYPqvQfg5gqRdv2omCRcVLXff0AaXhl6u+yp4XOmrjc=

On Mon, Mar 14, 2022 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 14-03-22, 12:24, Kuldeep Singh wrote:
> > Dma-names order matters here.
> > As per pl022 binding, dma-names order specify rx,tx and all DTs which
> > have tx,rx as order start raising dtbs_chek warning. Thus, need to
> > reverse this order. Please note, no functional change in this patch
> > apart from just fixing warning.
> >
> > Warning:
> > 'rx' was expected
> > 'tx' was expected
>
> Hmm. I see your point now.
>
>   dma-names:
>     description:
>       There must be at least one channel named "tx" for transmit and named "rx"
>       for receive.
>     minItems: 2
>     maxItems: 32
>     additionalItems: true
>     items:
>       - const: rx
>       - const: tx
>
>
> I was expecting above to allow adding the items in any order, but
> looks like the order is fixed with this.

I don't think that it was meant to have a fixed order: unlike the other
bindings that define xxx-names properties, dmas require giving
names to allow the DT to specify more than one possible DMA
specifier for a given name. This means that nothing may ever just
rely on an index but has to use the name for lookup.

OTOH, while fixing the order in the binding does not add any
value, it's also harmless as this should never be able to break
anything that worked for any combination of old/new dtb and
kernel, and it's probably easier to express in the binding.

       Arnd
