Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AE6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A798B60F22
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A798B60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4MdfU9U36vK0qLTcuHAOvXfHTcSxoadyfuetW6SGuXU=; b=zlVRkVkqKnLFT1eDX89f4xM5JC
	FfyevO0zlC0l08ztD+wjoxcWSMhHJn3C75b4byxj9XwFc79PGxkbCSe0e20TZaNvYDyVVpfIlHOXp
	6TLSw/QUXdtKEWqiD13B3/XVP7gqPqQi4Q1FOxpI6y6bO0umcPijVlhTLjQdkzwCDO8WngaeIf1L3
	cwg9Q3qG5ZhMTNNXBUHo23PKrBIqudRHH2H4B5+Tph5gYKQTzxdCELfFhBIK4dzxIRPO7EPtcDObd
	k+GXod1QLNHlSk0+k624kOAR1+2abKFKx1olka1iab3N1UyathdCiKtVYs6WQOZwfdWvYLemS1CZs
	R2taXptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZev-007yB2-Gs; Thu, 21 Oct 2021 15:07:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZes-007y8n-6F
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 15:07:07 +0000
Received: by mail-pg1-x534.google.com with SMTP id m21so554705pgu.13
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8J+7f2f4xuhNe3jNVdWk7a86I7pUDjUPQRras1jT8jA=;
 b=j2xqGy2XNECrbul6qEKx9SST/rdB96W/R24/Vvcb8OqiQ/EHcxnhHYfq5uycgpIPfE
 RcoveVySySpwpVV4tBCzFXMBjD2Nbo+r7Vouu3zvunyfI91UcGulu7Nf/Efg6vE0BHHv
 /LkDq7xiH7ZfRV3m5sF462W0KJ3z1wKCyuvxatQAiZ0IhNp9AB4OJO5f48RqdrwxWEXV
 mKN4COsAen3/I4rFmP2EK85hFYa8xqnSauu6h/p0/SzhsTzXY2mralghgKwja2Of6/fO
 GfDWT4tqD+WyHwETcfuO7Mci1xa1bCHrSgDFMYZySCx/rxAhmzRhX68rxf6QbT/UQcIq
 UsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8J+7f2f4xuhNe3jNVdWk7a86I7pUDjUPQRras1jT8jA=;
 b=FrgBApM0t2LKeNCiTLQ6Vj/xaYfjZMHr0sMUo4AihDfSGhCpn0EYieOTQydoRCCdb9
 /ihN56pcE424PWITDuKcEJtmUuA1S6vRURFx7lFmorliuBuwreJ1yl5rMJnIdq1DwuTb
 7p4/PcANCgYLl6gZ5HMHvYy9VJcbPFVkaoyhnVBFT7+A5e13CMlUKv3RPSfB0v2TEeN7
 Z8g6/vlGks0HCuHJRUVMicjFMFuwDzpsSXVdra54kKTVvLsQRp6737yw/uSB/cxEhZ54
 hvMfecQswykc9sf2BcHzyWIvTrELs2tQgyLhBc27lGdY1Ko1YFE1FOiKe1WNibyiTSPL
 c0nA==
X-Gm-Message-State: AOAM532Y64Yohw7dC+BTEfTTPSXDDgcYygOHMahmh5L1mxp8vFotz3d+
 vm7lK1HwGx1Wt0PrJ2pRYIh+1Q==
X-Google-Smtp-Source: ABdhPJyz7GFpoPYi0O9X5+kNyiRMV3FyOoAIfXtYBZpu6m8G0bDaRlzBGocZrUEoxY+npHCfOUgOYA==
X-Received: by 2002:a05:6a00:b48:b0:444:f9d4:d800 with SMTP id
 p8-20020a056a000b4800b00444f9d4d800mr6713446pfo.38.1634828820211; 
 Thu, 21 Oct 2021 08:07:00 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
 by smtp.gmail.com with ESMTPSA id 60sm9545333pjz.11.2021.10.21.08.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:06:58 -0700 (PDT)
Date: Thu, 21 Oct 2021 08:06:58 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 08:06:53 PDT (-0700)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
In-Reply-To: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
List-Id: <soc.lore.kernel.org>
CC: Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk@kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_080706_289307_8EDC1D20 
X-CRM114-Status: GOOD (  16.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021150658.OAdaXoHkv1SssBt-TE4VQittyxcr7fPP7brBCIQ8NQ4@z>

On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> On 21/10/2021 15:06, Conor.Dooley@microchip.com wrote:
>> On 21/10/2021 13:23, Arnd Bergmann wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>> Hi Arnd and Olof,
>>>>
>>>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>>>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>>>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>>>> unfortunately Palmer (RISC-V maintainer) did not respond here.
>>
>> Out of curiosity which series is this one? Is it the one with the
>> plic/clint changes?
>> Pretty sure that I have taken them in internally, but I am going to
>> submit a bunch
>> of changes to our device tree soon (tm) and want to make sure I have the
>> right
>> dependent series listed.
>>
>
> There is only one Microchip patch here (plic/clint). Others are for
> SiFive. All the patches are described in the pull reqeust:
> https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>
> I had also second set of RISC-V patches for Microchip. These were picked
> up by Palmer:
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next

Sorry I missed this.  If you guys took this through the SOC tree that's 
fine, otherwise LMK and I'll put it in the RISC-V tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
