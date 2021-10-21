Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352D7C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CB9611C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05CB9611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=La9fTyMBMz3WcrFmjM25IIyFunxpaLZX3SMlfxdvGnA=; b=PFhglBJ0b9xV+HNc95RY7DU32H
	fUUMoiZWjTG/M1zjzGHIszSiR4GTEcK0hPX3LP2tzDYiASfNNJ5jrV+atRuzpI9zpMB85SAixar0W
	zaDL0BJU0dflu6IvqopaPxU4IdX6wEg6Qk1JE9BrOhgWIE4R+gZ760qag8nMhi4s7fqvXABWLIJVN
	K29eBCfq6pxskz05Ct2jZrJafXG5BLZ3Nn1Vy9CPnYIwMF8+a/ysz0icHjmXWgyvd+wLPwCEFlahT
	S7lyFHkGQJEtnZ4fUIh1GRPQ0u06xvW3wb7PnwGn9U915WyKpdX9ipcy40aaVV143aUKTMVgnaC96
	UWXQX6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZf1-007yBp-Co; Thu, 21 Oct 2021 15:07:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZes-007y8m-67
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 15:07:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id j190so628116pgd.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 08:07:01 -0700 (PDT)
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
 b=P+YHHUAadlM5AJzNCMVobw2jIoQYTXhUf/FlDdLJamXympi4RzsFhxZrE3yD3uBWqs
 QsY/fZvarUpO+Xt+RJQ0hMk5/7XdBfB1tqPSDM4S6EIqZWK4goRIqnxtgNCJS5v6gnLL
 Yv/isY1JKI/HFxPhoDRUMn17oc4/L8fJ7HAtjqOXIfVOosUDD8vvsSYSZYCH3NfoPv6/
 QESL6HBSZcPvg0oiiJ+h88lo7PqXlGpVDSMRowwxw1QBoQ20lL+HQU8B30kV39TNoWtP
 N6E1hdAZHFHdLpEGxmZrlvOFnVi5lkHN+W/Yvepm3JJmWgm2UhyigaGc2eW/mhBs0yad
 NFqA==
X-Gm-Message-State: AOAM530Oq1v8epEoIlSWKrRHYquFT6gsaTh2uutnoEjIuMN8DGo7dq4H
 k8QVcCkSHnndTeZA4zxku2T14A==
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
X-CRM114-CacheID: sfid-20211021_080706_290660_1FC653AD 
X-CRM114-Status: GOOD (  18.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021150658.wstcOBDaCkRo6f8hlugWU04GQXb0EEKo0aSjBdU6wpA@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
