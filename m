Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AF2C64E8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 09:12:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A19522202
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 09:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A19522202
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ZC5cGmSlXtFGBCECibTkoP3rYz/6Tm46HVXEgWYgmE=; b=p2FL2lLL/wODk16WPY/EJHe36
	fOVomiiLlsOXGsMB8gaq+1iLkM6e6Y6nyXX9oz0CNb2Ygg7UoVBGBCicoUH4V7Tyihzdf19zLUXW9
	+TNVkApBpCQqxHZVRkIzS4ZWy4c/yClVd+jNPwMYcCBrGnDdAyvRe3KH0EwPLWbHj7rH1omm0Gbxa
	/dM05DdObhDWqaFDjCHN7GAGfCqeW7hhARZZPTdua0+k/NraPUxxLV7oUETY+Ty7EEuRtWI0Fxx0H
	3bVPaEi/9tq0EY7KViPniz5DHZln8jjuLon8pdhZht1r2ges9o4L3l8JLt3s2baaa8mYeaGhhCZkU
	uA6X086Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkOA7-0000HK-Km; Wed, 02 Dec 2020 09:10:59 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkOA5-0000GF-0J
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 09:10:58 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 62so357637qva.11
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 02 Dec 2020 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
 b=Y5QtHYdkrX6aP/Zfes2Iz6RXNnojW27vyX/5CgTqb+ITygoCCJ2dfDbg2zQfOXAiic
 PF4gIiC7/Pfg7hZ/9b5KyW8cmfjNRwejA5zB5Pca6v0+vP80S/2MNkkd29UrKFoqUPwY
 EGUNWFX4S8E1fm9eVVgvgwraAIP7bfzNE460M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHXxAEFihpGexQosJgOwtA1rTxwRBPimbOCJs6PdyiQ=;
 b=GJqF6R/vsVBI/8QPSRuyDzOl2OkzaOBm0Qxoq4yXySxUp4wMSoX59aTViXFT34wxl2
 TvFPuHO1VWaOgOI29GgT1AQKr/oToSAH8qIWun37tTpDsrbzhQJvRDXHzhRW2Es3zQ+C
 izcse1hUAjmzdClVSK87hWqzgdx70rz+mlu8zXFaDNfICyg0twvwvahovdpyPkbh+pTb
 kK+mzAf+UypE9DsmnecGldR9OeGiyttIiZu31i+tdXpgPrjHSQTncu9yZAH8xcg7eQox
 kGmlto97H2BIOvDo2NIc57sEaywIzw+OAjGaJuDq+0Lcxalo8p5sb95N+76EkBcl9Pv4
 zxeQ==
X-Gm-Message-State: AOAM530hazFLRqRrWV1eGIgwbbSUBjd4gbTxcLWy/n9qifELlbRipy35
 UEghBfH3UIVCvbMjB07Em+HWIbnqoPRf8FhwPPuOqSswqQ53lw==
X-Google-Smtp-Source: ABdhPJytwEIZuRyGn05kO7fcdgPdlwgix3LuGPG61AnTa6cEDH4lUg49k1PEGAjiN9bs36DCjIusI58CiLW25Da9z0Y=
X-Received: by 2002:a0c:8e47:: with SMTP id w7mr1540726qvb.55.1606900254283;
 Wed, 02 Dec 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-11-daniel@0x0f.com>
 <20201201150425.GC1551@shell.armlinux.org.uk>
In-Reply-To: <20201201150425.GC1551@shell.armlinux.org.uk>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 2 Dec 2020 18:10:43 +0900
Message-ID: <CAFr9PXnME5UCyOdkRGFO2+=gv27grcq35Adrtio3ex4hq0CWEQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ARM: mstar: SMP support
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_041057_213374_F773C015 
X-CRM114-Status: GOOD (  15.53  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, olof@lixom.net, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201202091043.BKZN4U637M-rw7to6LHt-d0O9xFk65sHTYoE-8lyqAs@z>

Hi Russell,

On Wed, 2 Dec 2020 at 00:04, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, Dec 01, 2020 at 10:43:30PM +0900, Daniel Palmer wrote:
> > +     np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
> > +     smpctrl = of_iomap(np, 0);
> > +
> > +     if (!smpctrl)
> > +             return -ENODEV;
>
> Wouldn't -ENOMEM be more appropriate here?

There seems to be examples of both -ENOMEM and -ENODEV in other ARM platforms.
arch/arm/mach-aspeed/platsmp.c uses -ENODEV for example.

I went with -ENODEV there as the source of the error is most likely
the node not being in the device tree.
I didn't check the result of of_find_compatible_node() because for the
memory barrier code in the same file I was told it wasn't necessary.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
