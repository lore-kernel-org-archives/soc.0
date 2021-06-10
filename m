Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F43AC47094
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 14:25:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F04E613E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 14:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F04E613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qY8vGneiFDtQSVjVWOd6u6u0uRiBN6AZB0z7GbebFN0=; b=Il4r4L2I3WpTOH
	Pgg93y2ZvHjY050WjhezKL9qbqLkHtIIl8yBJ7pEdsNOa7rdwPAW77sqiuSceo+BYu5HhW+r6RMKW
	/6OJ+kduAoR3sxsHZgzA5+bUOVim8TQy6ktEgdfxhdS2cm5G5kxfd9BnG93gYXfTOV/otqC975nzn
	Rl9F+L5Tgg/eHuKoSbtb7MLdRzAkD7+oX3H+BJgliwFr3pHGNXYbROSa7lEepLwtspQL2OgQ7S5nd
	frRTvaXb0DZANNuSH7xIW6sNhq7cuRsRnOoQO65eVFO7OQip7dOUDYCu92nr/tGHm+f5GkSRq+zHk
	KAHczKGp0ts3Jv7ZbQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrLbJ-0017FY-Il; Thu, 10 Jun 2021 14:24:05 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrLbF-0017EY-RT
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 14:24:03 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrLbC-0002JU-3s
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 14:23:58 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so964367wrd.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 07:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+wqZL59v8SDuZCGAvgfZHpaTUmd/SqDTBj4hRdNKBbo=;
 b=YzWbfL18hvflKvLHqW2dwoSySg5ozdrn1mIIUu20Hm+gbmKc8JN5XxqjcnmjWZkbiP
 DdA4qwKUUxjpq8DH6r7qUvn/GrrIzN9AHL4q54mNcX/9sZ1duwRz74FYyfSAsFGBNtSM
 jOQ3wG2fKMvrKa8qYZv5KpSExanXkZBYPcoIyswx2X1xGUBEPH9ewgJjGB7x72yLICKb
 3qKf+giEFR6I31lFGI4C8fJJDAvFU55XHO/UPWJxGcmepUKQ06Sg1EI/Qf6mteK+E+SF
 OrzPp5TADK8k8zPyK+bMt+ZoMqEd7HFuzs5vEfmPDTYAQx5pg87FlHMOoZCmOCoUmAwp
 uBaA==
X-Gm-Message-State: AOAM530N4ae9MQ4lKdefymLJ9QnP6ga55fXBWCnxqs02CemFFjXwEElc
 bB31xUR40k4/ZmfGfsByygANGK+poXJYvvNmlwKJ3yLXIlEqh8yTPBhD1ecPNKJR3ep8mpSafti
 nCJNv+CZjRBstHeVxqmYTH7GtjR7BAl7xeFFQEYKrHhA5bhZvJ6Md
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr5916072wro.164.1623335037661; 
 Thu, 10 Jun 2021 07:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWLlTc3t66M+OqJpzcEjLbLm8rLUWjRR9mtinW1Hr3buaD1/RibxYzmB57pMJb/ZxfXIgvyQ==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr5916040wro.164.1623335037448; 
 Thu, 10 Jun 2021 07:23:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id p5sm3834669wrd.25.2021.06.10.07.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:23:56 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck> <YL+A+MPjjaa3nSwq@orome.fritz.box>
 <20210608164851.GB10994@willie-the-truck> <YMHZCaRiQNQCSsVr@orome.fritz.box>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8c18edeb-2e3e-9072-6bb4-11637d0ca3e5@canonical.com>
Date: Thu, 10 Jun 2021 16:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMHZCaRiQNQCSsVr@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_072401_930389_33F3A660 
X-CRM114-Status: GOOD (  26.89  )
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
Message-ID: <20210610142356.0E8mlLMR0rZVVqrEds-cyUsD42DO70L-lT5TR5U-nG4@z>

On 10/06/2021 11:19, Thierry Reding wrote:
> On Tue, Jun 08, 2021 at 05:48:51PM +0100, Will Deacon wrote:
>> On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
>>> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
>>>> On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
>>>>> This is the pull for you to base further SMMU aptches (prevent early SMMU
>>>>> faults).
>>>>
>>>> This is a tonne of code for me to pull into the SMMU tree given that I only
>>>> want one patch!
>>>>
>>>> Thierry, if I just stick:
>>>>
>>>> https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com
>>>>
>>>> on its own branch, can you stitch together whatever you need?
>>>
>>> I'm not sure I understand what you're proposing. For reference, here's
>>> the set of patches that I sent out:
>>>
>>>   1. memory: tegra: Implement SID override programming
>>>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
>>>   3. iommu/arm-smmu: Implement ->probe_finalize()
>>>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
>>>   5. iommu/arm-smmu: tegra: Implement SID override programming
>>>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
>>>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
>>>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
>>>   9. arm64: tegra: Enable SMMU support on Tegra194
>>>
>>> Krzysztof already picked up patch 1 and I was assuming that you'd pick
>>> up 2-6 because they are to the ARM SMMU driver. However, if you're
>>> primarily interested in just patch 3, which is more "core" ARM SMMU than
>>> the rest, which are Tegra-specific, then I suppose what we could do is
>>> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
>>> can pick them up and take them via ARM SoC, based on the stable branch
>>> from your tree that only has patch 3.
>>
>> I think you previously said that patch 5 depends on patch 1, so I can't
>> take 2-6 without also pulling in the memory controller queue.
>>
>>> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
>>> touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
>>> the likelihood of that conflicting with anything else is fairly small.
>>>
>>> Is that what you were proposing?
>>
>> I can queue as much or as little of 2-6 as you like, but I would like to
>> avoid pulling in the memory controller queue into the arm smmu tree. But
>> yes, whichever of those I take, I can put them on a separate branch so
>> that you're not blocked for the later patches.
>>
>> You have a better handle on the dependencies, so please tell me what works
>> for you. I just want to make sure that at least patch 3 lands in my tree,
>> so we don't get late conflicts with other driver changes.
> 
> Yes, if you could pick up patch 3 and send out a link with the stable
> branch, I think Krzysztof or I could pull in that branch and pick up the
> remaining patches. It'd be good if you could also ack the remaining SMMU
> patches so that ARM SoC knows that they've been sanctioned.
> 
> Krzysztof: would you be okay with picking up patches 2 and 4-6 on top of
> your memory branch for v5.14?

You mean the iommu patches? Yes, I can take them and later explain to
Arnd/Olof why they come through me.


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
