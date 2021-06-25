Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639A5C48BC2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 17:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3046E61954
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 17:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3046E61954
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k47JNXUu2pb3NEw+ehyhHL1KPOo3ex43ng15uBjX8N0=; b=iiRzm05Jd5U7tNWekuEAOqwEZo
	BzxPtvWiN/P8GYo9utmpZ04BeHgeZ3c2GTNdGWvfXDLxQpTBwobtEmjV5K01hXpjcXMVTGYiMD4Z4
	uZI/pjDKnW7K9eA8oyw98wgTIsWS6vEqjq0IwiINFobWKha8OdJsKPf+7f2x8w9toooCqbxRZYC96
	WbCNIx9sDRi42RpKHC6Ivv/4OeLE7CrXOIC7MNSrCn9QIU0Z3g3YKHXD8Ln3ffQ8WD3yPGQ5f6AjR
	Zwca0jAeyKhXSkU/FXNCckks8D5srfgYMC6Yb4+yPiInC3Y4Oe7DPG7Mtgkhi/vMI6VJcHL8iCa1m
	CnvFlzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwpfM-002SSb-HD; Fri, 25 Jun 2021 17:30:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwpfI-002SRi-HX
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 17:30:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id a2so8267193pgi.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=U0MQNhrKpOs38LNy91ozMnyQAGl2MfKyQjHbJKWPo2d1UllIJkTuN8ugT7Z/X7kE+l
 87wAg8w7SbNHJEIiHsG0JKC99XW8tLjtSWj1oWHx8kKN1/M4aI3sD+iaOvioinldsmAI
 mp1UWZDPV6dxebWuDFnLE2fx1jRRbrWKDh3yTq1M0wJgGozlntYuqu+ehWIYXnbjrXbe
 nsCHM923/hpLkpHVkkzLmaHVRab4j37rg6i3akv/48Mbv8nI/JaDfUi787pYcNCxDM/p
 KrSTwb1QcKXK42NetbC06QTooy19i2hpwa4AWjyLqgo8L9IsphlmsCikN/koy81iUrJZ
 36/g==
X-Gm-Message-State: AOAM530hcCWpAD7fzg421rA7ByKN8Wio2sxRXydLsaW/tXae6THV5kE+
 UqRxjrwe8osHa2uKN6tS1Acv/K6w/Z6LWQ==
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_103052_636283_EC1757FB 
X-CRM114-Status: GOOD (  26.84  )
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
Message-ID: <20210625173033.lxNpeBR7toiSlVFoOp3mAb_Z8xuCy3oRoSvPWDAUddk@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
