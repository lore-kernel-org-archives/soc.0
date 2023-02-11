Return-Path: <masahiroy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB035C61DA4
	for <soc@archiver.kernel.org>; Sat, 11 Feb 2023 07:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA9D6C433AA; Sat, 11 Feb 2023 07:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9149EC433A0;
	Sat, 11 Feb 2023 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676101059;
	bh=Z9eVf919g18vzYQxiw0LjSfvw8t+P2BpKroiK84EFMo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WB06BrENR43xNXaXgsqg9MSKqNR+ciSWbN7CBda4m6NUyzo+SLWLGGuQUOmT0/g3M
	 FEKd8gIETU7WCL3XQjjB/2s2vGvPU8FNfkCdkFxJSw7Z1shmfXW4+45tZSsnen4E+q
	 m4HLg+doLlQhZszOBb6Amz2eZGRXhImUeSoQHID94mE12w3DSnCZFDk0ZNhXZAkfdp
	 qdzg++OxVGQ33h/sNvmKUwZfIrxijU57tubkCkm2BBZm3/wNQ6Sm/TeOH/w3R00YO5
	 xKwd8WzhQM0P1gnS5zfndIVSp33qVDHbzEY5fS1Fp3XN1T2pPJOnCPm7hA5JSqZ2Ug
	 dTjO24HCBB/yw==
Received: by mail-ot1-f42.google.com with SMTP id 38-20020a9d04a9000000b0068f24f576c5so1957103otm.11;
        Fri, 10 Feb 2023 23:37:39 -0800 (PST)
X-Gm-Message-State: AO0yUKU2u5TQNZ419fFT2vRymRb82yyAehBAdZ8F4NLtw2YFBzLHKK70
	NIvx5qANkLWUxyu+5/eZAO9We0mWVhd5/BqCLzY=
X-Google-Smtp-Source: AK7set8MvYPgMamkm6vHJVfjZDqgOBeUmq43ZvfLGg5ghGq9sPrJhYREck6y1h1Wc/WBcnmSbiomb6oC7BfeUWQ/eIA=
X-Received: by 2002:a05:6830:1e8e:b0:68b:c6be:bc3d with SMTP id
 n14-20020a0568301e8e00b0068bc6bebc3dmr1515687otr.59.1676101058735; Fri, 10
 Feb 2023 23:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org> <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
In-Reply-To: <20230203-arm64-defconfigs-v1-3-cd0694a05f13@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Feb 2023 16:37:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
Message-ID: <CAK7LNASRz-apG_pNwvNOqxXy+-tp+WGHV--g6yYU-UQnZx5tgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: configs: Add virtconfig
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 4:54 AM Mark Brown <broonie@kernel.org> wrote:
>
> Provide a slimline configuration intended to be booted on virtual
> machines, with the goal of providing a light configuration which will
> boot on and enable features available in mach-virt.  This is defined in
> terms of the standard defconfig, with an additional virt.config fragment
> which disables options unneeded in a virtual configuration.
>
> As a first step we just disable all the ARCH_ configuration options,
> disabling the build of all the SoC specific drivers.  This results in a
> kernel that builds about 25% faster in my testing, if this approach
> works for people we can add further options.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/Makefile            |  6 ++++++
>  arch/arm64/configs/virt.config | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index c33b5da95b4a..2d49aea0ff67 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -205,6 +205,12 @@ ifdef CONFIG_COMPAT_VDSO
>  endif
>  endif
>
> +include $(srctree)/scripts/Makefile.defconf
> +
> +PHONY += virtconfig
> +virtconfig:
> +       $(call merge_into_defconfig_override,defconfig,virt)
> +
>  define archhelp
>    echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
>    echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
> diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
> new file mode 100644
> index 000000000000..6ef0a739717f
> --- /dev/null
> +++ b/arch/arm64/configs/virt.config
> @@ -0,0 +1,39 @@
> +# CONFIG_ARCH_ACTIONS is not set
> +# CONFIG_ARCH_SUNXI is not set
> +# CONFIG_ARCH_ALPINE is not set
> +# CONFIG_ARCH_APPLE is not set
> +# CONFIG_ARCH_BCM is not set
> +# CONFIG_ARCH_BCM2835 is not set
> +# CONFIG_ARCH_BCMBCA is not set
> +# CONFIG_ARCH_BCM_IPROC is not set
> +# CONFIG_ARCH_BERLIN is not set
> +# CONFIG_ARCH_BRCMSTB is not set
> +# CONFIG_ARCH_EXYNOS is not set
> +# CONFIG_ARCH_K3 is not set
> +# CONFIG_ARCH_LAYERSCAPE is not set
> +# CONFIG_ARCH_LG1K is not set
> +# CONFIG_ARCH_HISI is not set
> +# CONFIG_ARCH_KEEMBAY is not set
> +# CONFIG_ARCH_MEDIATEK is not set
> +# CONFIG_ARCH_MESON is not set
> +# CONFIG_ARCH_MVEBU is not set
> +# CONFIG_ARCH_NXP is not set
> +# CONFIG_ARCH_MXC is not set
> +# CONFIG_ARCH_NPCM is not set
> +# CONFIG_ARCH_QCOM is not set
> +# CONFIG_ARCH_RENESAS is not set
> +# CONFIG_ARCH_ROCKCHIP is not set
> +# CONFIG_ARCH_S32 is not set
> +# CONFIG_ARCH_SEATTLE is not set
> +# CONFIG_ARCH_INTEL_SOCFPGA is not set
> +# CONFIG_ARCH_SYNQUACER is not set
> +# CONFIG_ARCH_TEGRA is not set
> +# CONFIG_ARCH_TESLA_FSD is not set
> +# CONFIG_ARCH_SPRD is not set
> +# CONFIG_ARCH_THUNDER is not set
> +# CONFIG_ARCH_THUNDER2 is not set
> +# CONFIG_ARCH_UNIPHIER is not set
> +# CONFIG_ARCH_VEXPRESS is not set
> +# CONFIG_ARCH_VISCONTI is not set
> +# CONFIG_ARCH_XGENE is not set
> +# CONFIG_ARCH_ZYNQMP is not set
>
> --
> 2.30.2
>



Yeah, I have a _local_ script to apply
a similar config fragragment.

When I run QEMU, I disable unneeded CONFIG_ARCH_*,
and also disable unneeded sub-systems.

Not only me, many people are doing similar in their local env,
I guess.


Of course, I will not upstream my set of CONFIG options
since it is just my preference.
After all, this depends on people in my opinion.


BTW, the minimal set for booting + minimal features
might be similar to what Buildroot provides?
I do not know... It booted at least when I tried some years ago.

https://github.com/buildroot/buildroot/blob/master/board/qemu/aarch64-virt/linux.config






--
Best Regards
Masahiro Yamada
