Return-Path: <SRS0=5uJN=JL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC30C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Apr 2021 02:49:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A2761176
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Apr 2021 02:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A2761176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tL1ctFngi+sLHXSiya6DAUxu6iC0BngNPx9fYPHzfe0=; b=SoRxnnmK8VrFXbYO5QKrGXudr
	0wh7FarulNGI6RO+1cvQPgdmkbiXeDg3vJLKYoDC7fiZLKBPCPGxcv/BoNaXAUDP1jT/mc88bkmcL
	WXa28igKliT6OibBzVTFc1OVMuSir9q5l7MVkXRwggf3ENzoMXg0bgcF660C0lmyy+4IcrZYr6hyX
	OvbbAnrgXJ6ZvNhCJAHdtsOZwCbLZKXhOBs/zpBTgKAm6DlxMjN1eTjOFrM+FCl/AyRjeiVrSDVwD
	0doaKFFxJyAH9amiUnaiM6+SeBZ2r33TpCcVDPLWKOCCeIYLOgnBqfnLMmcjyS+k35WU1yTKRY0nO
	41Kj9Ah6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWVYt-00BE4U-Vi; Wed, 14 Apr 2021 02:47:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWVYl-00BE3Z-9B
 for linux-arm-kernel@desiato.infradead.org; Wed, 14 Apr 2021 02:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uODSff3t2JSJqxFmEXfapBv0QkFqQwxecfMeix/4Xhg=; b=Cll72RNOKl70nDDMPm/gY7BzpG
 UieJOmqGvEYJj4QrwfzlPnlJ643r2xKpJnwpbbCtwwfzRlHFnWYgTqWI1l0zzFGsqfTWnoAIsfYDA
 frDxBtw74p0YPdA8WZtw8P2TpFuMS5yefyO07U4XhmYKQWp3lWuVXVz+wxck9FPBKTkKih9cVcLZx
 8M6+1lx04y0j4BUYHEa8CPpukozfbR90sJKEx/zYxsNAbZBTdQVD1eWxO7a2QnCBflGF9Eq7nSCe7
 UVTGFRc+ZLz4ggXyWWdvmUJ4eu51VrOo2OeIITt1ke0DmUG3HZY2fSLXe0Los05ZqutrFn5x3fA2w
 qDvaW5+g==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWVYi-007Rvr-AV
 for linux-arm-kernel@lists.infradead.org; Wed, 14 Apr 2021 02:47:17 +0000
Received: by mail-oi1-x233.google.com with SMTP id b3so4350755oie.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 13 Apr 2021 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uODSff3t2JSJqxFmEXfapBv0QkFqQwxecfMeix/4Xhg=;
 b=P631JNgnQJKoJT8k6iHyWS7SzFFegwexZ5mGAB0sXUE72L34HvEEPtiui3W8wiF66n
 Jz2ToTYX9M7FP2i8S55NnkOKm1+dMPsDhmqiI1r5bpkqYDVPYs0owyzAsMue/jaSexiZ
 oxTpGenbTauS11vt8itGtCITFUclDK19hQcE7vbfhNxP1xfEf+oMCqtHB5I/ap+UNSYj
 6dbIHY3Vz7LCTi73Fvz3l7Nst75fUkFpglYJ6ic8qDYrdnemFLzVAMq3H3voe8ZQA5UX
 qXlBw64+l7aF37B3D5J98D3ekBK64uBltk3nQke/OwQQ1t79rMCXW/nLwpfQK5wKmbat
 tIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uODSff3t2JSJqxFmEXfapBv0QkFqQwxecfMeix/4Xhg=;
 b=cpT0xupOg0XREheCFQGub/78sKwQgG+G0to7v9/tgiHe9bZ4RMAtXz1yLMZt7jE/Uw
 xTSlHVWK/xaK84qWq+beJzRYY2MayWrOM/jBe+sjr24OP512+CdH+yO3JD2pthVA15ql
 1O6ykWE5+6N9B3jF8tbzyPbVUp6UG82IlzC0LrXDvJ297tjABZie40AWh0fOeblKuSwd
 W6zoGASTFjEM+4uHrVteB4hKpIU3KXQiS461jhzgnzPtLrU2AwyX4aj8/Nnz03z8kXs6
 cfEdw+xP7mZuBwlMZwxWriX666sZuG9WXFHV7dGUfexi0wZgSNq7l3PacCuFnOlEGmaR
 +Jdg==
X-Gm-Message-State: AOAM5331UmAf8fkn0Ea4/tx6I1Xe4UDe8eb0orbdoQ8gtaUb215nhddj
 KypMSF8zbneXrxykXKTf9+5o+w==
