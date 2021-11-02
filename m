Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46F1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 13:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD87610A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 13:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CD87610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmONe9nYfyM4mf1kzwdp2YRQ6MY5pEhd6GJXXHOmdgk=; b=NcKW+eMF+Tp6t0
	Yrj6x4F9PVNy4aAZrRTJg+0XRVG3Oonaaj+dGwq4tkGEeNZJ1Q0n0olCPCMPMgj4Ds4BuCwfw75SM
	Ws1Eq2NuB/zENqzxoaK8Gi0WFyCjsyXSNISv+A+8vmNmipjLLSz2VKoTNpoA553v2EBt+Eh4pEv2b
	ccwo6c3HDdDcEFHY4dL1jhBEwgI7HlgMP+un2CmpWjYNCDDyeh4YcYsBKSP1YuY0hkPI9TxizAFg3
	d2VssmKtoAsZwIxLL3ysW/0qgFnaqJpdCgqM4Wo+Doo3jrup2IbBNQP1ZPgkw2uc7+TUXIr3cJovl
	/EPGv8SAXYOBINXn41AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhtVh-001kCL-MM; Tue, 02 Nov 2021 13:07:29 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhtVc-001kAS-RX
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 13:07:27 +0000
Received: by mail-ua1-f42.google.com with SMTP id e10so37866593uab.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 06:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkTP1A6qXwuEKMshM23kAiOxOnfyNG09RSd2SDdbGyo=;
 b=aXw6qE21eyrMydSW6m/HcMyneZNh20chOLJbd6vUaEvB9QGhbSCxuSRJIz5bNEsgZF
 o5hkFiOoSMCjrXNENvyp5oRSa/WW/WNZ+isYQEc/3495mPFGea71Qd2cp5KYNV+snC9b
 frt/2E5eKFNL8e7tZZmaaFpAACP+bj/Z9+n9cTnQcOlGqS5GW0oN5YkdOeqs0DFDAB3l
 xHnaUdbPDAB0y996KcWpHJXIFcl5im2BHNDqNAj7ZYtKmSESLiojX0lMCwi0/pZpxOlT
 vrnQl7CkWz/zS/dA+CodHDrNcSVdh+kP3tOoxEzuseEMuipypkg9I7Pb2+ouIyqpDhTc
 SbTA==
X-Gm-Message-State: AOAM530eoflZlzqUsf+amMeNhAjbCFPO598emtJU6SHwb3MiREKsHIbt
 sVpHvJbgCVq0Meoi6CBlY3hYOQ57MlDLbg==
X-Google-Smtp-Source: ABdhPJyLyvZfh2GeQl7WexcyCOa7bOPV7K4d6ar377ynrxttjTx1T4fRUA7B8e6wLkSUQcRWFU90lQ==
X-Received: by 2002:a05:6102:3ec3:: with SMTP id
 n3mr39276876vsv.48.1635858442615; 
 Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173])
 by smtp.gmail.com with ESMTPSA id f6sm7425vsl.4.2021.11.02.06.07.21
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id u130so9561005vku.2
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
X-Received: by 2002:a1f:2906:: with SMTP id p6mr15272478vkp.19.1635858441673; 
 Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210928203815.77175-1-luca@z3ntu.xyz>
 <20210928203815.77175-2-luca@z3ntu.xyz>
In-Reply-To: <20210928203815.77175-2-luca@z3ntu.xyz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Nov 2021 14:07:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: apq8026-lg-lenok: rename board vendor
To: Luca Weiss <luca@z3ntu.xyz>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm-soc <soc@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_060724_911724_144E07D9 
X-CRM114-Status: GOOD (  22.16  )
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
Message-ID: <20211102130710.MWN4QTdE12nkJPG_wPMcC5mk2oyfHYMHkHfBIv-EecI@z>

Hi Luca,

On Tue, Sep 28, 2021 at 10:39 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> In order to avoid having prefixes for multiple internal divisions of LG
> use the "lg" prefix instead of "lge".
>
> Fixes: ad3f04b7bef6 ("ARM: dts: qcom: Add support for LG G Watch R")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/Makefile                                      | 2 +-
>  .../{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts}   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)

What about the second board DTS using "lge"?
arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
