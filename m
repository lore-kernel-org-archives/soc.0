Return-Path: <SRS0=r8q2=LT=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1385AC2B9F4
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 17:26:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5D79619A4; Fri, 25 Jun 2021 17:26:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9F06199C;
	Fri, 25 Jun 2021 17:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9F06199C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f50.google.com with SMTP id g7so6774451wri.7;
        Fri, 25 Jun 2021 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4QI+hOEPUjUXgGj/0NkLNcxkrgoIPtZX2ZwWHw7Tor0=;
        b=JuXFHVRf8avdk6DJPLBA8wpDI1/HBLfgM4g2AX5CM/b6sZb1QPSzQw5+ymOX66jZLR
         vg2/hAm9ZRwEnqX/AqZrKXE8uIFVZTGY846oips89npSGgAA+8Gk164AzP8FEDegFaeF
         ehffEJ511FCWd4CKP/GFEFYzkkrUgO4UPB2qx1CfQ/C69sBdKK+MsloTrUQZV/WiNGT0
         PSo39vzMbMNUcOhMeQ7aYX9pyqxMsBqKw4Ityz7v4Hsrzl+tPrHcy+xxWmshQbEk+sGA
         WJHyWIzC8yPCEcIl9wPGpdeAy71bQlKy1JyvoTkYTZjwzNeA8s/KV8mTsQDtD5kJOi6C
         Tyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4QI+hOEPUjUXgGj/0NkLNcxkrgoIPtZX2ZwWHw7Tor0=;
        b=CihpN/d870BXinuINH7lIZeajUOaQGaJhNzvXoHx8tc4D3Ub6K5JgUdv4jL8psMcx3
         IAAW1vABpPSn32CbZw9H7DmKsdLdEmSVFM0lcgQ6mKZA0AmlASJhjzYEOcyLDVnJlCeD
         XR038+VQMAvSHM1H3FaJruN+HYR47UiNDRpMmptWoDtRenwye6N62KXkfUOLR+uoKdFg
         oRjl/jkTwxbUjLzWz04m2LvpNcUkw0O4nJ+mJL9oyvIInblPzQMi/gjsMPrwX2vmFrvc
         ICRpb+FzWYxsm+G8hnGKeEUaQnxDUQHKZURiVOWi0J2AeOW/xcVLkluKDuTdYCYXO6TG
         XPfw==
X-Gm-Message-State: AOAM533oM/A4S0zacPlIUJax9PwL/eNdyHINTBlUNPb4dZLNoltaSeUv
	gcqs5WSAFG10CXMHZP+Qqjw=
X-Google-Smtp-Source: ABdhPJwzxA9RRn9LlPBaD6PzNaRqzDeqYVg+jF+ZjyPUhEtVOcN/QYSI9Zjc9h5n1zVOWc2EAjbqcg==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr10740085wrs.358.1624641982413;
        Fri, 25 Jun 2021 10:26:22 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
        by smtp.gmail.com with ESMTPSA id w9sm6609998wru.3.2021.06.25.10.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 10:26:22 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] ARM: dts: NSP: Add DT files for Meraki MX64 series
To: Arnd Bergmann <arnd@arndb.de>
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
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <bbf38c31-ed75-69d2-39ed-94f324b1f220@gmail.com>
Date: Fri, 25 Jun 2021 18:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3NAOgBa1j+Zsm6FwSm2ux49rFcnTEYJJsmSF8TggRnYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 25/06/2021 10:59, Arnd Bergmann wrote:

> On Fri, Jun 25, 2021 at 11:52 AM Matthew Hagan <mnhagan88@gmail.com> wrote:
>> MX64 & MX64W Hardware info:
>>   - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
>>   - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
>>   - Storage: 1 GB (Micron MT29F8G08ABACA)
>>   - Networking: BCM58625 internal switch (5x 1GbE ports)
>>   - USB: 1x USB2.0
>>   - Serial: Internal header
>>   - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus
>>
>> This patch adds the Meraki MX64 series-specific bindings. Since some
>> devices make use of the older A0 SoC, changes need to be made to
>> accommodate this case, including removal of coherency options and
>> modification to the secondary-boot-reg.
>>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> Removing the dma-coherent flags in the dts file seemed really odd until
> I read the text above. It would seem more logical to me to have a .dtsi file
> that has all the a0 revision specific changes, and include that from the
> dts file.

How about having separate bcm-nsp-ax and bcm-nsp-bx dtsi files with the
appropriate secondary-boot-reg and dma-coherent (or lack of)
properties, which then include bcm-nsp.dtsi. Thus we can also avoid use
of /delete-property/. Would this be preferable?

>
> On the other hand, the /chosen, /aliases and  /memory nodes that you have
> in the .dtsi file should probably get moved into the .dts files, as these tend
> to be board specific settings, even if the examples you have are all
> the same.

I did not come across any convention regarding this, though there are
plenty of cases where the /chosen, /aliases and /memory nodes are
defined in a .dtsi file and used by multiple similar boards. Also note
in this case /aliases is defined in bcm-nsp.dtsi, not by me. Would we
not prefer to avoid having 6x duplication?

>        Arnd
>
Matthew