X-Google-Smtp-Source: ABdhPJyeMBwF8/BA758z0/LHS5xbw4Go//yuABYqrtdJI4syuogqUsBuF6MJaujiZAkbPIidsVRktQ==
X-Received: by 2002:aca:1312:: with SMTP id e18mr649250oii.153.1618368435099; 
 Tue, 13 Apr 2021 19:47:15 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id b12sm3845680oti.17.2021.04.13.19.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 19:47:14 -0700 (PDT)
Date: Tue, 13 Apr 2021 21:47:12 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux@armlinux.org.uk, will@kernel.org, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] ARM: kernel: Fix interrupted SMC calls
Message-ID: <20210414024712.GX1538589@yoga>
References: <20210326182237.47048-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326182237.47048-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_194716_417848_D9E9662A 
X-CRM114-Status: GOOD (  23.32  )
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
Message-ID: <20210414024712.JdurpuwZ3Q94vW2-8EC9WGgOLjkYfowgiIDVITfKeOo@z>

On Fri 26 Mar 13:22 CDT 2021, Manivannan Sadhasivam wrote:

> On Qualcomm ARM32 platforms, the SMC call can return before it has
> completed. If this occurs, the call can be restarted, but it requires
> using the returned session ID value from the interrupted SMC call.
> 
> The ARM32 SMCC code already has the provision to add platform specific
> quirks for things like this. So let's make use of it and add the
> Qualcomm specific quirk (ARM_SMCCC_QUIRK_QCOM_A6) used by the QCOM_SCM
> driver.
> 
> This change is similar to the below one added for ARM64 a while ago:
> commit 82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")
> 
> Without this change, the Qualcomm ARM32 platforms like SDX55 will return
> -EINVAL for SMC calls used for modem firmware loading and validation.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v3:
> 
> * Rebased on top of v5.12-rc2
> * Sent to SoC list since there was no review so far apart from initial one
>   by Russel
> 
> Changes in v2:
> 
> * Preserved callee saved registers and used the registers r4, r5 which
>   are getting pushed onto the stack.
> 
>  arch/arm/kernel/asm-offsets.c |  3 +++
>  arch/arm/kernel/smccc-call.S  | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
> index be8050b0c3df..70993af22d80 100644
> --- a/arch/arm/kernel/asm-offsets.c
> +++ b/arch/arm/kernel/asm-offsets.c
> @@ -24,6 +24,7 @@
>  #include <asm/vdso_datapage.h>
>  #include <asm/hardware/cache-l2x0.h>
>  #include <linux/kbuild.h>
> +#include <linux/arm-smccc.h>
>  #include "signal.h"
>  
>  /*
> @@ -148,6 +149,8 @@ int main(void)
>    DEFINE(SLEEP_SAVE_SP_PHYS,	offsetof(struct sleep_save_sp, save_ptr_stash_phys));
>    DEFINE(SLEEP_SAVE_SP_VIRT,	offsetof(struct sleep_save_sp, save_ptr_stash));
>  #endif
> +  DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
> +  DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
>    BLANK();
>    DEFINE(DMA_BIDIRECTIONAL,	DMA_BIDIRECTIONAL);
>    DEFINE(DMA_TO_DEVICE,		DMA_TO_DEVICE);
> diff --git a/arch/arm/kernel/smccc-call.S b/arch/arm/kernel/smccc-call.S
> index 00664c78faca..931df62a7831 100644
> --- a/arch/arm/kernel/smccc-call.S
> +++ b/arch/arm/kernel/smccc-call.S
> @@ -3,7 +3,9 @@
>   * Copyright (c) 2015, Linaro Limited
>   */
>  #include <linux/linkage.h>
> +#include <linux/arm-smccc.h>
>  
> +#include <asm/asm-offsets.h>
>  #include <asm/opcodes-sec.h>
>  #include <asm/opcodes-virt.h>
>  #include <asm/unwind.h>
> @@ -27,7 +29,14 @@ UNWIND(	.fnstart)
>  UNWIND(	.save	{r4-r7})
>  	ldm	r12, {r4-r7}
>  	\instr
> -	pop	{r4-r7}
> +	ldr	r4, [sp, #36]
> +	cmp	r4, #0
> +	beq	1f			// No quirk structure
> +	ldr     r5, [r4, #ARM_SMCCC_QUIRK_ID_OFFS]
> +	cmp     r5, #ARM_SMCCC_QUIRK_QCOM_A6
> +	bne	1f			// No quirk present
> +	str	r6, [r4, #ARM_SMCCC_QUIRK_STATE_OFFS]
> +1:	pop	{r4-r7}
>  	ldr	r12, [sp, #(4 * 4)]
>  	stm	r12, {r0-r3}
>  	bx	lr
> -- 
> 2.25.1
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
