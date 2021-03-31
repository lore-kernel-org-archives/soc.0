Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040A5C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 20:20:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8174060FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 20:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8174060FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UooJXSSvD/nhVGSJDIJDQPXKuCUaMlw8++Qj0EfVDGk=; b=R40QRIAHvlvsmCvd3HkRvfzSp
	JJhxhlUIK7jvE5tF7gBBxB39DkG0mFM/mpG1KuofqegI5NJn9Gp4Hgxgj684xfIjDKrrCto6eweRM
	JhVB3L5klmgFwQmvJBNBmX2IoOHuCQEiX8jx6K2HAuAtcd5gwmOumd1OcjZSG9tO63RSv9owzb8N2
	rAJeNLmBXwAn/7oHGifsS1UCaJSBG6+otpFuRWPXdElxZw3VzlkSZuta5e6HMUp+IIQ+azw9eXJ7B
	WHLJ92ahwXOwu4sjbvsolRYDLR6fseiO3zsyYWgOhc1yQbM4y8/GkkoeCmjSO4WBKXHSH0gzKwTeb
	oR9mcTpJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRhIj-007SgU-2v; Wed, 31 Mar 2021 20:18:53 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRhIY-007SZI-RA
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 20:18:47 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mnac7-1lrAgy36NJ-00jayP for <linux-arm-kernel@lists.infradead.org>; Wed,
 31 Mar 2021 22:18:37 +0200
Received: by mail-ot1-f44.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so45508otr.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 31 Mar 2021 13:18:37 -0700 (PDT)
X-Gm-Message-State: AOAM530cBV3i4ZGy4IZ76oRUtKsBLcFiGWQcLXaCVfl48N84xTbmR1c3
 9QXXGG6Y/gTzy9o9giWwOIV3sGMtJtFIleStyWk=
X-Google-Smtp-Source: ABdhPJxsRxjHsGwWskqjS7tzLIlp3wnwgZmfEa2JmwdgPjoYnabwcBS4iIlqtbA+/XRCvJrTVW95ZXyg5/XzYNShilc=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3936070otv.210.1617221916064;
 Wed, 31 Mar 2021 13:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210331014603.2496983-1-danielwa@cisco.com>
 <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
 <20210331175709.GE2469518@zorba>
In-Reply-To: <20210331175709.GE2469518@zorba>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Mar 2021 22:18:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ANBD5q-J+Mr0up+wFBdWJG3Z2ceUP=aB29G7WMq1Z3Q@mail.gmail.com>
Message-ID: <CAK8P3a2ANBD5q-J+Mr0up+wFBdWJG3Z2ceUP=aB29G7WMq1Z3Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: Add support for cisco craw64 ARMv8 SoCs
To: Daniel Walker <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Ofer Licht <olicht@cisco.com>, xe-linux-external@cisco.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:SGOl4+1iOyqk7biGsUzN+zCFObvYRGj40jAbSn+1tq36OISfQmh
 jVrNVjoIEZFEF5JTz0hW4+u2bPwVHTp96/o1dHYZzFo+yrmhABKCLssS8Kwf+xAdzUu22Dz
 x+D1WSr6AQstttVnAhrGDV2Px3HF64P4jMkeift3G0Q6rBURlGnJ6q3ZHyQt608DzKNcK/9
 1nMoBOqw8urxaypV0Wy3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZVFP/FkRHnA=:Z9+40gPE2rhnm+yPYZoF2+
 NLUrSC7/YjRT9eprGVQojbgyhfwKhqhQC0XgGs5XkUjCYzPEQb4plapFPogu18sVYxmBEfAQ8
 vjFIKuOLEiFG/uhkTi+0cjvuZjJj9w9WAHnNcLspIz7826149CZTWjjCNjaSVVfCdTkRwespM
 RYg4AZiAGvCUKuVvzobAYu24KsWnTU0PUryAYKQSS+t9W4kQhi0Zog3sPxYQE6yvTpRivtfq2
 78ZFoOeyw171ZLZ9vUwa/5dH1UcHPJiLo71zgdIvhVzKdHEh4jBq5YIZYACgoEzntwnbBoayN
 eJ3lJqAZgkg2vZMSqUufAqCtwzQ/uEkguWadHS7gdim5hUVpu56xKmUlzCjVLOPqyciT9LT2G
 pIg9vtZxkxS3t5jTd7pf4l3rVvGhGp6p8afGVKuG0rSUl6vpE19ZNs31rCj1vAxJdhU/n0zHt
 3nMVXG7s9a/BCoeakPgvWx49+Ykagrk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_211845_030259_6C2A5D55 
X-CRM114-Status: GOOD (  25.46  )
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
Message-ID: <20210331201822.n8JXyDlziesaTwU8kRDmna6A5WaAw9tdWa-G2OXIyZc@z>

On Wed, Mar 31, 2021 at 7:57 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Wed, Mar 31, 2021 at 09:04:15AM +0200, Arnd Bergmann wrote:
> > On Wed, Mar 31, 2021 at 3:46 AM Daniel Walker <danielwa@cisco.com> wrote:
> > > From: Ofer Licht <olicht@cisco.com>
> >
> > Thanks for the submission, it's always nice to see a new platform
>
>
> > > Define craw64 config, dts and Makefile for Cisco
> > > SoCs known as Craw.
> >
> > I'd like some more information about the platform, e.g. the target
> > market and maybe a link to the product information.
>
> Our SoC is produced as an internal product. So SoC specifications aren't
> widely available.
>
> Here is an example of a Cisco product which uses this SoC,
>
> https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9200-series-switches/nb-06-cat9200-ser-data-sheet-cte-en.html
>
> I suspect that's not really what your looking for tho.

No, that's pretty much exactly what I was looking for. Just put this one
sentence and the link into the patch description and it will be fine.

> >
> > The memory size is usually filled by the boot loader, just put an
> > empty node into the .dtsi file
>
> Arnd, I must regretfully inform you that Cisco has a deep dark addiction to
> bootloaders which, are, um, how do I say this diplomatically, um , brain dead.
>
> You have some other comments below related to moving things into the bootloader,
> and I can look into it, but bootloader inflexibility is wide spread inside
> Cisco.

Ok, no worries. If the bootloader can do it right, you should do it, but
this part is not essential.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
