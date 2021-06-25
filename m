Return-Path: <SRS0=pouR=LT=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80905C2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 17:30:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 507F261954; Fri, 25 Jun 2021 17:30:51 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E94761919;
	Fri, 25 Jun 2021 17:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E94761919
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f169.google.com with SMTP id e20so8319131pgg.0;
        Fri, 25 Jun 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AEVXAtzRdBnXjTYBUkXKyLLq/QP8vZTU+6eBNnFCfNY=;
        b=JsNQ1EOdCmRHmdIUMwk7W+3dSlif5ZBdGuIrCU8FRyUfISBFd88dg511IEs/lMsHdL
         LV9N0ecJcHXNEXDQfGQkEGsfuJjznIUkVg+8s+omlLDP3TxJ6A5yMAIE+CZQBjJyIEVz
         Rz9/drioEC6VrGur/BAVgAjVXvPI67EKYTP5d/jXaLn952AjsxZdMsWVI1Mpr5KJaN4z
         68wrlMzUIS7LmmgVj5IfkfOuTLDSRCqB9SuTV+kZif8MzkFwQD7WvGx610ND2q966zcW
         WYqQRK1QWoog9mca9wdW1eP93dN4aGk5DFi8kdrS78VttsAP7Y5lVigkE7uRfxFQuysm
         SAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AEVXAtzRdBnXjTYBUkXKyLLq/QP8vZTU+6eBNnFCfNY=;
        b=HYPZyt9YiWhqptba7DMN1WhO+EmhDDmexEvt+5r8LbidbWZhDTuNDMql7b5MaS0WpX
         Ju/hAB7Ha6LZ1gzuFhnVsFsPB81r2suc1MDwTrZ/Qm/ug2wlir8Q4v2hRHoNPzZOLRAb
         jC4LD7NcsNmGLd2HtriJ1z6PjDd1M1orJjhP+E2Qlpw9Cg1QhRHUYXAlkBOd2DFeGAoJ
         UvtRb/YYJsw47i5qQ2jdbAorD1ds0USnuohbcBY9HvN7z6DibYNwPGtvBp68pis0SD2W
         KVnWcAbVZgqPpxVa+GBYGU6dt9LyyaHsmRBWEuzLjM06CETz3DvsJttWx9Pm3Le1RyxG
         O5TA==
X-Gm-Message-State: AOAM532FznuRYK+tRDSAPVIaupIT4vIAIsK8IEm83+r5BSB2kNf3c42u
	FJIRW5D65dWdwM2MoCU1P4FowVW5+ifDbg==
X-Google-Smtp-Source: ABdhPJzluJfbq3Os5qaSBw+XQr/q4Y3cVOkWhKV4j4z/zfh1dpyOtoQhTFB7QOgto30AvTYLOOyS1Q==
X-Received: by 2002:a63:fc51:: with SMTP id r17mr8472427pgk.403.1624642250621;
        Fri, 25 Jun 2021 10:30:50 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id s13sm6216158pgi.36.2021.06.25.10.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 10:30:49 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Matthew Hagan <mnhagan88@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
 <20210625095000.3358973-3-mnhagan88@gmail.com>
 <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
 <bbf38c31-ed75-69d2-39ed-94f324b1f220@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <21e895e9-0211-0c97-5e9e-781e6d2fe6dd@gmail.com>
Date: Fri, 25 Jun 2021 10:30:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bbf38c31-ed75-69d2-39ed-94f324b1f220@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/25/21 10:26 AM, Matthew Hagan wrote:
> On 25/06/2021 10:59, Arnd Bergmann wrote:
> 
>> On Fri, Jun 25, 2021 at 11:52 AM Matthew Hagan <mnhagan88@gmail.com> wrote:
>>> MX64 & MX64W Hardware info:
>>>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>>>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>>>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>>>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>>>   - USB: 1x USB2.0
>>>   - Serial: Internal header
>>>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
>>>
>>> This patch adds the Meraki MX64 series-specific bindings. Since some
>>> devices make use of the older A0 SoC, changes need to be made to
>>> accommodate this case, including removal of coherency options and
>>> modification to the secondary-boot-reg.
>>>
>>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> Removing the dma-coherent flags in the dts file seemed really odd until
>> I read the text above. It would seem more logical to me to have a .dtsi file
>> that has all the a0 revision specific changes, and include that from the
>> dts file.
> 
> How about having separate bcm-nsp-ax and bcm-nsp-bx dtsi files with the
> appropriate secondary-boot-reg and dma-coherent (or lack of)
> properties, which then include bcm-nsp.dtsi. Thus we can also avoid use
> of /delete-property/. Would this be preferable?

Is there any way that the Ax platforms could use a small shim between
the boot loader and the kernel which could all of the necessary DT
adaptation so the kernel only contains a single Device Tree source?

Using something like this:

https://github.com/zonque/pxa-impedance-matcher/

could be useful.

> 
>>
>> On the other hand, the /chosen, /aliases and  /memory nodes that you have
>> in the .dtsi file should probably get moved into the .dts files, as these tend
>> to be board specific settings, even if the examples you have are all
>> the same.
> 
> I did not come across any convention regarding this, though there are
> plenty of cases where the /chosen, /aliases and /memory nodes are
> defined in a .dtsi file and used by multiple similar boards. Also note
> in this case /aliases is defined in bcm-nsp.dtsi, not by me. Would we
> not prefer to avoid having 6x duplication?
> 
>>        Arnd
>>
> Matthew
> 


-- 
Florian
