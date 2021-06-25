Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944DAC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 17:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595C76199D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595C76199D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IAQVQcFBBH0ImRKcYXC9CWUh2fj4ZY8wWJ1GiXL8SPw=; b=dzaxjgTz9ks9qu19U1CeEOTGae
	+Kw/CRGPm9SkafKr1gQvkUxOySOXmfSxpELUJ6zlI7rpRzXo3QrhCDC9n3WrfzDy5mms6/x9YrZ1T
	YQtgrVttFWwxQuVewIhlzZVr6CZtPJ8Du5ajnuGXdDX4n2PQbm0gWuO5/aIdIQapJgr/2F6E+4qLS
	HozUoRsIIxpUVjjDKyy9nDHNqKsBvjinHx3adQNsxOZ5+0Qa5Bt8QXBZ/vhCiTtKZNcQYtztweoPp
	zD3J4Nk8SuHTUugtXAEkYYwPDEmi6cJK8ZtGaWLCwbqsMZAIwkYR/kPnc85WpGpoKSRdrgFZfv8Lz
	n/1XN5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwpb1-002RWO-5B; Fri, 25 Jun 2021 17:26:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwpay-002RVb-2O
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 17:26:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id j1so11374253wrn.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=Dz6+/CFubeVdrXKd/60mT4qEZxVvL7zJSSwMZQ/4sOWih4qPo7eUYCx+qiZE2oOLxz
 h1nTN3DtA5SxzdyYrivmFhBCTZJYidVaG6RDjO/m7hlzL6h5HgT6YYSwgxZpPPQ0PeXI
 /bskAbKhN5PGEqMur1eGNq0HNLVR0hq4/kxBl6oSMLIkIZ7+U4TlpI50UuroMuNMGJel
 38nMFT8R7lt3WLmLhvgbdUGIEN0GpeoXRz2uCm9HMQaYLzSndus4/Jrb1SW2oC6/SSlg
 9nC0mZM0JrniK9P0SdKX6Ixa80fXLxA/a14lnGHaB6gDz/FHrRuD1dr5Thqh4/85F5y3
 5Nxw==
X-Gm-Message-State: AOAM5331j7R5vfPj5/URBynpNa1cDD9t92zGOy2v4uZWqgyiyB/Qckru
 ZOZFOuJKqLsvmUEA5Xp5lrQejQhDBHyJsQ==
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_102624_196751_D81E8495 
X-CRM114-Status: GOOD (  22.17  )
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
Message-ID: <20210625172619.iHRwCFvNW8NCDYOAy0ngAN6e30rXvXnKAfwORX-8Lcw@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
