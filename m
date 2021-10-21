Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07FBC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61336109F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A61336109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l3VfQyP4xpqRNsB+TAEPw+F1SDQjqSGQhcAFEumNXLQ=; b=t2N2NK9NYinMuIM5TegRx5Q7XG
	iDccsogW7JEOKD+iN1nYxhDp8tlqvcAs34vLob7DlLowF2HiPUQ0OZDjJ6TWnHoIBuZVWJhwfK/7v
	HijQ1PNLMG7wxWpCU6e+CXUuxHXKFDruTdv68XDj/n1ardMBzZWgwpoqNKhkPgblNg19+KX36CkCS
	aehLBeNQZRLlLMSfKRqEn3OQRPupDVuAitHaK8kMB9VeHmxXjb84HXKHryo1CGYGIIfd8J0loA5ZJ
	99zkLuzFO+QuKxAs0JXL1cmfOAqlnI5E/0SuErksUFDRzQdn/CeHnPt4ACdu9z03x1GObt19hfI60
	0HGkg7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXpf-007bg4-SN; Thu, 21 Oct 2021 13:10:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXpS-007bdd-Ig
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 13:09:56 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E20340753
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634821793;
 bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=SSmN+NWiNYuG2kc1Jao0NyNo6upiQtdJEHbxgKlpXiGbcA2n+bqiWeTU7PyYlXywx
 iUwYCgnTcNgpvVKMWP+vS1Zq23Ue5p5W8QbHd6r7uKzxfwvY5kZ2KyuGd7kFMn4Lqi
 ATK0jodQy9pQ+bYtiMUzVQxwbUDodpB1gCfWR1lIx79GOcMd9fTANecmLQt3Vp7upP
 SYXMYDaOLeDD7HuI20aDoD93YTgHyi2QkWUsSOKZWy2M7MP8gU8+f/FsrqjFkvgkoR
 +gAz/tnuXhVTr71AyFAEvUTuXdjUNoH8JaLZkDSx0VYJO8VNC0ju1M3pbwWFLN7omD
 qXShNTvgFcxog==
Received: by mail-lf1-f71.google.com with SMTP id
 z29-20020a195e5d000000b003fd437f0e07so307941lfi.20
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 06:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
 b=twGjgWF2utjIP8LkjBJm2yaDZLeEeiC4R3QN4PSeD3Lla+wMeJEC0BHNy5GRt+qekG
 kTTfTnM/XPecBnwe7nKnllYoqQs84xjfQ69ywsoQW8pQr/1/hlDQvCFJPw7zwZs2bLLU
 y0IooTUYvzndXQazwXCldC3BOsW6KKvaaUmX5q1FTQWQjk54eHbiUynb+G0c+zZLoQLH
 VxCdpgazwFhbS+AcpeN0UfNfW37svQ5sUm7af9hF51rrRj6t+7JzA1hM57eaAYGkDMCm
 Eh7PePDF7afJL1ZebBKez9yxSEqduzC5lrGFo2NqHcvWv4EknARu65se49qpwoqPtweG
 ZahQ==
X-Gm-Message-State: AOAM531NlZ10mykBiKKIBdZm/DwqIxFxPGVv5PZtoTtJhPCly4NF8omM
 SzeqSgrQo4ubD24sfYEpfhjohggvzCwdYDCkK+loqw7yr7fPS2y3MOs7c9dIlulQulw+S8y59jR
 XsTi+fDdZe2VG+dyDloJEKzQhOW+jdeuwotOVvpi0PKmoEQ==
X-Received: by 2002:a05:6512:20ce:: with SMTP id
 u14mr5618491lfr.548.1634821791948; 
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Q8yU5QzJPLw3kvAdO+Jn8XVXoKvjIRiitatn+3XEGA9u7UY2LAfxyxt0u2Zf+taROiCpGQ==
X-Received: by 2002:a05:6512:20ce:: with SMTP id
 u14mr5618453lfr.548.1634821791675; 
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id r10sm539546ljp.56.2021.10.21.06.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Conor.Dooley@microchip.com, arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: olof@lixom.net, arm@kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
 <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
Date: Thu, 21 Oct 2021 15:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_060954_883043_DBBC5C55 
X-CRM114-Status: GOOD (  16.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021130950.A-RkHGG5mxPLKJmZJpgVQAjFb9KX5uU8SCiMKDfmdeA@z>

On 21/10/2021 15:06, Conor.Dooley@microchip.com wrote:
> On 21/10/2021 13:23, Arnd Bergmann wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> Hi Arnd and Olof,
>>>
>>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>>> unfortunately Palmer (RISC-V maintainer) did not respond here.
> 
> Out of curiosity which series is this one? Is it the one with the 
> plic/clint changes?
> Pretty sure that I have taken them in internally, but I am going to 
> submit a bunch
> of changes to our device tree soon (tm) and want to make sure I have the 
> right
> dependent series listed.
> 

There is only one Microchip patch here (plic/clint). Others are for
SiFive. All the patches are described in the pull reqeust:
https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/

I had also second set of RISC-V patches for Microchip. These were picked
up by Palmer:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
