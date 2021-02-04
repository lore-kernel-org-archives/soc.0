Return-Path: <SRS0=X+d+=HG=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D9EC433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 18:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B00AB64F65; Thu,  4 Feb 2021 18:43:39 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F046864F58;
	Thu,  4 Feb 2021 18:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F046864F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
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
   uSryFxOzcY1Jrw8kXEQtSRdZaktgNn8UE+s+R/TQ18HPbDx0yQRB+qgLL
   g==;
IronPort-SDR: eBql+5flRwgc+oDmGTlZF9RKUq4v1KWEeMtbEx4ZXLcJYkkofIYtx8AbnPU149a+52HFeWaWwy
 OqBtCZt5W4f1jRgAmbNCHQC+wTEf2qeuymTAJifC63KzX4wNqZcu6UOj9wiNc21lveeu/tVp0S
 TqiLjvljRimti5Iv/prihHIgIy3TCgs+d5XlrjQDhNAtwz3lxJFwRS1LJfTV0NFwcLHnj5qRWx
 hvZJs0Dz01fO8ix3KL4Wk4UOpSLcNWW/ev5F4CXRda1DSXWQLAYqtDTU7WeJ52A+Ecoelw//yH
 mEU=
X-IronPort-AV: E=Sophos;i="5.81,153,1610434800"; 
   d="scan'208";a="102622916"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Feb 2021 11:43:37 -0700
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
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd
	<sboyd@kernel.org>, <clang-built-linux@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210204160129.2249394-1-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <d5cc7f4f-ef4a-dbe6-6f87-918a1d96603e@microchip.com>
Date: Thu, 4 Feb 2021 19:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204160129.2249394-1-arnd@kernel.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

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
