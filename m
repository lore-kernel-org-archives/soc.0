Return-Path: <SRS0=TMVL=UE=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751D0C433F5
	for <soc@archiver.kernel.org>; Fri, 25 Mar 2022 09:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A105C340E9; Fri, 25 Mar 2022 09:13:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C8F0C340F0
	for <soc@kernel.org>; Fri, 25 Mar 2022 09:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C8F0C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id j13so7391189plj.8
        for <soc@kernel.org>; Fri, 25 Mar 2022 02:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=91AkTY/kb1Ola/H5vx+Ixj6/0B7eA+Up0Yhlp2qn5C4=;
        b=PQHiG9F2wFN2LXQYhcwEzphWhUxvJ/DFulUpijtusLYP7YNeDEp23RfC10WubXETue
         kbY98gqyjT4OSpTLvDeBUeTQWNPgCZ4Vya/Ea79sGUfvdyvKoYGXJ8VOAQXEdAyKT0CA
         xDzWjr/D1OHA9wpH3lRkbwtRFuKErNNrczaNHHFIBytv3opSKMRW/5XGhWuCXZqcoLLt
         9aU4e6z0Q3gikLLuHhnkUYMdc2TMhqbY9vK14+b/tJz63Yf2kIaAdxnbtFMxS+xloXjw
         PhVWcYLzMH33/T+k8Q+aGk/BJTC39jMWU5rZq/20J+HBgSA3yQCKNJVHG4NucfxYnsJq
         MzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=91AkTY/kb1Ola/H5vx+Ixj6/0B7eA+Up0Yhlp2qn5C4=;
        b=1KI0oXbT3DJ4IGumgPKLT13kh+zVPBGXxWj/8FEtQW7nj/AYSOEyNlnWOp3SoCU2RN
         oQ5j1L9xrHYFN8Eb20T0fjR2n7wZIhv9FOeJzbYTzEJrEViNF/p29RjCvdiZYP5Gb8Rv
         s8NZTD/8R4AmzFPhMQkK6/8TJlbiT+yM+MDtIvbArc7myo40O8M7nbjwIMBaDlTctBTF
         Erl2j5Z2lNJNXbLGrkdUJ1Fw57o9O7okxLNbZ04S4M7i3I4CT9IxFcRAKs0YJIKZDpsG
         eKe+8N23pF5ESzYgjW2PCccYREkA2uGLOa2vseP8/oYgvVzca8YDmsDzDK6WRqD1XRGF
         Rq6w==
X-Gm-Message-State: AOAM533JHEZKsRxQEe9oQS+niNgw5Tkr07ZzPyBXoThmyWJbyraRIxzB
	rFU7AQTUsBFGPb9cOmkUNocZtg==
X-Google-Smtp-Source: ABdhPJyGAdv0p9neUjb2iIntzidCBrpS4MK8HEZItIseo0BAj/9TpC+G+XGDQwJahN+ncD6rUPFMkA==
X-Received: by 2002:a17:903:41d0:b0:154:de5:a240 with SMTP id u16-20020a17090341d000b001540de5a240mr10703364ple.32.1648199634102;
        Fri, 25 Mar 2022 02:13:54 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id il7-20020a17090b164700b001c779d50699sm9670388pjb.55.2022.03.25.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 02:13:53 -0700 (PDT)
Date: Fri, 25 Mar 2022 14:43:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	DTML <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220325091351.5vb4p37g2qi2mseh@vireshk-i7>
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
 <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>
 <20220324062547.GA15504@9a2d8922b8f1>
 <20220325015849.sazvlevnvdqj5z42@vireshk-i7>
 <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Q8eOTeRmd5-G8rNCKAcH+4HReCsOAGKd4Vq30C9TaEA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 25-03-22, 10:11, Arnd Bergmann wrote:
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

I am fine if we want to apply this patch as is.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
