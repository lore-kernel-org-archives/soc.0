Return-Path: <SRS0=yaRN=IH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2D0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Mar 2021 09:59:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336C865101
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Mar 2021 09:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336C865101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9al06VtpWqBbD1m3VssI4HakPYoGEJXUdCOaGK4/V0=; b=Za8eWkK1SdfC6JgjXZnUdZQ8h
	YGpCoVfQCLdZitKewxd/Zo+C1C3JmnvxsSljqm+ceQvxHTT8rp4+K60fIXhlZwS2CGNXAGN1Ldu+w
	Q1onkWEkaAjvA/mmlODDAk/hE6D8xGe0RxHHeh3UBLysgzSuflTfJdEBaIN/25HXD1+wfB5KdXf16
	UkvW59LbWSzld3N5NvB71n0sZ+N7ZmUO6aUIUhosIHog1ySuJGbLeZO/28P6CuUm0N+K0NqmrL0lw
	PP8D/xFDmJ7KlF56XY32jRtkibEXSkf5U1ZTjTMbez0jHxDabAD8aEJ4Ne0VbxFQnHFY47j/SLo7I
	4vRStN5yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJZ7c-0049cS-Jx; Tue, 09 Mar 2021 09:57:48 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJZ7X-0049c8-4W
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Mar 2021 09:57:45 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 17CE9802C;
 Tue,  9 Mar 2021 09:58:22 +0000 (UTC)
Date: Tue, 9 Mar 2021 11:57:37 +0200
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: omap1: fix building with clang IAS
Message-ID: <YEdGkZlCDdhKP6cw@atomide.com>
References: <20210308153430.2530616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308153430.2530616-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_095743_465450_1AB7DE8C 
X-CRM114-Status: GOOD (  14.13  )
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
Message-ID: <20210309095737.ZakBPD6Hp-EM9X9WzNXCZ-Krn8F1_Cmanyl5c-BWb3M@z>

* Arnd Bergmann <arnd@kernel.org> [210308 15:35]:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The clang integrated assembler fails to build one file with
> a complex asm instruction:
> 
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> 
> The problem is that 'NR_IRQS_LEGACY' is not defined here. Apparently
> gas does not care because we first add and then subtract this number,
> leading to the immediate value to be the same regardless of the
> specific definition of NR_IRQS_LEGACY.
> 
> Neither the way that 'gas' just silently builds this file, nor the
> way that clang IAS makes nonsensical suggestions for how to fix it
> is great. Fortunately there is an easy fix, which is to #include
> the header that contains the definition.

Acked-by: Tony Lindgren <tony@atomide.com>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
