Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80437C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7F061130
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D7F061130
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7QHAMW9wB7P1+7VUCCBxTTUSQ43ol/rH9FpzZ0sF2nQ=; b=QNgobpMM2psnYJzJ4cPlXx5Gy3
	Hv95hsonX3zhsTBSNXI6safPt0xsUC4pCuqf4hUGiJwlSuoudnI1p+LJAnrcJTOCs/9pdH1Ycx6UW
	lJkYFt4rDMIwNZ4PiuS01X1hv9s2QFC2De+nfTkYc4qUIwg0k/0CeRHioBL3t2p8YXpcsNcSEOEuM
	28lBakWfebA7nih1eHzPA3q1tjhjEXaGP1NALvgUMCtby4gtibCR5mML3mZ7oVT2dDn0nSOOOCw1h
	9Wzgu+DrwtJbItti3uSGAvzMzAQlqnK/KsxKAUhudp9oGN82R11TKJ+2YCg26PzFqGcLR+YzXOErM
	bx00P8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mda69-0089he-Bv; Thu, 21 Oct 2021 15:35:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mda60-0089eY-J2
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 15:35:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso3412795pjm.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Iu7p8YJ09LKB7UxcfJBHKOYGTkw5Ln5vg4U6RHWQs3U=;
 b=N9mW0nfr9JesgpEOnQB8FV3Ivh/q2sth6ZHaD9wGtcKtpqmRzhrhCwn7iEgIOrylIj
 5EsJ+Tbqw+974E+HSwBeLr8wxqRMPf2BY/AZXguF0g/exRJO3b3jfPOjeiPDWnd2cPHZ
 wYz9RCkTOzpoP8WSjGQmAvWrwzRIR491+RImtx1tTk/HbvYu1IB6eeVgc1r09tp38jHl
 NJvrJXNj1Jf/fBGJMGLk6PkRZJOQnZuxJqwgoJlJgc7KUA/NDVi+L+3qln1TkraNLxci
 pREi1Q5DMXnsETVqNeGCoHrn4Guw74IPjlOLJlwZJa9DDVEy70km3BqcgUrJWL4Y6SjD
 MwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Iu7p8YJ09LKB7UxcfJBHKOYGTkw5Ln5vg4U6RHWQs3U=;
 b=WK5fTUW7aJYTu/3FlHWxfGER07paoGwaohDFfwUev1EaFlaKuqvynOfboh51yi/Jaw
 spLfDjTKeKEtyKllsHYgyrX3O/Fg+LYHbGMsJFfplbCaufIWj0jtnhXt50or97jIpnAe
 zi/Pk2YVBZzuqrtSqHqcPY/1t0xpWMLjlfmt7FAZ/OV+3Mc+K39YNHTpuJp72JDwFXf+
 EhRH85T/JNeN2KXyaYcJaWiFj3QjGXrLJOiylWxGJpqEC4Q3/qh83JD5DUt4wmIefmyA
 8MyeQAo0bFtnvkkGKgPRVmJuA0x7tpuyWDOQHvBTATJShsn4KJAfG1vlaeTOUpFDexWV
 TmXQ==
X-Gm-Message-State: AOAM53312pkfXEvkkZ2AVSe2QkIYx0jJAd/q7UuBUUFLLdK7vmjtfQbg
 AYu+CEh+ugAtJDX39fu/ja399g==
X-Google-Smtp-Source: ABdhPJwDNaVwUCWUwB0He/hM/H9zr+hEw5kR1fOwUoC0BICsXfUjekend5YgMkCbXWfoNE1KdQA/BQ==
X-Received: by 2002:a17:90b:185:: with SMTP id t5mr1034947pjs.54.1634830507081; 
 Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
 by smtp.gmail.com with ESMTPSA id m10sm9996832pjs.21.2021.10.21.08.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 08:35:02 PDT (-0700)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
In-Reply-To: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
CC: krzysztof.kozlowski@canonical.com, Conor.Dooley@microchip.com,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org,
 soc@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_083508_641665_030BE129 
X-CRM114-Status: GOOD (  16.44  )
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
Message-ID: <20211021153505.ELOPHs6raSs8XYtrlUorTqQ52W_USV00lTUENCK5blg@z>

On Thu, 21 Oct 2021 08:18:16 PDT (-0700), Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
>> >
>> > There is only one Microchip patch here (plic/clint). Others are for
>> > SiFive. All the patches are described in the pull reqeust:
>> > https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>> >
>> > I had also second set of RISC-V patches for Microchip. These were picked
>> > up by Palmer:
>> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>>
>> Sorry I missed this.  If you guys took this through the SOC tree that's
>> fine, otherwise LMK and I'll put it in the RISC-V tree.
>
> I haven't merged it yet, please add it to your tree then.

OK, it's in.  Sorry for missing this, IRC is always a good bet for these 
sorts of things as my inbox can get pretty hosed.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
