Return-Path: <SRS0=yl/V=UE=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3CC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Mar 2022 17:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 982B3C36AE3; Fri, 25 Mar 2022 17:38:33 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF11AC340EE;
	Fri, 25 Mar 2022 17:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF11AC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id p17so8813041plo.9;
        Fri, 25 Mar 2022 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ayOYjTZU6HmufvMH+uKYpu/1dCIaQ5A33lYHz9+DMm4=;
        b=X+FNOez4egUGi+RaEDC5o5ifCxnPeAfq9cKoQQXRcF/X2s6qCcDabfodEZqtqP/0od
         lcKDpg5zdyKA0VfQxajowo2N9HrIRQBF1bBCnHD2DkeibXkuGPEgOt/UZGMsOcCk0gYL
         Prm8lhECgBMpAltiHAWJIMm2YO91CQDkFYQssH6ntOXpAWz4JChc3Gb4CrUDQmh5uvsS
         P3yCPBbSUoWo5SXyWtNxbVV/B8OxseinYxnd6EcJk/8egWfeCX2KLAKfdZXFur5oZWIf
         ol1ErG6sBtdoxsbv6c1zkZOtjZNrrYbybeS6kSTlU0snIT+/4aXoexhXhIMNsG1rQt7p
         SV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ayOYjTZU6HmufvMH+uKYpu/1dCIaQ5A33lYHz9+DMm4=;
        b=EBINez86sl4mVoUSjOZLOHIW1zpSXYougE6zZ/SyfWgBdX5wm1lgu/wv0G/ylUuUf1
         S3xYlO0tnX34xfiZSdycauIu4EeUNDhgvdWACix2dfOIk7J+YIs7sNcBZrSk/AbPUaLx
         GnnIvinTcXbAUru5K2WoBmPOuT7j1uXWirAt8e0dk+T7/73uswLyTd5VFoc6/W7tJvfN
         6Ud0BYH7ZA0/c0cbVroea+hXTrWEBFx1R9IOZX64Gjn9XDZIhT01E7Sjqs7AwR95IuAv
         jwLpZKsJausyr8/+Q43uCN2j+ISeHsuPfysP2e3yj6druEPg2M5bnX9yGJcDMBuDeX38
         a5hQ==
X-Gm-Message-State: AOAM531W3PheyhSosZctP6wCr7Wra2QIfio8OIpwwSF+Z/U3gVFQoQl/
	bGdARcq4VODi6sleJ9kXsRQPpbpQ5Sg=
X-Google-Smtp-Source: ABdhPJw3p6wgf3puKfvwDvOdglHa/WYaO+uhShtAN0fwz7BRG4eEy82IN781iCaO/bIGRTwjoMTc+w==
X-Received: by 2002:a17:90b:33cd:b0:1c6:5db5:5ff9 with SMTP id lk13-20020a17090b33cd00b001c65db55ff9mr14110308pjb.197.1648229912288;
        Fri, 25 Mar 2022 10:38:32 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id pi2-20020a17090b1e4200b001c7b15928e0sm6737763pjb.23.2022.03.25.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 10:38:32 -0700 (PDT)
Date: Fri, 25 Mar 2022 23:08:26 +0530
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220325173826.GA70042@9a2d8922b8f1>
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
 <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>
 <20220324062547.GA15504@9a2d8922b8f1>
 <20220325015849.sazvlevnvdqj5z42@vireshk-i7>
 <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>

On Fri, Mar 25, 2022 at 10:11:41AM +0100, Arnd Bergmann wrote:
> On Fri, Mar 25, 2022 at 2:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 24-03-22, 11:55, Kuldeep Singh wrote:
> > > Fixed order of values is important in case of properties like
> > > compatibles etc. In case of dma-names, yes order shouldn't matter here.
> > >
> > > This patch is more of appeasing dtbs_check warning rather than fixing
> > > something.
> >
> > Exactly my point. We have seen similar type of issues with other tools, like
> > coccinelle, earlier and such patches were rejected as the kernel was just fine
> > and tooling needs to be fixed.
> >
> > > It's safe to go with this patch.
> > > I am not sure if there's a provision to exclude dma-names from fix
> > > ordering checks. Rob can help here in providing better insights.
> 
> I think it's a question of the scale of the warnings: my understanding is that
> there are only a handful of dts files that trigger the warning at all, and it
> would be rather hard to change the tooling around this. Since the proposed
> dts change is clearly harmless, I don't mind applying it.
> 
> Kuldeep, you have probably looked at all dts files in the kernel, can you
> say how many of them are affected by the dma property reordering?

I have checked spi-pl022.yaml as of now and this was the only one which
was affected with dma ordering.

For all dts files, I can definitely give a try and will come up with
some numbers. Please note, there are still bindings left to be converted
to yaml format, so won't be able to catch those cases.

- Kuldeep
