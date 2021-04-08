Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B6AC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 22:14:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D75761107
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 22:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D75761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kmrs6+z9tk8s+YOMzpKhUmW+rcIt6IPvZ/Y1JwsHgNM=; b=rJotNWBUTiiahWE06u/z3H1+9
	nAn34Dx8YxvFHuVLm+Pe4J/0zQ4DxMD0/XD3qSPQExkliPv9rsUD0pnXzfETN6vQ1gYGyofMHXRvl
	iPZ285TmavQ3ulrApZaNl5yqUjh7i1H5r50Eyfbgm31G7L366nUn20pBu1xCgjeMR5fVmq0QNyFq8
	kKjgyzskyXgi//ynrWf57IM4G4V6toJ2UiRrflanGTdg2MUKyEmE7fYWNpMuTddS2C8sLeuq984Cu
	FISIj6PQfY2IBRTfW0BQv47MDqGQdqjwlpgNvATRFvbSFxINtn2bHPUdRj71dut62zdoffxVz2o+9
	QGKpDu0pg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUcsZ-009M0B-8a; Thu, 08 Apr 2021 22:11:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUcsV-009Lzn-Ew
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 22:11:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id w28so6516351lfn.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioJ10CTBsTjkn9xL6Be686Hj+jHT1alauBLQtGYqWa0=;
 b=K/Zcl/K0msGqq95CBiI/1f5tvFQ7Nv4lRy21tpAg8kaxbf7cgeMiS0cv4T3lnWleA2
 r207Yc+Mc+IrxKmIaJAejXh/b1axYFI35RA+oI8EPJ2TVbzqvn3Qoktcl2GYlsPoP+km
 tuN/LsNg4R9HHcPJzt48h60dQkhoN7yXQBWEAKt8hdnvqgTdMxgpS+38Qr2LakAr0bjg
 63f385BWGGOd0XEVBGlPq09IDHeUdXq5duuf/5caUB2YFzHvesvNZXPEgdxhgoMB0kks
 QaCzHzrTuNc3goh9yjVwNeWzmTs73Sr2N4L/0uAwuKdAsYh6x3EFOq0J8wTK8cPglTP6
 Fd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioJ10CTBsTjkn9xL6Be686Hj+jHT1alauBLQtGYqWa0=;
 b=LDzfqpeG7dM05/PudLTDcDHxsUWSE+7q3ruZ4+SDv9/xJ3ci+mj0TxkGVyrWwd3T3A
 x3FqrYw8HQSS8oufSuoNiCr2GZ/aufH45pOvSLEc5KZawNiCdXZI04xwbRWpRJ1PRhEi
 caNUcna/JaQygPfyDrLWh6teK4GetYNzclqsu0GriZ08fdu0drkCpg7cY1aMVmTuc7Ud
 9qJwLg/i3QENIAFJ5B+1KvKx1PXrwPKSe6h0Paa6Ryw2zugn4YEuwxcCwwzKFEu5s/An
 xidrLhDx3VgNn+plTrUyUrNVXfZFCaO3JrHj4esGlt8eJBwbIr8e7zij/GvB9zv4OcUD
 4l1w==
X-Gm-Message-State: AOAM5330Jr+l+noaF/pE/LCatUAMPPpT3WQZAdubwicRQMOawGkh+uxx
 ZfrAK8WIHb0mqVqaMB6hQnnqmD7D27yVEq2/JDfObw==
X-Google-Smtp-Source: ABdhPJz27ymMDR1dUEGPuUztSRP4eit7GdrXQuLeZavzg3ufC0FEXhTcV+mU85qzPX7FbSTioVON1nl/5qRtMHAr7DQ=
X-Received: by 2002:a05:6512:c0b:: with SMTP id
 z11mr8544156lfu.586.1617919914405; 
 Thu, 08 Apr 2021 15:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Apr 2021 00:11:43 +0200
Message-ID: <CACRpkdZ8iDwH5EPiZxGzEU5p-69A5X+MUEskooe21u_j12n5Ww@mail.gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
To: Arnd Bergmann <arnd@kernel.org>, Jonathan Cameron <jic23@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_231155_579412_3A1C9C1C 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210408221143.fPdFcwarKTS_XKtg4iy471JvE411KzGWuI73a0OaY7w@z>

On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:

> arch/arm/boot/dts/ste-href520-tvk.dt.yaml: accelerometer@19:
> interrupts: [[18, 1], [19, 1]] is too long
> arch/arm/boot/dts/ste-hrefprev60-tvk.dt.yaml: gyroscope@68:
> interrupts-extended: [[22, 0, 1], [21, 31, 1]] is too long
> arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: gyroscope@68:
> interrupts-extended: [[25, 0, 1], [24, 31, 1]] is too long
> arch/arm/boot/dts/ste-hrefv60plus-tvk.dt.yaml: accelerometer@1c:
> interrupts: [[18, 1], [19, 1]] is too long

These warnings are all because the bindings in
Documentation/devicetree/bindings/iio/st,st-sensors.yaml
are slightly incorrect. Several sensors have more than 1 IRQ.

I was working on a refined version of the bindings but got
sidetracked.
https://lore.kernel.org/linux-iio/20210104093343.2134410-1-linus.walleij@linaro.org/

I'll try to get to it.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
