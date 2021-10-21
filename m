Return-Path: <SRS0=i2pQ=PJ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7FBC433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 11:31:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EB04F60F56; Thu, 21 Oct 2021 11:30:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B9160EFE;
	Thu, 21 Oct 2021 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09B9160EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKbwg-1mP8fM0fJE-00Kv9n; Thu, 21 Oct 2021 13:30:56 +0200
Received: by mail-wr1-f42.google.com with SMTP id e12so575539wra.4;
        Thu, 21 Oct 2021 04:30:56 -0700 (PDT)
X-Gm-Message-State: AOAM530CXKV5TdB8UC3yJAekmuCtTfwKHu2GrEaQXMZOQVub57uhQchX
	q0idxZcJH9R/9Up6spuGq8xmC4lP3hghfcauWHs=
X-Google-Smtp-Source: ABdhPJzcazkfKoonw6SZah3e238itbP12J74p79Qz07ksYN7hvsrDFAzWhgeXXpFqRr6x5tkdlMCty5l3RadM5Cj6F0=
X-Received: by 2002:adf:d0c6:: with SMTP id z6mr5050441wrh.336.1634815855802;
 Thu, 21 Oct 2021 04:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211018121324.GA2943530@jade>
In-Reply-To: <20211018121324.GA2943530@jade>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 13:30:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Z-Hh9xav1peg8LqGoPaHnrt9eo453QmwKrWcWwWAEXw@mail.gmail.com>
Message-ID: <CAK8P3a0Z-Hh9xav1peg8LqGoPaHnrt9eo453QmwKrWcWwWAEXw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE FF-A for V5.16
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MDXkwUeC8CmEtfhlBPghmGeYH8GIy7gaqRA1dhNTpDR9UPHe7RS
 0I9P6WU4gBYf1k3Ss5ll/Td09oQ4DVMcGySTghw0bIYG5kXV1nlnmt7+6jVFb6MoaiY5n2r
 Z243R6JHCcgk23CpX9INtzKjismowB5csJhT0elkbfeKz1x0SawVYCbOHW4kudT+1fSfQv/
 d6ypmih3uB+c0f7Wdyqwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LruSMZaPkzg=:ZXomJSpZUDmqeOF9QWIlyy
 uDgbUB9M8bLZyWbPZNCAhGt6VDABznr2KC9qmRUsKmHoICJcNjMTb2lhVBmhcbNt7vmGS8a0K
 Jz+NP1BVI9uPTTpTlyHNBmfY0BUKJG8BS4yREDhN+kFFnFSKF0GhlHVU/Ipd2VKDYpYPycSZM
 jfi3bqs1ejhViX/1gOJGK/HKmunow76NTf/YsJO3Uaa/bD/mIqWRRk0t926LCdp3gNLrfEHR5
 Ezk6p8j9slbE8h7rr+ty2q4lnI0GPoP/NyF1D/BJ3keYHKd85VCZaTuW9Y+mn5Nzt1VfrQ6WD
 j/ECeiFLq/YlkEm4uyXv3psU/tLi+aPGClB20SKHQ7GmOQcVE7mFe/0q2/fSyk64c5VJG2BDC
 qoEJPE5dR1PirR5LNc/YumJ7bukzLfAaJ8br/E/jCvK4FdLB1FnwPDPWs2iDFbIqNNDxi94ZO
 a71/YRXa7nasq0CV71hqXdgAbA9/oJGda2jxGUsK5p2KXG7ZsnwFEuT22jMo9jGN+YF3xO0hx
 mff5uS+SmtQBR626gRU2d6/4RO1UtqY2Mg2Vk6bKrl3h4qbeEet8xD8+nmoFC6QIjkA77/HDs
 d+nrSQfVnWOhu9XSQRGkejaaCsfWC4UMIoWuEOLy0bJAhfJr8F6OmOylzApa6dKXN75VZpxm+
 sOi/KwtjBPPjc+djTQCzCP7K5IJJL86O/QIHrdjc9gobmG+ZqjnLy/ucDVRYotaGBnZ0=

On Mon, Oct 18, 2021 at 2:13 PM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>       optee: isolate smc abi

This one caused a randconfig build regression on 32-bit arm:

/git/arm-soc/drivers/tee/optee/smc_abi.c:405:15: error: implicit
declaration of function 'page_to_section'
[-Werror,-Wimplicit-function-declaration]
        optee_page = page_to_phys(*pages) +
                     ^
/git/arm-soc/arch/arm/include/asm/memory.h:148:43: note: expanded from
macro 'page_to_phys'
#define page_to_phys(page)      (__pfn_to_phys(page_to_pfn(page)))
                                               ^
/git/arm-soc/include/asm-generic/memory_model.h:52:21: note: expanded
from macro 'page_to_pfn'
#define page_to_pfn __page_to_pfn
                    ^
/git/arm-soc/include/asm-generic/memory_model.h:35:14: note: expanded
from macro '__page_to_pfn'
        int __sec = page_to_section(__pg);                      \
                    ^
/git/arm-soc/drivers/tee/optee/smc_abi.c:405:15: note: did you mean
'__nr_to_section'?
/git/arm-soc/arch/arm/include/asm/memory.h:148:43: note: expanded from
macro 'page_to_phys'
#define page_to_phys(page)      (__pfn_to_phys(page_to_pfn(page)))
                                               ^
/git/arm-soc/include/asm-generic/memory_model.h:52:21: note: expanded
from macro 'page_to_pfn'
#define page_to_pfn __page_to_pfn
                    ^
/git/arm-soc/include/asm-generic/memory_model.h:35:14: note: expanded
from macro '__page_to_pfn'
        int __sec = page_to_section(__pg);                      \
                    ^
/git/arm-soc/include/linux/mmzone.h:1365:35: note: '__nr_to_section'
declared here
static inline struct mem_section *__nr_to_section(unsigned long nr)

I have not investigated it, but it's probably trivial. Can have a look
and send a fix to
soc@kernel.org?

      Arnd
