Return-Path: <SRS0=0iYR=PJ=google.com=palmerdabbelt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D907C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:35:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F177861130; Thu, 21 Oct 2021 15:35:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5366611C7
	for <soc@kernel.org>; Thu, 21 Oct 2021 15:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5366611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id t21so680641plr.6
        for <soc@kernel.org>; Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
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
        b=77t4waBiR1gsNqn0ighJUzaLm/b20bktkK5kqJQR0b+lvBC3hlnAXDPdM8FAhp6gnZ
         GBsKQhLSZiUe56a0S3oEfNVLw+2cxdeCO/DeibtWQiSlk/O2v/WBF+1KOy+rYHaruZkv
         sij9P9WhUbopjujPhF8Ou72m/r9db292xT4G7DB9pbscE2eOzo40AkS1CpdlbxyhdCRD
         mrUkSOTQDzG3HRnB5BOQRrtNCDVWkM5DjYockrLfdw9nrQt/sXe2y+aoPvNlWwe+todA
         cyRPDkpmBrk3lighmEOFhwPWg803xp2SaOyqTs8XNpFi8CIuvZ/g0Gvkp7h2xemOJUMV
         W6vQ==
X-Gm-Message-State: AOAM5334vqjwWDcLqaGrZgzXNR+XE4Lh4F6CIQn/yJTG4/LVddEK44U5
	X5eHvygz7rCSd/MOhH+CBf9fzw==
X-Google-Smtp-Source: ABdhPJwDNaVwUCWUwB0He/hM/H9zr+hEw5kR1fOwUoC0BICsXfUjekend5YgMkCbXWfoNE1KdQA/BQ==
X-Received: by 2002:a17:90b:185:: with SMTP id t5mr1034947pjs.54.1634830507081;
        Thu, 21 Oct 2021 08:35:07 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
        by smtp.gmail.com with ESMTPSA id m10sm9996832pjs.21.2021.10.21.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 08:35:05 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 08:35:02 PDT (-0700)
Subject:     Re: [GIT PULL] riscv: dts: few cleanups for v5.16
In-Reply-To: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
CC: krzysztof.kozlowski@canonical.com, Conor.Dooley@microchip.com,
  Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
  krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-0efa2067-b731-4121-9725-e40954222d89@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

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
