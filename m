Return-Path: <SRS0=kiSH=2L=google.com=ndesaulniers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF913C433F5
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 16:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98392C433D7; Mon, 10 Oct 2022 16:44:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B745DC433B5
	for <soc@kernel.org>; Mon, 10 Oct 2022 16:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B745DC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f45.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso11976372pjq.1
        for <soc@kernel.org>; Mon, 10 Oct 2022 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=anf2u1EbUOW94hW1mECFJfimfAQsErLr0AHCvxvjmdk=;
        b=Dy8KkpWEM4viPKcw92pWH9OkrFjFTq+0m4ithX9J6aDaD6+HydyU+UAmJw013gXhoX
         mJbm707DHRTRw7yA4lkBJC8ai6XTkgxlcj+dS9JufldckCu3ifKgGIXfE3zz88014G8P
         DXhQxmRn9Evt46YcrhuH6IYopCmZZD2jLP1XyDMGp0HVBbXolBQ79AOu4L6KpGDHayoo
         zrarz1iSslRJV7g8vj7IrQTvDdsHHCWC8vvqksfe9bBTmAcRuq5+Yte3g7NQU/NmPUMP
         PN4j2Nuy6ofSadM570VOxEDGdoVkjoUFAblgvGHAsvhQ218hCJh4CFJYVcKGJKGvTVEw
         FK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anf2u1EbUOW94hW1mECFJfimfAQsErLr0AHCvxvjmdk=;
        b=YsqXoRnHPCKTalxieXGUAa21i0rKsilwkHz20Xb+bWeU5CmKjO4P37MiXURrXCNgQP
         WEgtR4tDcRSPJleq1lIKbiEJzkoP4Vsm8dqECB0GodtmX01Tub5/orxuA+G13upzNcQH
         x1e9DihiNki3wsSmXexQKVR4EA1FL/a3/MBF09xGchCIHkvT0Nuf3Pdya7IvL1ORFGYJ
         ZqSOp/5QERAN/xHFswLyK02+KQRtN3lgzVZT2PYLEMcQclRw1arWoidnb82ScCoBTKMZ
         KC6cc3mgDMYOish514sMeWptDIC3DeO5CQ6NT4VBGxpbzKuWRB2H2MHrpIfeW1577Tl/
         N/5Q==
X-Gm-Message-State: ACrzQf3M2fJYLznnQrXNeqmHOvohBfKHV3GdfrCQfP3NJVUEsY8bllcC
	OmSBbftzPewnBUcM/3zUH1roB1uovJBhb+2uv9m+nQ==
X-Google-Smtp-Source: AMsMyM4Qvyn2KkVMESz39nPlRCBM18juvwRx/yYvOtyFXZF5TAbCx3+mr8Oo3PF8mfWyuGM6quJltqY8u49ijI+NewA=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr19349499plr.33.1665420276986; Mon, 10
 Oct 2022 09:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
In-Reply-To: <bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 09:44:25 -0700
Message-ID: <CAKwvOdkH89GbKiymi7O2_XekQwC2zYVTUfKYg1v2nzG081p7=Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: spear6xx: Staticize few definitions
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 9, 2022 at 9:11 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Fix warnings with clang like:
>
> arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]
>
> by making few definitions static.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Rebased on v6.0.
>
>  arch/arm/mach-spear/spear6xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-spear/spear6xx.c b/arch/arm/mach-spear/spear6xx.c
> index 58183493e06d..7a5fff134872 100644
> --- a/arch/arm/mach-spear/spear6xx.c
> +++ b/arch/arm/mach-spear/spear6xx.c
> @@ -339,7 +339,7 @@ static struct pl08x_platform_data spear6xx_pl080_plat_data = {
>   * 0xD0000000          0xFD000000
>   * 0xFC000000          0xFC000000
>   */
> -struct map_desc spear6xx_io_desc[] __initdata = {
> +static struct map_desc spear6xx_io_desc[] __initdata = {
>         {
>                 .virtual        = (unsigned long)VA_SPEAR6XX_ML_CPU_BASE,
>                 .pfn            = __phys_to_pfn(SPEAR_ICM3_ML1_2_BASE),
> @@ -359,12 +359,12 @@ struct map_desc spear6xx_io_desc[] __initdata = {
>  };
>
>  /* This will create static memory mapping for selected devices */
> -void __init spear6xx_map_io(void)
> +static void __init spear6xx_map_io(void)
>  {
>         iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
>  }
>
> -void __init spear6xx_timer_init(void)
> +static void __init spear6xx_timer_init(void)
>  {
>         char pclk_name[] = "pll3_clk";
>         struct clk *gpt_clk, *pclk;
> @@ -394,7 +394,7 @@ void __init spear6xx_timer_init(void)
>  }
>
>  /* Add auxdata to pass platform data */
> -struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
> +static struct of_dev_auxdata spear6xx_auxdata_lookup[] __initdata = {
>         OF_DEV_AUXDATA("arm,pl080", SPEAR_ICM3_DMA_BASE, NULL,
>                         &spear6xx_pl080_plat_data),
>         {}
> --
> 2.31.1.272.g89b43f80a514
>


-- 
Thanks,
~Nick Desaulniers
