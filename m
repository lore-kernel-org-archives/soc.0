Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93E7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9029B61130
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9029B61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pc1GbsdXPNbEVVs1w8ZpizHHFKD2/APIwgEtbHoyyvo=; b=WitQfvq/wfE5O7n7Ni8Ws4+0u3
	f1ZCMydcI6fOodl9RniK9RdoF8NZgNrMCLM1VqGtFB0Z0Oc9K5/BcqEYl+BgkE2b5fhAN7MUtVzmV
	U6F4SqANXu10XHCPdhdBFCGIJkCSCMDJRz8fCgUX6OjkuY3tzthppU5YjmQFG0T3KOAsG/qK/O3t5
	pZYE45ATUc3dKADE4Hfy1uBSAp82RYgLFUO6Hord98E1o36DFl2eTIpoR1GLUWqMdLRoJjW4I7NSU
	Lc7JEaCMrbgLN+DpyBmoGLJgQJgLBIH9lMMGDfri9RaHDtdze5H4H83kAEg1Rud+GkQb8V1cp3fWF
	rMzaydEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mda62-0089fy-VK; Thu, 21 Oct 2021 15:35:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mda60-0089ec-0q
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 15:35:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id om14so762942pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
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
 b=g3rYRM7isH0WJfuuWV1wPZ1rddnFMixp87xhjRzwcrIQnTKG4Bh3sXHQ5fw+YUYF8n
 oiH4/C8IO8ZkIFQYTcdTuPXR52FL8M2ZdQxujm3FecB4nsohqMN2FNdf8578yRoiUj9V
 KXUd+XyCRgS1ilNj/f9hA78eIJlcRH+jE6vlw08HUmutVmjJrfsA5Fo7kcHXElI3KmC6
 JAOG3G0tTVFCZiOZcl11/Fp5+IKqBjiuhMbywfERobXMoNoJPPTxz4RL81AEQ/SW9r6A
 MxeUXIk7zWHj7uyZMl3C2M32j5ZgwKy0syLzgvI6/xJp37kWoltV3YDbqD/A7JtVmrNg
 JEJw==
X-Gm-Message-State: AOAM532sO67RmXtifynhb25Ss1FC78Bm7308NLPe6WrG/LMOFz++WwjX
 nCfwviTZdfGfXuJJtU2HrDLrWA==
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
X-CRM114-CacheID: sfid-20211021_083508_112445_8E9A4849 
X-CRM114-Status: GOOD (  14.86  )
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
Message-ID: <20211021153505.PhFxU0XzYkNFxO95aouuQtiECCEvRT1FNFbxKdN_g60@z>

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
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
