Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB0CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:44:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7C364F58
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 18:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7C364F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3cLPIy07wACoNt2k/bV7I+Hj3UphTtLXMAKVlhvzRrw=; b=XmVeJWYBSv7nCBDf+74FsFe4z
	oMOT45m9ZPgLFUKNszRrEbSUnvnCffdl5T2iAh1ju0fEndQeFlWBunM7hzmFPMOr1EwBebCHNEEP3
	+kK2Jhe/t0PjKSkLu93IbXVG32U3rkpnIxEKGIy8wRVyRcD33ed/8M3c8RVhwt9JvTiuelFxqyWNk
	vCv7cIwuqew1r0Yh604Hp3998WSqnjXmxBTGJs8C9rVPrZamuOJjS3DHUo1p+Ju69LPUoxR1Iryy8
	tdWfKBHC6PeLDDN4jxIwmWmZ6mERxcMnwVV9p+UikjDNbzdhEVOuY4aiV5cYG/p6XVzJieOkKUELk
	dapKRyGeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jbU-00040d-UO; Thu, 04 Feb 2021 18:43:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jbP-0003zz-6r
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 18:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612464219; x=1644000219;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bLTbvpLrEHxq5RI+rYCa3j+E1tXZ1nPttjCvTxH1lBo=;
 b=ETj4cJWGWfDnF4hlGxMPl+8b3JZHgK7iCiWlouFIZSI38+qI+95sE2ZX
 4wrSUsiUIj3Wq3zvDEloArzW0sxdQPVcsQMyXx+DuE7Rp0cpyvHJU1SRP
 LQw+Yp/S88qekcvexp/3i8eKrgJ3OUO7X5hj/y1VwgS1UHZHIORHNlWOe
 E/GdaqdYh/gMjikBPC/X7TZUm2F3j3fN8FvbBwMwdjOig+r/sWKyXUD2w
 ORiWRqh5BGotbKLmDy5MnjBIU5IxzLE7AgMRgY80tnegPApvq0toXP+o+
 uSryFxOzcY1Jrw8kXEQtSRdZaktgNn8UE+s+R/TQ18HPbDx0yQRB+qgLL g==;
IronPort-SDR: eBql+5flRwgc+oDmGTlZF9RKUq4v1KWEeMtbEx4ZXLcJYkkofIYtx8AbnPU149a+52HFeWaWwy
 OqBtCZt5W4f1jRgAmbNCHQC+wTEf2qeuymTAJifC63KzX4wNqZcu6UOj9wiNc21lveeu/tVp0S
 TqiLjvljRimti5Iv/prihHIgIy3TCgs+d5XlrjQDhNAtwz3lxJFwRS1LJfTV0NFwcLHnj5qRWx
 hvZJs0Dz01fO8ix3KL4Wk4UOpSLcNWW/ev5F4CXRda1DSXWQLAYqtDTU7WeJ52A+Ecoelw//yH
 mEU=
X-IronPort-AV: E=Sophos;i="5.81,153,1610434800"; d="scan'208";a="102622916"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Feb 2021 11:43:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 4 Feb 2021 11:43:37 -0700
Received: from [10.171.246.84] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 4 Feb 2021 11:43:33 -0700
Subject: Re: [PATCH] ARM: at91: use proper asm syntax in pm_suspend
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>
References: <20210204160129.2249394-1-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <d5cc7f4f-ef4a-dbe6-6f87-918a1d96603e@microchip.com>
Date: Thu, 4 Feb 2021 19:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_134339_402618_E1F27F2E 
X-CRM114-Status: GOOD (  20.02  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204184332.A_tKo0h0EPD0D2Q_nhAVVHXnc3lf9CFnVUzX2LEY5sU@z>

On 04/02/2021 at 17:01, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compiling with the clang integrated assembler warns about
> a recently added instruction:
> 
> <instantiation>:14:13: error: unknown token in expression
>   ldr tmp1, =#0x00020010UL
> arch/arm/mach-at91/pm_suspend.S:542:2: note: while in macro instantiation
>   at91_plla_enable
> 
> Remove the extra '#' character that is not used for the 'ldr'
> instruction when doing an indirect load of a constant.
> 
> Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks!

Best regards,
   Nicolas

> ---
>   arch/arm/mach-at91/pm_suspend.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index 909856c8a8c6..0d467cc40129 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -446,7 +446,7 @@ ENDPROC(at91_backup_mode)
>          str     tmp1, [pmc, #AT91_PMC_PLL_UPDT]
> 
>          /* step 2. */
> -       ldr     tmp1, =#AT91_PMC_PLL_ACR_DEFAULT_PLLA
> +       ldr     tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
>          str     tmp1, [pmc, #AT91_PMC_PLL_ACR]
> 
>          /* step 3. */
> --
> 2.29.2
> 


-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
