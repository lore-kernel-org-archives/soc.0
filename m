Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1CBC4743D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 06:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2303461364
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 06:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2303461364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9FgrbkJdLpbi3A/Z8FppPQor81WTVn89nVr6aPeCj4=; b=RQYsT9pajBBCpW
	JTPkLFqJIqEtEDqXlsteoJgl7UA3GCig9GBjh3tZdXB18SJVgs3fKnIAKeCUwPEAZDTkLqUMOzNAe
	pbRiYQ1T2nRQzT7SFun3Qf0V2oFaxr4MM4RJsaHN7AjpHLx2/fLpJYlytS/uV41QuVfQ7eJTbcXxs
	wpgYF15Whgq0DGnnrIiSRJM/RXwavbQGnxOlD978MmTSwZ6P2UPS4vNU6pwnTsB7XMwy76azJxcJt
	Ftu/UmxGTmqN7GM3Gr51luG7cXArbHJPgPR2PBDNWV2r3COF27fR0/yYPBgcAE7WhTxk3vT6canJS
	lHDuuoKdmFfIO+WGIvtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrazc-003ylU-9h; Fri, 11 Jun 2021 06:50:15 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lratA-003wBy-7H
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 06:43:33 +0000
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrat7-0000dn-LK
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 06:43:29 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so4051915wms.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C6gfNxumQvAauUH0UC3BQ6OzW6ImVhOU0dXOw2iPMH4=;
 b=qdjcRXky2X/mrKEu1N/PoKgUtGDHvlCkKnxPSkW62KvWYiNy43liM5c+RqHYmWBiuN
 n23CzUjIdiqsfu1BC3NHnMYHXVx/CGuqu7Wf1Vpcq6iWMyHB9CBK2f85nUZndHkVyPnn
 7FRwvby3wN+jyT2OR3oisJD1p/9tU2EKtVK1wxmgS8LypYKzPolPMOcV2wdzVRrGHoYx
 ficaNPVMhtVHmlP9wrtNAeiOUjVWqPYor72XNM/Myxhbiq9/6SuN+rOFQ42Ueq7ELQyP
 e7S0B4WHbDn7zkwd4djymxlvgB5MVmi6FFl1Y0t7LJO4pvv3ptKLak4JpcjDlb+AG6VB
 YuYw==
X-Gm-Message-State: AOAM532UwM8/TlBuxmRGCdx3daLNT7NFCJN0hS96Y44sOMTGeRG//p9L
 H+aje7KuNyvEMTIRvlUOoAwKZqTjNxfasAwYFLpltTQwRszJRTDBlnN9WwoxMrXYL3eTBkxPfvh
 HJ7I88SizEhrOj2DIXkq9ir2xhGtoQnDxfn+6L4dRfbNiMI5hiVfA
X-Received: by 2002:a5d:4903:: with SMTP id x3mr2088766wrq.376.1623393809261; 
 Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHIHXoAf7h4WnhTsz2rFmYQsfMYz4c84IeQVys+BC1mK1A1qd9wPsV+eWGDJaHAx4PsGcQwA==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr2088742wrq.376.1623393809106; 
 Thu, 10 Jun 2021 23:43:29 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id z5sm6018735wrv.67.2021.06.10.23.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 23:43:28 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
To: Will Deacon <will@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck> <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck> <YMHZCaRiQNQCSsVr@orome.fritz.box>
 <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
 <YMIqNynz29Z9fYi3@orome.fritz.box> <20210610172958.GA14188@willie-the-truck>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <583c33e7-562f-0b1c-72b7-71f008a721f4@canonical.com>
Date: Fri, 11 Jun 2021 08:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610172958.GA14188@willie-the-truck>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_234332_320768_839BB415 
X-CRM114-Status: GOOD (  19.33  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, soc@kernel.org,
 arm@kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
 Olof Johansson <olof@lixom.net>, Dmitry Osipenko <digetx@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611064327.Z20IMNT8lVpvZDna-JX5sd041WFiTVo4hnMfU4fGsjM@z>

On 10/06/2021 19:29, Will Deacon wrote:
> On Thu, Jun 10, 2021 at 05:05:27PM +0200, Thierry Reding wrote:
>> On Thu, Jun 10, 2021 at 04:23:56PM +0200, Krzysztof Kozlowski wrote:
>>> On 10/06/2021 11:19, Thierry Reding wrote:
>>>> On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
>>>>> I can queue as much or as little of 2-6 as you like, but I would like to
>>>>> avoid pulling in the memory controller queue into the arm smmu tree. But
>>>>> yes, whichever of those I take, I can put them on a separate branch so
>>>>> that you're not blocked for the later patches.
>>>>>
>>>>> You have a better handle on the dependencies, so please tell me what works
>>>>> for you. I just want to make sure that at least patch 3 lands in my tree,
>>>>> so we don't get late conflicts with other driver changes.
>>>>
>>>> Yes, if you could pick up patch 3 and send out a link with the stable
>>>> branch, I think Krzysztof or I could pull in that branch and pick up the
>>>> remaining patches. It'd be good if you could also ack the remaining SMMU
>>>> patches so that ARM SoC knows that they've been sanctioned.
>>>>
>>>> Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
>>>> your memory branch for v5.14?
>>>
>>> You mean the iommu patches? Yes, I can take them and later explain to
>>> Arnd/Olof why they come through me.
>>
>> Okay, great.
>>
>> Will, can you provide that stable branch? Or would you prefer if I
>> prepared it and sent you a pull request? We're kind of running out of
>> time, since for ARM SoC the cut-off point for new material is usually
>> -rc6 and that's coming up pretty fast.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-thierry/arm-smmu

Merged, thanks.

I'll take ARM/SMMU patches from Thierry's patchset: 2, 4-6.


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
